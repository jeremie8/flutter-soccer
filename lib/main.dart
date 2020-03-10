import 'package:flutter/cupertino.dart';
import 'package:flutter_soccer_migration/pages/game_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_soccer_migration/pages/menu_page.dart';
import 'package:flutter_soccer_migration/pages/options_page.dart';
import 'package:flutter_soccer_migration/pages/team_page.dart';
import 'package:flutter_soccer_migration/utils/contexts/options_context.dart';
import 'package:flutter_soccer_migration/utils/contexts/players_context.dart';

void main() => runApp(PlayersContext(child: OptionsContext(child: MyApp())));

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(

      home: App(),
      routes: <String, WidgetBuilder>{
        '/team': (BuildContext context) => new TeamPage(),
        '/game': (BuildContext context) => new GamePage(),
        '/options': (BuildContext context) => new OptionsPage(),
      },
      theme: ThemeData(
        fontFamily: 'Poppins',
        /*buttonTheme: ButtonThemeData(
          minWidth: 0.0,
          padding: EdgeInsets.all(0.0),
          height: 0.0,
          shape: CircleBorder()
        )*/
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
