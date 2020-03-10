import 'package:flutter/material.dart';
import 'package:flutter_soccer_migration/utils/contexts/options_context.dart';
import 'package:flutter_soccer_migration/utils/controls/controls.dart';

class ChangeTimeSliderWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => ChangeTimeSliderWidgetState();

}

class ChangeTimeSliderWidgetState extends State<ChangeTimeSliderWidget>{

  static const MAX_VALUE_SLIDER = 20 * 60.0; // 20 minutes
  static const MIN_VALUE_SLIDER = 30.0; //30 secondes
  static const STEPS_SIZE = 30;
  static const DIVISIONS_SLIDER = (MAX_VALUE_SLIDER - MIN_VALUE_SLIDER) / STEPS_SIZE;

  @override
  Widget build(BuildContext context) {
    final optionsContext = OptionsContext.of(context);
    var options = optionsContext.options;
    return Column(
      children: <Widget>[
        Text("Time before changing players on the field : "),

        Row(

          children: <Widget>[
            Expanded(child: Container()),
            Expanded(
              child: TextField(
                onChanged: (String text) {
                  optionsContext.changeNbMinutesPerChange(int.parse(text));
                },
                controller: Controls.getController((options.nbSecondsPerChange ~/ 60).toString()),
                keyboardType: TextInputType.number,
              ),

            ),
            Text("minutes"),
            Expanded(child: Container()),
            Expanded(
              child: TextField(
                onChanged: (String text) {
                  optionsContext.changeNbSecondsPerChange(int.parse(text));
                },

                controller: Controls.getController((options.nbSecondsPerChange % 60).toString()),
                keyboardType: TextInputType.number,
              ),
            ),
            Text("seconds"),
            Expanded(child: Container()),
          ],
        ),

        Slider(
          value: options.nbSecondsPerChange.toDouble() > MAX_VALUE_SLIDER ? MAX_VALUE_SLIDER
              : options.nbSecondsPerChange.toDouble() < MIN_VALUE_SLIDER ? MIN_VALUE_SLIDER
              : options.nbSecondsPerChange.toDouble(),
          activeColor: Colors.indigo,
          inactiveColor: Colors.grey,
          min: MIN_VALUE_SLIDER,
          max: MAX_VALUE_SLIDER,
          divisions: DIVISIONS_SLIDER.toInt(),
          onChanged: (newVal){
            setState(() => optionsContext.options.nbSecondsPerChange = newVal.floor());
          },
        ),
      ],
    );
  }

}