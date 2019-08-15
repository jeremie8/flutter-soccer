import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quick_lineup/utils/consts/consts.dart';
import 'package:quick_lineup/utils/models/player.dart';

class ChooseImagePlayerWidget extends StatefulWidget{
  final Player _player;

  const ChooseImagePlayerWidget(this._player, {Key key, }) : super(key: key);
  @override
  State<StatefulWidget> createState() => ChooseImagePlayerState(_player);

}

class ChooseImagePlayerState extends State<ChooseImagePlayerWidget>{
  final Player _player;
  int _assetIndex = 0;

  ChooseImagePlayerState(this._player){
    _assetIndex = Consts.PLAYER_ASSET_PATHS.indexWhere((r) => r == _player.assetPath);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(2))),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned.fill(bottom: 0, left: 0, child: Image.asset(_player.assetPath, filterQuality: FilterQuality.medium, fit: BoxFit.cover),),
            Positioned(left: 2, child: _getLeftPart(), ),
            Positioned(right: 2, child: _getRightPart(), ),
          ],
        ));
  }

  Widget _getLeftPart(){
    return IconButton(
      icon: new Icon(Icons.arrow_back_ios),
      onPressed: (){
        _assetIndex--;
        if(_assetIndex < 0)
          _assetIndex = Consts.PLAYER_ASSET_PATHS.length - 1;
        _player.assetPath = Consts.PLAYER_ASSET_PATHS[_assetIndex];
        setState(() {
        });
      },
    );
  }

  Widget _getRightPart(){
    return IconButton(
      icon: new Icon(Icons.arrow_forward_ios),
      onPressed: () {
        _assetIndex = (_assetIndex + 1) % Consts.PLAYER_ASSET_PATHS.length;
        _player.assetPath = Consts.PLAYER_ASSET_PATHS[_assetIndex];
        setState(() {
        });
      },
    );
  }
}