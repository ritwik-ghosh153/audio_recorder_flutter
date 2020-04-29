import 'package:flutter/material.dart';

class ItemModel {
  bool isExpanded;
  String header;
  BodyModel bodyModel;

  ItemModel({this.isExpanded: false, this.header, this.bodyModel});
}

class BodyModel {
  int recording;
  FlatButton play;

  BodyModel({this.recording, this.play});
}