import 'package:flutter/material.dart';
import 'package:quick_lineup/utils/contexts/options_context.dart';
import 'package:quick_lineup/utils/contexts/players_context.dart';
import 'package:quick_lineup/utils/models/player.dart';
import 'package:quick_lineup/widgets/players/player_cards.dart';

class Field extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FieldState();
}

class FieldState extends State<Field> {
  static const horizontalPadding = 15.0;
  static const verticalPadding = 10.0;

  @override
  Widget build(BuildContext context) {
    return DragTarget<Player>(
      onWillAccept: (data) => !PlayersContext.of(context).playersOnGame.contains(data),
      onAccept: (player) => PlayersContext.of(context).addPlayerOnGame(player),
      builder: (context, candidateData, rejected) {
        return Container(
            height: MediaQuery.of(context).size.height / 2.5,
            child: candidateData.isEmpty
                ? _getFieldAndPlayers()
                : _getDraggedOverField());
      },
    );
  }

  Widget _getFieldImage() {
    return Image.asset(
      "assets/field.png",
      fit: BoxFit.fill,
    );
  }

  Widget _getPlayersOnGame() {
    return Positioned(
        top: verticalPadding,
        bottom: verticalPadding,
        right: horizontalPadding,
        left: horizontalPadding,
        child: GridView.count(
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount:
                OptionsContext.of(context).options.nbPlayersOnField <= 2
                    ? 2
                    : OptionsContext.of(context).options.nbPlayersOnField <= 6
                        ? 3
                        : OptionsContext.of(context).options.nbPlayersOnField <=
                                8
                            ? 4
                            : 5,
            children: PlayerCards.getCards(
                PlayersContext.of(context).playersOnGame,
                true,
                context),
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 5.0,
            childAspectRatio: 1.0 / 1.2) // itemWidth / itemHeight
        );
  }

  Widget _getDraggedOverField() {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        _getFieldImage(),
        _getPlayersOnGame(),
        Container(decoration: BoxDecoration(color: Color(0xaaaef5ae)))
      ],
    );
  }

  Widget _getFieldAndPlayers() {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[_getFieldImage(), _getPlayersOnGame()],
    );
  }
}
