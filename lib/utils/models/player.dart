import 'package:cloud_firestore/cloud_firestore.dart';
class Player{
  String name;
  String surname;
  int number;
  String assetPath;
  DocumentReference reference;
  int id;

  static int counterId = 0;

  Player.fromMap(Map<String, dynamic> map, {this.reference})
      : name = map['name'], surname = map['surname'],
        number = map['number'], assetPath = map['assetPath']{
    _setId();
  }

  Player.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  Player({this.name, this.surname, this.number, this.assetPath}){
    _setId();
  }

  void _setId(){
    id = counterId++;
  }

}