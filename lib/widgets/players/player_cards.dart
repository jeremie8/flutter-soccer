import 'package:flutter/material.dart';
import 'package:flutter_soccer_migration/utils/models/player.dart';
import 'package:flutter_soccer_migration/widgets/bench/player_card.dart';

class PlayerCards{
  static List<Widget> getCards(List<Player> players, bool draggable, BuildContext context) {
    List<Widget> retLst = new List<Widget>();
    players.forEach((player) => retLst.add(draggable ? getDraggableCard(player, context) : getCard(player)));
    return retLst;
  }

  static Widget getCard(Player player) {
    return InkWell(
        child: PlayerCard(player),
    );
  }

  static Widget getDraggableCard(Player player, BuildContext context){
    return Draggable<Player>(
        data: player,
        child: PlayerCard(player),
        childWhenDragging: Container(),
        feedback: Container(
          height: MediaQuery.of(context).size.height / 7,
          width: MediaQuery.of(context).size.width / 5,
          decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black, blurRadius: 10.0, spreadRadius: 5.0, offset: Offset(10.0, 10.0))]),
          child: PlayerCard(player),
        )
    );
  }
}