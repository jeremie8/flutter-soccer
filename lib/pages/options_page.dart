import 'package:flutter/material.dart';
import 'package:flutter_soccer_migration/utils/consts/custom_colors.dart';
import 'package:flutter_soccer_migration/utils/contexts/options_context.dart';
import 'package:flutter_soccer_migration/widgets/options/options_widget.dart';

class OptionsPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final optionsContext = OptionsContext.of(context);
    return Scaffold(
      backgroundColor: CustomColors.grey2,
      //appBar: PreferredSize(child: Container(color: Colors.blue), preferredSize: Size.fromHeight(10.0)),
      body: Container(
          color: CustomColors.grey2,
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
          child: Column(
            children: <Widget>[
              Expanded(child: OptionsWidget()),
              FlatButton(
                  onPressed: () {
                    optionsContext.setTimeChange(optionsContext.options.nbSecondsPerChange);
                    Navigator.of(context).pop();
                  }, child: Text("OK"))
            ],
          )
      ),
    );
  }

}