import 'package:flutter/material.dart';
import 'package:quick_lineup/utils/consts/custom_colors.dart';
import 'package:quick_lineup/utils/contexts/options_context.dart';
import 'package:quick_lineup/utils/models/time_wrapper.dart';
import 'package:quick_lineup/widgets/game/next_change_btn.dart';
import 'package:quick_lineup/widgets/game/time_widget.dart';

class TopRowWidget extends StatelessWidget{
  TopRowWidget();

  @override
  Widget build(BuildContext context) {
    TimeWrapper timeChange = OptionsContext.of(context).options.timeChange;
    return Container(
        color: CustomColors.grey2,
        child : Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
                padding : EdgeInsets.symmetric(vertical: 5.0),
                child : Text("Banc", style: TextStyle(fontWeight: FontWeight.bold,))
            ),
            TimeWidget(timeChange, child: NextChangeButton(timeChange),),
            IconButton(
              icon: Icon(Icons.settings, color: Colors.blueAccent,),
              onPressed: () => Navigator.of(context).pushNamed('/options'),
            )
          ],
        )
    );
  }
}