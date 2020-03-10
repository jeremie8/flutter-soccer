import 'package:flutter_soccer_migration/utils/models/player.dart';

class RotationAlgo {
  static void rotate(List<Player> playersOnBench, List<Player> playersOnGame, int numberOfPlayersRotating) {
    if (numberOfPlayersRotating > 0) {
      int startRange = 0;
      int endRange = numberOfPlayersRotating;

      for (Player p in playersOnGame) playersOnBench.add(p);

      if (endRange > playersOnBench.length) endRange = playersOnBench.length;
      var temp = playersOnBench.getRange(startRange, endRange);

      playersOnGame.clear();
      playersOnGame.addAll(temp);
      playersOnBench.removeRange(startRange, endRange);
    }
  }
}
