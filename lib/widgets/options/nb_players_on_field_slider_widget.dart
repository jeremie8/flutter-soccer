import 'package:flutter/material.dart';
import 'package:flutter_soccer_migration/utils/contexts/options_context.dart';

class NbPlayersOnFieldSliderWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => NbPlayersOnFieldSliderWidgetState();

}

class NbPlayersOnFieldSliderWidgetState extends State<NbPlayersOnFieldSliderWidget>{
  
  @override
  Widget build(BuildContext context) {
    final optionsContext = OptionsContext.of(context);
    var options = optionsContext.options;
    return Column(
      children: <Widget>[
        Text("Number of players on the field: " + options.nbPlayersOnField.toString()),
        Slider(
          value: options.nbPlayersOnField.toDouble(),
          activeColor: Colors.indigo,
          inactiveColor: Colors.grey,
          min: 1.0,
          max: 11.0,
          onChanged: (newVal){
            setState(() => optionsContext.setNbPlayersOnField(newVal.floor()));
          },
        ),
      ],
    );
  }

}