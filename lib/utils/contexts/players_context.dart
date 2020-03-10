import 'package:flutter/material.dart';
import 'package:flutter_soccer_migration/utils/consts/consts.dart';
import 'package:flutter_soccer_migration/utils/mocks/mock_players.dart';
import 'package:flutter_soccer_migration/utils/models/player.dart';
import 'package:flutter_soccer_migration/utils/players/rotation_algo.dart';

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
    return context.dependOnInheritedWidgetOfExactType<_InheritedPlayersContext>().data;
  }

  @override
  PlayersContextState createState() => new PlayersContextState(players);
}

class PlayersContextState extends State<PlayersContext> {
  List<Player> players;

  List<Player> playersOnGame;
  List<Player> playersOnBench;
  List<Player> unavailablePlayers;
  List<Player> absentPlayers;

  PlayersContextState(this.players) {
    playersOnBench = players;
    playersOnGame = new List<Player>();
    unavailablePlayers = new List<Player>();
    absentPlayers = new List<Player>();

    unavailablePlayers.add(new Player(name: "Pierre-Bertrand Jérémie", surname: "surname", number: 123, assetPath: Consts.PLAYER_ASSET_PATHS.first));
  }

  List<Player> getAllPlayers() {
    /*return Firestore.instance
        .collection('players')
        .snapshots().listen();*/
    return players;
  }

  void addPlayerOnGame(Player player) {
    setState(() {
      playersOnBench.removeWhere((p) => p.id == player.id);

      if (!playersOnGame.any((p) => p.id == player.id)) playersOnGame.add(player);
    });
  }

  void addPlayerOnBench(Player player) {
    setState(() {
      playersOnGame.removeWhere((p) => p.id == player.id);
      unavailablePlayers.removeWhere((p) => p.id == player.id);
      absentPlayers.removeWhere((p) => p.id == player.id);

      if (!playersOnBench.any((p) => p.id == player.id)) playersOnBench.add(player);
    });
  }

  void addUnavailablePlayer(Player player) {
    setState(() {
      playersOnGame.removeWhere((p) => p.id == player.id);
      playersOnBench.removeWhere((p) => p.id == player.id);

      if (!unavailablePlayers.any((p) => p.id == player.id)) unavailablePlayers.add(player);
    });
  }

  void addAbsentPlayer(Player player) {
    setState(() {
      playersOnGame.removeWhere((p) => p.id == player.id);
      playersOnBench.removeWhere((p) => p.id == player.id);

      if (!absentPlayers.any((p) => p.id == player.id)) absentPlayers.add(player);
    });
  }

  void rotate(numberOfPlayersRotating) {
    if (numberOfPlayersRotating > 0) {
      RotationAlgo.rotate(playersOnBench, playersOnGame, numberOfPlayersRotating);
      setState(() {});
    }
  }

  void addPlayer(Player player) {
    if (player != null) {
      if (player.assetPath == null) player.assetPath = "assets/players/character_1a.png";
      players.add(player);
      setState(() {});
    }
  }

  void updatePlayer(Player player, String name, String surname, int number, String assetPath) {
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
        addPlayer(new Player(name: name, surname: surname, number: number, assetPath: assetPath));
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
