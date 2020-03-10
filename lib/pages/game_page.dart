import 'package:flutter_soccer_migration/utils/consts/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_soccer_migration/widgets/bench/bench.dart';
import 'package:flutter_soccer_migration/widgets/game/field.dart';
import 'package:flutter_soccer_migration/widgets/game/top_row.dart';
import 'package:flutter_soccer_migration/widgets/game/unavailable_players.dart';

class GamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: false,

      backgroundColor: CustomColors.darkRed,
      //appBar: PreferredSize(child: Container(color: Colors.blue), preferredSize: Size.fromHeight(10.0)),

      body: _getGamePage(context),
    );
  }

  Widget _getGamePage(BuildContext context) {
    return Container(
      color: CustomColors.grey2,
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Field(),
          TopRowWidget(),
          Expanded(child: FirebaseBench()),
          UnavailablePlayers(),
        ],
      ),
    );
  }
}
