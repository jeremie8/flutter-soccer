import 'package:flutter/material.dart';
import 'package:quick_lineup/utils/consts/custom_colors.dart';
import 'package:quick_lineup/utils/contexts/players_context.dart';
import 'package:quick_lineup/utils/models/player.dart';
import 'package:quick_lineup/widgets/players/player_cards.dart';

class UnavailablePlayers extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => UnavailablePlayersState();
}

class UnavailablePlayersState extends State<UnavailablePlayers> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 8,
      child: Row(
        children: <Widget>[
          Expanded(
            child: InkWell(
              onTap: () => {}, //todo
              child: _getArea(
                  PlayersContext.of(context).unavailablePlayers,
                  "Indisponibles",
                  Colors.redAccent, Colors.white),
            ),
          ),
          Expanded(
            child: InkWell(
                onTap: () => {}, //todo
                child: _getArea(
                        PlayersContext.of(context).absentPlayers, "Absents", CustomColors.darkRed, Colors.white)),
          )
        ],
      ),
    );
  }

  Widget _getListViewForPlayers(List<Player> players) {
    return ListView.builder(
      itemCount: players.length,
      itemBuilder: (BuildContext context, int index) {
        return PlayerCards.getCard(players[index]);
      },
      scrollDirection: Axis.horizontal,
    );
  }

  Widget _getArea(List<Player> players, String header, Color backgroundColor, Color textColor) {
    return Stack(children: [
      Container(
          decoration: BoxDecoration(color: backgroundColor, border: Border.all(color: CustomColors.grey2), borderRadius: BorderRadius.all(Radius.circular(10))),
          padding: EdgeInsets.fromLTRB(10, 20, 5, 5),
          child: Container(
              decoration: BoxDecoration(color: CustomColors.grey1, borderRadius: BorderRadius.all(Radius.circular(5))),
              child: _getListViewForPlayers(players))),
      Positioned(
          left: 10,
          top: 3,
          child: Text(header, style: TextStyle(fontWeight: FontWeight.bold, color: textColor),))
    ]);
  }
}
