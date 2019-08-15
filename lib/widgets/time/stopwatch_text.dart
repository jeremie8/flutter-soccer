import 'dart:async';
import 'package:quick_lineup/utils/consts/styles.dart';
import 'package:quick_lineup/utils/time/time_utils.dart';
import 'package:flutter/material.dart';

class StopwatchText extends StatefulWidget {
	Stopwatch stopwatch;
	StopwatchText({this.stopwatch, Key key }) : super(key: key){
		if(this.stopwatch == null)
			this.stopwatch = new Stopwatch();
	}
	TimerTextState createState() => new TimerTextState(stopwatch);
}

class TimerTextState extends State<StopwatchText> {
	Timer timer;
	final Stopwatch stopwatch;

	TimerTextState(this.stopwatch) {
		timer = new Timer.periodic(new Duration(milliseconds: 100), callback);
		stopwatch.start();
	}

	void callback(Timer timer) {
		if (stopwatch.isRunning && mounted) {
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
		return new Text(TimeUtils.formatTime(stopwatch.elapsedMilliseconds ~/ 1000), style: TextStyle(fontWeight: FontWeight.w500, fontSize: Styles.mediumTextSize),);
	}

}
