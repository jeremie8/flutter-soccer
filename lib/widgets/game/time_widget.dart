import 'package:flutter_soccer_migration/utils/contexts/options_context.dart';
import 'package:flutter_soccer_migration/utils/models/time_wrapper.dart';
import 'package:flutter_soccer_migration/utils/consts/custom_colors.dart';
import 'package:flutter_soccer_migration/widgets/time/stopwatch_text.dart';
import 'package:flutter_soccer_migration/utils/consts/styles.dart';
import 'package:flutter_soccer_migration/widgets/time/timer_text.dart';
import 'package:flutter/material.dart';

class TimeWidget extends StatelessWidget{
	StopwatchText _gameTimeText;

	TimerText _changeTimeText;
	TimeWrapper changeTime = new TimeWrapper(10);
	Widget child;

	TimeWidget(this.changeTime, {this.child});

  @override
  Widget build(BuildContext context) {
  	_gameTimeText = new StopwatchText(stopwatch: OptionsContext.of(context).options.gameTime);
  	_changeTimeText = new TimerText(changeTime);
    return Container(
			decoration: BoxDecoration(
				border: Border.all(color: Colors.green, width: 1.4),
				borderRadius: BorderRadius.all(Radius.circular(30.0)),
				color: CustomColors.grey1
			),
			padding: EdgeInsets.only(left: 10.0),
			child: Row(
				children: <Widget>[
					Column(
						children: <Widget>[
							Text("Game time", style: TextStyle(fontSize: Styles.smallTextSize, color: Colors.black38),),
							_gameTimeText
						],
					),
					Column(
						children: <Widget>[
							Text(" / ", style: TextStyle(fontSize: Styles.smallTextSize, color: Colors.black38),),
							Text(" / ", style: TextStyle(fontSize: Styles.mediumTextSize),),

						],
					),
					Column(
						children: <Widget>[
							Text("Next Shift", style: TextStyle(fontSize: Styles.smallTextSize, color: Colors.black38),),
							_changeTimeText,
						],
					),
					Column(
						children: <Widget>[
							this.child ?? Text("")
						],
					)

				],
			)
		);
  }

}