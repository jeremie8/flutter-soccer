import 'package:flutter/material.dart';
import 'package:quick_lineup/utils/controls/controls.dart';
import 'package:quick_lineup/utils/models/player.dart';
import 'package:quick_lineup/widgets/player/choose_image_player_widget.dart';

class EditPlayerWidget extends StatelessWidget {
  final Player player;

  const EditPlayerWidget({Key key, @required this.player}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Expanded(child: ChooseImagePlayerWidget(this.player)),
        TextField(
            decoration: InputDecoration(labelText: "Prénom"),
            onChanged: (String text) {
              player.name = text;
            },
            controller: Controls.getController(player.name)),
        TextField(
          decoration: InputDecoration(labelText: "Nom de famille"),
          onChanged: (String text) {
            player.surname = text;
          },
          controller: Controls.getController(player.surname),
        ),
        TextField(
          decoration: InputDecoration(labelText: "Numéro"),
          onChanged: (String text) {
            player.number = int.parse(text);
          },
          controller: Controls.getController(player.number.toString()),
          keyboardType: TextInputType.number,
        ),
        Expanded(child: Container())
      ],
    ));
  }
}
