//import 'package:flutter/material.dart';
//import 'recording.dart';
//import 'package:rflutter_alert/rflutter_alert.dart';
//import 'work.dart';
//
//class BottomContainer extends StatefulWidget {
//  @override
//  _BottomContainerState createState() => _BottomContainerState();
//}
//
//class _BottomContainerState extends State<BottomContainer> {
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      decoration: BoxDecoration(
//          color: Colors.grey[900], borderRadius: BorderRadius.circular(40)),
//      child: Row(
//        mainAxisAlignment: MainAxisAlignment.center,
//        children: [
//          Padding(
//            padding: const EdgeInsets.symmetric(vertical: 30),
//            child: FloatingActionButton(
//              elevation: 20,
//              backgroundColor: Colors.red,
//              onPressed: () async {
//                int index = data.length;
//
//                String textVal = 'Recording ${data.length.toString()}';
//                final TextEditingController _myController =
//                TextEditingController()..text = textVal;
//                Alert(
//                  context: context,
//                  style: AlertStyle(backgroundColor: Colors.white),
//                  title: "New Recording",
//                  content: TextField(
//                    controller: _myController,
//                    style: TextStyle(
//                      fontSize: 20,
//                      color: Colors.black,
//                    ),
//                    decoration: InputDecoration(
//                      icon: Icon(
//                        Icons.message,
//                        color: Colors.blueGrey,
//                      ),
//                      hintText: 'Enter custom recording name',
//                      hintStyle: TextStyle(color: Colors.grey),
//                      focusColor: Colors.black,
//                    ),
//                    cursorColor: Colors.blueGrey[400],
//                    onChanged: (value) {
//                      textVal = value;
//                      print(value);
//                    },
//                  ),
//                  buttons: [
//                    DialogButton(
//                      child: Text(
//                        "Save recording",
//                        textAlign: TextAlign.center,
//                        style: TextStyle(color: Colors.white, fontSize: 15),
//                      ),
//                      onPressed: () async {
//                        if (textVal == null)
//                          textVal = 'Recording ${data.length.toString()}';
//                        //Todo: record sound
//
//                        ItemModel item= ItemModel(
//                            header: textVal,
//                            bodyModel: BodyModel(
//                              recording: index,
//                            ));
//
//                        data.add(ItemModel(
//                            header: textVal,
//                            bodyModel: BodyModel(
//                              recording: index,
//                            )));
//                        Navigator.pop(context);
//                      },
//                      gradient: LinearGradient(colors: [
//                        Color.fromRGBO(116, 116, 191, 1.0),
//                        Color.fromRGBO(52, 138, 199, 1.0)
//                      ]),
//                    ),
//                  ],
//                ).show();
//
//              },
//              splashColor: Colors.purple,
//            ),
//          )
//        ],
//      ),
//    );
//  }
//}
