import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class ItemModel {
  bool isExpanded;
  String header;
  BodyModel bodyModel;

  ItemModel({this.isExpanded: false, this.header, this.bodyModel});
}

class BodyModel {
  String recording;
  RaisedButton play;
  final player=AudioPlayer();
  BodyModel({this.recording,}){
    play=RaisedButton(
      color: Colors.red,
      child: Text('Play'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      splashColor: Colors.purple,
      onPressed: ()async{
        int result=await player.play(recording, isLocal: true);
        print('result=${result.toString()}');
      },
    );
  }


}