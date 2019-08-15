import 'package:flutter/material.dart';
import 'package:quick_lineup/utils/consts/custom_colors.dart';
import 'package:quick_lineup/utils/dbContext.dart';
import 'package:quick_lineup/utils/models/player.dart';
import 'package:quick_lineup/widgets/player/edit_player_widget.dart';

class PlayerPage extends StatelessWidget {
  final Player player;

  const PlayerPage({Key key, @required this.player}) : super(key: key);

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
            Expanded(child: EditPlayerWidget(player : player)),
            FlatButton(
                onPressed: () {
                  DbContext.updatePlayer(player);
                  Navigator.of(context).pop();
                }, child: Text("OK"))
          ],
        )
      ),
    );
  }
}
