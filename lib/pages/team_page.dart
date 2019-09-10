import 'package:flutter/material.dart';
import 'package:quick_lineup/utils/consts/custom_colors.dart';
import 'package:quick_lineup/widgets/bench/bench.dart';

class TeamPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.grey2,
      //appBar: PreferredSize(child: Container(color: Colors.blue), preferredSize: Size.fromHeight(10.0)),
      body: Container(
        color: CustomColors.grey2,
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        child: Column(
          children: <Widget>[
            //todo change this
            Expanded(child: FirebaseBench()),
            FlatButton(
                onPressed: () {
                  //clear navigation stack
                  Navigator.of(context).pushNamedAndRemoveUntil('/game', (Route<dynamic> route) => false);
                }, child: Text("OK"))
          ],
        ),
      ),
    );
  }
}
