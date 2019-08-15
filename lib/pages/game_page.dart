import 'package:quick_lineup/widgets/bench/bench.dart';
import 'package:quick_lineup/utils/consts/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:quick_lineup/widgets/game/top_row.dart';

class GamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.grey2,
      //appBar: PreferredSize(child: Container(color: Colors.blue), preferredSize: Size.fromHeight(10.0)),
      body: _getGamePage(context),
    );
  }
  
  Widget _getGamePage(BuildContext context){
    return Container(
      color: CustomColors.grey2,
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Image.asset("assets/field.png"),
          TopRowWidget(),
          Expanded(
              child: Bench(
                isEdit: false,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/team');
                },
                child: Text("Edit team"),
              )
            ],
          )
        ],
      ),
    );
  }
}
