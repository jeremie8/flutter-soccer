import 'package:flutter/material.dart';
import 'package:flutter_soccer_migration/utils/models/options.dart';

class OptionsContext extends StatefulWidget {
  final Widget child;
  Options options;

  OptionsContext({@required this.child, this.options}) {
    if (options == null) options = Options();
  }

  static OptionsContextState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_InheritedOptionsContext>().data;
  }

  @override
  OptionsContextState createState() => new OptionsContextState(options);
}

class OptionsContextState extends State<OptionsContext> {
  Options options;

  OptionsContextState(this.options);

  @override
  Widget build(BuildContext context) {
    return new _InheritedOptionsContext(
      data: this,
      child: widget.child,
    );
  }

  void setNbPlayersOnField(int nbPlayers) {
    options.nbPlayersOnField = nbPlayers;
    setState(() {});
  }

  void changeNbSecondsPerChange(int nbSeconds) {
    int nbMinutes = options.nbSecondsPerChange ~/ 60;
    options.nbSecondsPerChange = nbSeconds + nbMinutes * 60;
    setState(() {});
  }

  void changeNbMinutesPerChange(int nbMinutes) {
    int nbSeconds = options.nbSecondsPerChange % 60;
    options.nbSecondsPerChange = nbSeconds + nbMinutes * 60;
    setState(() {});
  }

  void setTimeChange(int timeChange) {
    options.timeChange.setContentBase(timeChange);
    setState(() {});
  }
}

class _InheritedOptionsContext extends InheritedWidget {
  final OptionsContextState data;

  _InheritedOptionsContext({
    Key key,
    @required this.data,
    @required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_InheritedOptionsContext old) => true;
}
