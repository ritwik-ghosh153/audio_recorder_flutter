import 'package:flutter/material.dart';
import 'recording.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
//import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';
import 'process.dart';
import 'bottom_container.dart';

List<ItemModel> data=[ItemModel(header: 'hello', bodyModel: BodyModel(recording: 1,play: FlatButton(child: Text('button'),)))];

class Work extends StatefulWidget {
  @override
  _WorkState createState() => _WorkState();
}

class _WorkState extends State<Work> {

  bool hasPermission=false;
  @override
//  void initState(){
//    getPermission();
//    super.initState();
//  }

//  void getPermission() async {
//    hasPermission = await FlutterAudioRecorder.hasPermissions;
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audio Recorder'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index){
                final item = data[index];
                return Dismissible(
                  child: ExpansionPanelList(
                    animationDuration: Duration(seconds: 1),
                    children: [
                      ExpansionPanel(
                        body: Container(
                          child: Row(
                            children: [
                              Text(data[index].bodyModel.recording.toString()),
                              data[index].bodyModel.play,
                            ],
                          ),
                        ),
                        headerBuilder: (BuildContext context, bool isExpanded){
                          return Container(
                            child: Text(data[index].header),
                          );
                        },
                        isExpanded: data[index].isExpanded,
                      )
                    ],
                    expansionCallback: (int item, bool status){
                      setState(() {
                        data[index].isExpanded=!data[index].isExpanded;
                      });
                    },
                  ),
                  onDismissed: (direction){
                    setState(() {
                      data.removeAt(index);
                    });
                  },
                  background: Container(color: Colors.red),
                  key: Key(item.header),
                );
              },
            ),
          ),
//          Bottom_Container(),
          buildBottomContainer(context),
        ],
      ),
    );
  }

  Container buildBottomContainer(BuildContext context) {
    return Container(
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(40)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: FloatingActionButton(
                  elevation: 20,
                  backgroundColor: Colors.red,
                  onPressed: () async{

                    int index=data.length;

String textVal='Recording ${data.length.toString()}';
final TextEditingController _myController = TextEditingController()..text = textVal;
Alert(
context: context,
style: AlertStyle(backgroundColor: Colors.white),
title: "New Recording",
content: TextField(
controller: _myController,
style: TextStyle(
fontSize: 20,
color: Colors.black,
),
decoration: InputDecoration(
icon: Icon(
Icons.message,
color: Colors.blueGrey,
),
hintText: 'Enter custom recording name',
hintStyle: TextStyle(color: Colors.grey),
focusColor: Colors.black,
),
cursorColor: Colors.blueGrey[400],
onChanged: (value) {
textVal = value;
print(value);
},
),
buttons: [
DialogButton(
child: Text(
"Save recording",
textAlign: TextAlign.center,
style: TextStyle(color: Colors.white, fontSize: 15),
),
onPressed: () async {
if (textVal == null) textVal='Recording ${data.length.toString()}';
//Todo: record sound


data.add(ItemModel(header: textVal, bodyModel: BodyModel(recording: index, play: FlatButton(child: Text('button '+index.toString()),))));
Navigator.pop(context);
setState(() {

});
},
gradient: LinearGradient(colors: [
Color.fromRGBO(116, 116, 191, 1.0),
Color.fromRGBO(52, 138, 199, 1.0)
]),
),
],
).show();

//                    FlutterAudioRecorder _recorder;
//                    Recording _current;
//                    RecordingStatus _currentStatus = RecordingStatus.Initialized;
//                    Process process=Process(_recorder,_current,_currentStatus);
//                    print(_currentStatus);
//                    print(hasPermission);
//                    switch (_currentStatus) {
//                      case RecordingStatus.Initialized:
//                        {
//                          await process.start();
//                          break;
//                        }
//                      case RecordingStatus.Recording:
//                        {
//                          await process.pause();
//                          break;
//                        }
//                      case RecordingStatus.Paused:
//                        {
//                          await process.resume();
//                          break;
//                        }
//                      case RecordingStatus.Stopped:
//                        {
//                          await process.init();
//                          break;
//                        }
//                      default:
//                        break;
//                    }
                  },
                  splashColor: Colors.purple,
                ),
              )
            ],
          ),
        );
  }
}



//int index=data.length;
//
//String textVal='Recording ${data.length.toString()}';
//final TextEditingController _myController = TextEditingController()..text = textVal;
//Alert(
//context: context,
//style: AlertStyle(backgroundColor: Colors.white),
//title: "New Recording",
//content: TextField(
//controller: _myController,
//style: TextStyle(
//fontSize: 20,
//color: Colors.black,
//),
//decoration: InputDecoration(
//icon: Icon(
//Icons.message,
//color: Colors.blueGrey,
//),
//hintText: 'Enter custom recording name',
//hintStyle: TextStyle(color: Colors.grey),
//focusColor: Colors.black,
//),
//cursorColor: Colors.blueGrey[400],
//onChanged: (value) {
//textVal = value;
//print(value);
//},
//),
//buttons: [
//DialogButton(
//child: Text(
//"Save recording",
//textAlign: TextAlign.center,
//style: TextStyle(color: Colors.white, fontSize: 15),
//),
//onPressed: () async {
//if (textVal == null) textVal='Recording ${data.length.toString()}';
////Todo: record sound
//
//
//data.add(ItemModel(header: textVal, bodyModel: BodyModel(recording: index, play: FlatButton(child: Text('button '+index.toString()),))));
//Navigator.pop(context);
//setState(() {
//
//});
//},
//gradient: LinearGradient(colors: [
//Color.fromRGBO(116, 116, 191, 1.0),
//Color.fromRGBO(52, 138, 199, 1.0)
//]),
//),
//],
//).show();