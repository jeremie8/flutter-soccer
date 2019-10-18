import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quick_lineup/utils/consts/consts.dart';
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

  List<Player> playersOnGame;
  List<Player> playersOnBench;
  List<Player> unavailablePlayers;
  List<Player> absentPlayers;


  PlayersContextState(this.players){
    playersOnBench = players;
    playersOnGame = new List<Player>();
    unavailablePlayers = new List<Player>();
    absentPlayers = new List<Player>();

    unavailablePlayers.add(new Player(name : "name", surname : "surname", number: 123, assetPath:Consts.PLAYER_ASSET_PATHS.first));
  }

  List<Player> getAllPlayers(){
    /*return Firestore.instance
        .collection('players')
        .snapshots().listen();*/
    return players;
  }

  void addPlayerOnGame(Player player){
    setState(() {
      playersOnBench.removeWhere((p) => p.id == player.id);

      if(playersOnGame.where((p) => p.id == player.id).length == 0)
        playersOnGame.add(player);
    });
  }

  void addPlayerOnBench(Player player){
    setState(() {
      playersOnGame.removeWhere((p) => p.id == player.id);
      unavailablePlayers.removeWhere((p) => p.id == player.id);
      absentPlayers.removeWhere((p) => p.id == player.id);

      if(playersOnBench.where((p) => p.id == player.id).length == 0)
        playersOnBench.add(player);
    });
  }

  void addUnavailablePlayer(Player player){
    setState(() {
      playersOnGame.removeWhere((p) => p.id == player.id);
      playersOnBench.removeWhere((p) => p.id == player.id);

      if(unavailablePlayers.where((p) => p.id == player.id).length == 0)
        unavailablePlayers.add(player);
    });
  }

  void addAbsentPlayer(Player player){
    setState(() {
      playersOnGame.removeWhere((p) => p.id == player.id);
      playersOnBench.removeWhere((p) => p.id == player.id);

      if(absentPlayers.where((p) => p.id == player.id).length == 0)
        absentPlayers.add(player);
    });
  }

  void rotate(numberOfPlayersRotating) {
    if (numberOfPlayersRotating > 0) {
      setState(() {
        int startRange = 0;
        int endRange = numberOfPlayersRotating;

        for(Player p in playersOnGame)
          playersOnBench.add(p);

        if (endRange > playersOnBench.length) endRange = playersOnBench.length;
        var temp = playersOnBench.getRange(startRange, endRange);

        playersOnGame = temp.toList();
        playersOnBench.removeRange(startRange, endRange);
      });
    }
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
