import 'package:flutter/material.dart';
import 'package:quick_lineup/utils/mocks/mock_players.dart';
import 'package:quick_lineup/utils/models/player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PlayersContext extends StatefulWidget {
  final Widget child;
  List<Player> players;

  PlayersContext({@required this.child, this.players}) {
    if (players == null) {
      players = MockPlayers.dummySnapshot.map((data) => Player.fromMap(data)).toList();
      //players = Firestore.instance.collection('players').snapshots()
    }
  }

  static PlayersContextState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_InheritedPlayersContext)
            as _InheritedPlayersContext)
        .data;
  }

  @override
  PlayersContextState createState() => new PlayersContextState(players);
}

class PlayersContextState extends State<PlayersContext> {
  List<Player> players;

  void rotate(numberOfPlayersRotating) {
    if (numberOfPlayersRotating > 0) {
      setState(() {
        int startRange = 0;
        int endRange = numberOfPlayersRotating;
        if (endRange > players.length) endRange = players.length;
        var temp = players.getRange(startRange, endRange);
        players.addAll(temp);
        players.removeRange(startRange, endRange);
      });
    }
  }

  PlayersContextState(this.players);

  void addPlayer(Player player) {
    if (player != null) {
      if(player.assetPath == null)
        player.assetPath = "assets/players/character_1a.png";
      players.add(player);
      setState(() {});
    }
  }

  void updatePlayer(Player player, String name, String surname, int number,
      String assetPath) {
    if (player != null) {
      Player pFound = players.firstWhere((p) => p == player);
      if (pFound != null) {
        setState(() {
          pFound.name = name ?? pFound.name;
          pFound.surname = surname ?? pFound.surname;
          pFound.number = number ?? pFound.number;
          pFound.assetPath = assetPath ?? pFound.assetPath;
        });
      } else {
        addPlayer(new Player(
            name: name,
            surname: surname,
            number: number,
            assetPath: assetPath));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return new _InheritedPlayersContext(
      data: this,
      child: widget.child,
    );
  }
}

class _InheritedPlayersContext extends InheritedWidget {
  final PlayersContextState data;

  _InheritedPlayersContext({
    Key key,
    @required this.data,
    @required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_InheritedPlayersContext old) => true;
}
