import 'dart:async';
import 'package:quick_lineup/utils/models/time_wrapper.dart';
import 'package:quick_lineup/utils/consts/styles.dart';
import 'package:quick_lineup/utils/time/time_utils.dart';
import 'package:flutter/material.dart';

class TimerText extends StatefulWidget {
	final TimeWrapper nbSecondsLeft;
	TimerText(this.nbSecondsLeft, {Key key}) : super(key: key);
	TimerTextState createState() => new TimerTextState(nbSecondsLeft);

}

class TimerTextState extends State<TimerText>{
	Timer timer;
	TimeWrapper nbSecondsLeft;

	TimerTextState(this.nbSecondsLeft) {
		timer = new Timer.periodic(new Duration(milliseconds: 1000), callback);
	}

	void callback(Timer timer) {
		if(mounted){
			nbSecondsLeft.content--;
			setState(() {});
		}
	}


	@override
	void dispose() {
    this.timer.cancel();
    super.dispose();

  }

	@override
	Widget build(BuildContext context) {
		return new Text(TimeUtils.formatTime(nbSecondsLeft.content), style: TextStyle(fontWeight: FontWeight.w500, fontSize: Styles.mediumTextSize),);
	}

}
