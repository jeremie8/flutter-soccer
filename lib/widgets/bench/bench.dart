import 'package:quick_lineup/utils/contexts/players_context.dart';
import 'package:quick_lineup/utils/models/player.dart';
import 'package:quick_lineup/utils/consts/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:quick_lineup/widgets/players/player_cards.dart';

class FirebaseBench extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FirebaseBenchState();
}

class FirebaseBenchState extends State<FirebaseBench> {


  @override
  Widget build(BuildContext context) {
    return DragTarget<Player>(
      onWillAccept: (data) => !PlayersContext.of(context).playersOnBench.contains(data),
      onAccept: (player) => PlayersContext.of(context).addPlayerOnBench(player),
      builder: (context, candidateData, rejected) {
        return Container(
            decoration: BoxDecoration(
                color: CustomColors.grey1,
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            padding: EdgeInsets.all(7.0),
            child: candidateData.isEmpty
                ? _getBench()
                : _getDraggedOverBench());
      },
    );
  }

  Widget _getDraggedOverBench(){
    return Stack(
      fit: StackFit.expand,
      children:[
        _getBenchGridView(),
        Container(
          decoration: BoxDecoration(color: CustomColors.hoverColor),
        )
      ],
    );
  }

  Widget _getBench() {
    /*if (_isEdit)
      return Column(
        children: <Widget>[
          Expanded(child: _getBenchGridView()),
          AddPlayerButton()
        ],
      );
    else*/
      return _getBenchGridView();
  }

  Widget _getBenchGridView() {
    /*return StreamBuilder<QuerySnapshot>(
        stream: PlayersContext.of(context).getAllPlayers(onData),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return LinearProgressIndicator();

          return GridView.count(
            crossAxisCount: 4,
            children: _getCards(snapshot.data.documents),
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 5.0,
            childAspectRatio: 1.0 / 1.2, // itemWidth / itemHeight
          );
        });*/
    return GridView.count(
        crossAxisCount: 4,
        physics: NeverScrollableScrollPhysics(),
        children: PlayerCards.getCards(PlayersContext.of(context).playersOnBench, true, context),
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 5.0,
        childAspectRatio: 1.0 / 1.2); // itemWidth / itemHeight
  }

}
