import 'package:flutter_soccer_migration/utils/contexts/options_context.dart';
import 'package:flutter_soccer_migration/utils/models/time_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_soccer_migration/utils/contexts/players_context.dart';

class NextChangeButton extends StatelessWidget{
	final TimeWrapper changeTime;

	NextChangeButton(this.changeTime);

  @override
  Widget build(BuildContext context) {
		return IconButton(
			icon: new Icon(Icons.loop, size: 24),
			onPressed: () {
        PlayersContext.of(context).rotate(OptionsContext.of(context).options.nbPlayersOnField);
        changeTime.reset();
      },
      color: Colors.green,
		);
  }

}