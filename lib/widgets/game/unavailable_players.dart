import 'package:flutter/material.dart';
import 'package:flutter_soccer_migration/utils/consts/custom_colors.dart';
import 'package:flutter_soccer_migration/utils/contexts/players_context.dart';
import 'package:flutter_soccer_migration/utils/models/player.dart';
import 'package:flutter_soccer_migration/widgets/bench/unavailable_players_dialog.dart';
import 'package:flutter_soccer_migration/widgets/players/player_cards.dart';

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
          Expanded(child: _getUnavailablePlayersDragTarget()),
          Expanded(child: _getAbsentPlayersDragTarget())
        ],
      ),
    );
  }

  Widget _getListViewForPlayers(List<Player> players) {
    return ListView.builder(
      itemCount: players.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(3.0),
          child: Container(width: MediaQuery.of(context).size.width / 7, child: PlayerCards.getCard(players[index])),
        );
      },
      scrollDirection: Axis.horizontal,

    );
  }

  Widget _getUnavailablePlayersDragTarget() {
    return DragTarget<Player>(
      onWillAccept: (player) => true,
      onAccept: (player) =>
          PlayersContext.of(context).addUnavailablePlayer(player),
      builder: (context, candidateData, rejected) => InkWell(
        onTap: () => {
          showDialog(
              context: context,
              builder: (context) {
                return UnavailablePlayersDialog(
                    PlayersContext.of(context).unavailablePlayers);
              })
        },
        child: _getArea(
            PlayersContext.of(context).unavailablePlayers,
            "Indisponibles",
            Colors.redAccent,
            Colors.white,
            candidateData.isNotEmpty),
      ),
    );
  }

  Widget _getAbsentPlayersDragTarget() {
    return DragTarget<Player>(
      onWillAccept: (player) => true,
      onAccept: (player) =>
          PlayersContext.of(context).addAbsentPlayer(player),
      builder: (context, candidateData, rejected) => InkWell(
        onTap: () => {
          showDialog(
              context: context,
              builder: (context) {
                return UnavailablePlayersDialog(
                    PlayersContext.of(context).absentPlayers);
              })
        },
        child: _getArea(
            PlayersContext.of(context).absentPlayers,
            "Indisponibles",
            Colors.redAccent,
            Colors.white,
            candidateData.isNotEmpty),
      ),
    );
  }

  Widget _getArea(List<Player> players, String header, Color backgroundColor,
      Color textColor, bool isDraggingOver) {
    return Stack(children: [
      Container(
          decoration: BoxDecoration(
              color: backgroundColor,
              border: Border.all(color: CustomColors.grey2),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          padding: EdgeInsets.fromLTRB(10, 20, 5, 5),
          child: Container(
              decoration: BoxDecoration(
                  color: CustomColors.grey1,
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: _getListViewForPlayers(players))),
      Positioned(
          left: 10,
          top: 3,
          child: Text(
            header,
            style: TextStyle(fontWeight: FontWeight.bold, color: textColor),
          )),
      isDraggingOver
          ? Container(
              decoration: BoxDecoration(color: CustomColors.hoverColor),
            )
          : Container()
    ]);
  }
}
