import 'package:cloud_firestore/cloud_firestore.dart';

import 'models/player.dart';

class DbContext {
  static void addPlayer(Player p) {
    Firestore.instance.collection('players').add({
      'number' : p.number,
      'name' : p.name,
      'surname': p.surname,
      'assetPath' : p.assetPath
    }).then((result){
      p.reference = result;
    });
  }

  static void updatePlayer(Player p) {
    if(p.reference != null)
    {
      p.reference.updateData({
        'number' : p.number,
        'name' : p.name,
        'surname': p.surname,
        'assetPath' : p.assetPath
      });
    }
  }

  static void deletePlayer(Player p) {
    if(p.reference != null)
      p.reference.delete();
  }
}
