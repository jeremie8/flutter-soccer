import 'package:flutter_soccer_migration/utils/models/time_wrapper.dart';

class Options{
  int nbPlayersOnField = 4;
  TimeWrapper timeChange = new TimeWrapper(30);
  Stopwatch gameTime = new Stopwatch();
  int nbSecondsPerChange = 30;
}