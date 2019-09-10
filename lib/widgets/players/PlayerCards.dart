import 'package:flutter/material.dart';
import 'package:quick_lineup/utils/models/player.dart';
import 'package:quick_lineup/widgets/bench/player_card.dart';

class PlayerCards{
  static List<Widget> getCards(List<Player> players) {
    List<Widget> retLst = new List<Widget>();
    players.forEach((player) => retLst.add(getCard(player)));
    return retLst;
  }

  static Widget getCard(Player player) {
    return InkWell(
      child: PlayerCard(player),
    );
  }
}