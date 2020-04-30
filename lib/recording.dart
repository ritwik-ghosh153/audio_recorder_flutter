import 'package:flutter/material.dart';

class ItemModel {
  bool isExpanded;
  String header;
  BodyModel bodyModel;

  ItemModel({this.isExpanded: false, this.header, this.bodyModel});
}

class BodyModel {
  String recording;
  RaisedButton play=RaisedButton(
    color: Colors.red,
    child: Text('Play'),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    splashColor: Colors.purple,
    onPressed: (){
    },
  );

  BodyModel({this.recording,});
}