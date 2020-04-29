import 'package:audiorecorder/work.dart';
import 'package:flutter/material.dart';
import 'work.dart';

void main()=> runApp(Recorder());

class Recorder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Work(),
    );
  }
}

