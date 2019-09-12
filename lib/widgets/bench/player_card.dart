import 'dart:math';

import 'package:quick_lineup/utils/models/player.dart';
import 'package:quick_lineup/utils/consts/styles.dart';
import 'package:flutter/material.dart';

class PlayerCard extends StatelessWidget {
  Player player;
  Random rnd = new Random();

  PlayerCard(this.player);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(2)),
        color: Colors.white70,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: _getTopPart()),
          _getBottomPart()
        ],
      ),
    );
  }

  Widget _getTopPart() {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(2))),
        child: Stack(
          children: <Widget>[
            Positioned.fill(bottom: 0, left: 0, child: Image.asset(player.assetPath, filterQuality: FilterQuality.low, fit: BoxFit.cover),),
            Positioned(top: 2, left: 2, child: _getNumberPart(), ),
          ],
        ));
  }

  Widget _getNumberPart() {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(1.5))),
        constraints: BoxConstraints(minWidth: 13),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 0.3, horizontal: 1.0),
          child: Text(
            player.number.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: Styles.smallTextSize),
          ),
        ));
  }

  Widget _getBottomPart() {
    return Padding(
        padding: EdgeInsets.all(2),
        child: Row(
          children: <Widget>[
            Expanded(
                child: Text(
              player.name,
              textAlign: TextAlign.left,
              softWrap: false,
              style: TextStyle(fontSize: Styles.smallTextSize),
            )),
//            Icon(
//              Icons.adjust,
//              color: rnd.nextInt(2) == 0 ? Colors.green : Colors.red,
//              size: Styles.mediumTextSize,
//            )
          ],
        ));
  }
}
