import 'package:flutter/material.dart';
import 'package:quick_lineup/utils/consts/custom_colors.dart';

class MenuPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.grey2,
      //appBar: PreferredSize(child: Container(color: Colors.blue), preferredSize: Size.fromHeight(10.0)),
      body: Container(
        color: CustomColors.grey2,
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              child: FlatButton(
                color: Colors.lightBlueAccent,
                  onPressed: () {
                    //clear navigation stack
                    Navigator.of(context).pushNamed('/game');
                  }, child: Text("Démarrer une partie")),
            ),
            FlatButton(
                color: Colors.lightBlueAccent,
                onPressed: () {
                  //clear navigation stack
                  Navigator.of(context).pushNamed('/options');
                }, child: Text("Options")),
            FlatButton(
                color: Colors.lightBlueAccent,
                onPressed: () {
                  //clear navigation stack
                  Navigator.of(context).pushNamed('/team');
                }, child: Text("Team")),
          ],
        ),
      ),
    );
  }

}