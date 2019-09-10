import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quick_lineup/utils/mocks/mock_players.dart';
import 'package:quick_lineup/utils/models/player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PlayersContext extends StatefulWidget {
  final Widget child;
  List<Player> players;

  PlayersContext({@required this.child, this.players}) {
    if (players == null) {
      /*players = new List<Player>();
      Firestore.instance
          .collection('players')
          .snapshots()
          .listen((data) =>
          data.documents.forEach((doc) => players.add(Player.fromSnapshot(doc))));*/
      players = MockPlayers.dummySnapshot.map((x) => Player.fromMap(x)).toList();
      
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

  List<Player> _playersOnGame;
  List<Player> _playersOnBench;
  List<Player> _unavailablePlayers;

  List<Player> getAllPlayers(){
    /*return Firestore.instance
        .collection('players')
        .snapshots().listen();*/
    return players;
  }

  List<Player> getPlayersOnGame(int numberOfPlayers){
    return _playersOnGame;
  }

  List<Player> getPlayersOnBench(){
    return _playersOnBench;
  }

  void rotate(numberOfPlayersRotating) {
    if (numberOfPlayersRotating > 0) {
      setState(() {
        int startRange = 0;
        int endRange = numberOfPlayersRotating;

        for(Player p in _playersOnGame)
          _playersOnBench.add(p);

        if (endRange > _playersOnBench.length) endRange = _playersOnBench.length;
        var temp = _playersOnBench.getRange(startRange, endRange);

        _playersOnGame = temp.toList();
        _playersOnBench.removeRange(startRange, endRange);
      });
    }
  }

  PlayersContextState(this.players){
    _playersOnBench = players;
    _playersOnGame = new List<Player>();
    _unavailablePlayers = new List<Player>();
  }

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
