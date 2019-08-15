import 'package:quick_lineup/pages/player_page.dart';
import 'package:quick_lineup/utils/contexts/options_context.dart';
import 'package:quick_lineup/utils/models/player.dart';
import 'package:quick_lineup/widgets/bench/player_card.dart';
import 'package:quick_lineup/utils/consts/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'add_player_btn.dart';

class Bench extends StatefulWidget {
  final bool isEdit;

  const Bench({Key key, this.isEdit}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BenchState(isEdit);
}

class BenchState extends State<Bench> {
  bool _isEdit;

  BenchState(this._isEdit);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: CustomColors.grey1,
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
        padding: EdgeInsets.all(7.0),
        child: _getBench());
  }

  Widget _getBench() {
    if (_isEdit)
      return Column(
        children: <Widget>[
          Expanded(child: _getBenchGridView()),
          AddPlayerButton()
        ],
      );
    else
      return _getBenchGridView();
  }

  Widget _getBenchGridView() {
    return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('players').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return LinearProgressIndicator();

          return GridView.count(
            crossAxisCount: 4,
            children: _getCards(snapshot.data.documents),
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 5.0,
            childAspectRatio: 1.0 / 1.2, // itemWidth / itemHeight
          );
        });
  }

  List<Widget> _getCards(List<DocumentSnapshot> documents) {
    List<Widget> retLst = new List<Widget>();
    int i = 0;
    documents
        .map((player) => Player.fromSnapshot(player))
        .forEach((player) => retLst.add(_getCard(player, i++)));
    return retLst;
  }

  Widget _getCard(Player player, int index) {
    if (_isEdit) {
      return InkWell(
        child: PlayerCard(
            index < OptionsContext.of(context).options.nbPlayersOnField,
            player),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      new PlayerPage(player: player)));
        },
      );
    } else {
      return InkWell(
        child: PlayerCard(
            index < OptionsContext.of(context).options.nbPlayersOnField,
            player),
      );
    }
  }
}
