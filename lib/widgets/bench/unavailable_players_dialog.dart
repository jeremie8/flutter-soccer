import 'package:flutter/material.dart';
import 'package:flutter_soccer_migration/utils/consts/custom_colors.dart';
import 'package:flutter_soccer_migration/utils/contexts/players_context.dart';
import 'package:flutter_soccer_migration/utils/models/player.dart';
import 'package:flutter_soccer_migration/widgets/players/player_cards.dart';

class UnavailablePlayersDialog extends StatefulWidget {

  final List<Player> players;
  UnavailablePlayersDialog(this.players);

  @override
  State<StatefulWidget> createState() => UnavailablePlayersDialogState(players);
}

class UnavailablePlayersDialogState extends State<UnavailablePlayersDialog>{

  List<Player> players;
  List<Player> _playersToAddToBench;
  List<Player> _playersToShow;

  UnavailablePlayersDialogState(this.players){
    _playersToAddToBench = new List<Player>();
    _playersToShow = new List<Player>();
    for(Player p in players)
      _playersToShow.add(p);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: Container(
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DragTarget<Player>(
                        onWillAccept: (data) => !_playersToAddToBench.contains(data),
                        onAccept: (player) => addPlayerToTempBench(player),
                        builder: (context, candidateData, rejected){
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: candidateData.isEmpty ? _getTempBench(context) : _getDraggedOverTempBench(context),
                          );
                        }
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.count(
                          crossAxisCount: 3,
                          children: PlayerCards.getCards(
                              _playersToShow,
                              true,
                              context),
                          mainAxisSpacing: 5.0,
                          crossAxisSpacing: 5.0,
                          childAspectRatio: 1.0 / 1.2),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      FlatButton(
                        color: Colors.redAccent,
                        child: Text("Cancel"),
                        onPressed: () {
                          _playersToAddToBench.clear();
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                      ),
                      FlatButton(
                        color: Colors.green,
                        child: Text("Submit"),
                        onPressed: () {
                          for(Player player in _playersToAddToBench){
                            PlayersContext.of(context).addPlayerOnBench(player);
                          }
                          _playersToAddToBench.clear();
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                      ),
                    ],
                  )

                ])),

    );
  }

  void addPlayerToTempBench(Player player){
    setState(() {
      _playersToAddToBench.add(player);
      _playersToShow.remove(player);
    });
  }


  Widget _getDraggedOverTempBench(BuildContext context){
    return Stack(
      fit: StackFit.expand,
      children:[
        _getTempBenchGridView(context),
        Container(
          decoration: BoxDecoration(color: CustomColors.hoverColor),
        )
      ],
    );
  }

  Widget _getTempBench(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Colors.redAccent),
        child: _getTempBenchGridView(context));
  }


  Widget _getTempBenchGridView(BuildContext context) {
    return GridView.count(
        crossAxisCount: 4,
        physics: NeverScrollableScrollPhysics(),
        children: PlayerCards.getCards(_playersToAddToBench, true, context),
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 5.0,
        childAspectRatio: 1.0 / 1.2); // itemWidth / itemHeight
  }
}
