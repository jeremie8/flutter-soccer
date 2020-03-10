import 'package:flutter/material.dart';
import 'package:flutter_soccer_migration/pages/game_page.dart';
import 'package:flutter_soccer_migration/pages/options_page.dart';
import 'package:flutter_soccer_migration/pages/team_page.dart';

class App extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: false,
      body: _currentIndex == 0 ? TeamPage() : _currentIndex == 1 ? GamePage() : OptionsPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("Team"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_outline),
            title: Text("Game"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text("Options"),
          )
        ],
      ),
    );
  }
}

/*
Widget _signInButton() {
  return OutlineButton(
    splashColor: Colors.grey,
    onPressed: () {
      signInWithGoogle().whenComplete(() {
        print("signed in");
      });
    },
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
    highlightElevation: 0,
    borderSide: BorderSide(color: Colors.grey),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(image: AssetImage("assets/google_logo.png"), height: 35.0),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Sign in with Google',
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
          )
        ],
      ),
    ),
  );
}*/