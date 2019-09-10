import 'package:flutter/material.dart';
import 'package:quick_lineup/utils/contexts/options_context.dart';
import 'package:quick_lineup/utils/contexts/players_context.dart';
import 'package:quick_lineup/widgets/players/PlayerCards.dart';

class Field extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FieldState();
}

class FieldState extends State<Field> {
  static const horizontalPadding = 15.0;
  static const verticalPadding = 10.0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset("assets/field.png"),
        Positioned.fill(
          top: verticalPadding,
          bottom: verticalPadding,
          right: horizontalPadding,
          left: horizontalPadding,
          child: GridView.count(
              crossAxisCount: OptionsContext.of(context).options.nbPlayersOnField <= 2 ? 2 :
              OptionsContext.of(context).options.nbPlayersOnField <= 6 ? 3 :
              OptionsContext.of(context).options.nbPlayersOnField <= 8 ? 4 : 5,
              children: PlayerCards.getCards(PlayersContext.of(context)
                  .getPlayersOnGame(
                  OptionsContext.of(context).options.nbPlayersOnField)),
              mainAxisSpacing: 5.0,
              crossAxisSpacing: 5.0,
              childAspectRatio: 1.0 / 1.2) // itemWidth / itemHeight
        )
      ],
    );
  }
}
