import 'package:flutter_soccer_migration/pages/player_page.dart';
import 'package:flutter_soccer_migration/utils/consts/consts.dart';
import 'package:flutter_soccer_migration/utils/db/dbContext.dart';
import 'package:flutter_soccer_migration/utils/models/player.dart';
import 'package:flutter/material.dart';

class AddPlayerButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blueAccent, width: 1.3),
          borderRadius: BorderRadius.all(Radius.circular(2.0))),
      child: FlatButton(
          onPressed: () {
            Player p = new Player(name: "", surname: "", number: 25, assetPath: Consts.PLAYER_ASSET_PATHS[0]);
            DbContext.addPlayer(p);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        new PlayerPage(player: p)));
          },
          child: Icon(
            Icons.add,
            size: 40,
            color: Colors.blueAccent,
          )),
    );
  }
}
