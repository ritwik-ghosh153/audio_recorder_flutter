import 'package:flutter/material.dart';
import 'recording.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'save.dart';

List<ItemModel> data = [];

class Work extends StatefulWidget {
  @override
  _WorkState createState() => _WorkState();
}

class _WorkState extends State<Work> {
  bool status = false; //false=not recording, true= recording
  Save save;
  String recordName;

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
              itemBuilder: (BuildContext context, int index) {
                final item = data[index];
                return Dismissible(
                  child: ExpansionPanelList(
                    animationDuration: Duration(seconds: 1),
                    children: [
                      ExpansionPanel(
                        body: Container(
                          padding: EdgeInsets.only(bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              data[index].bodyModel.play,
                            ],
                          ),
                        ),
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return Container(
                            child: Text(data[index].header),
                          );
                        },
                        isExpanded: data[index].isExpanded,
                      )
                    ],
                    expansionCallback: (int item, bool status) {
                      setState(() {
                        data[index].isExpanded = !data[index].isExpanded;
                      });
                    },
                  ),
                  onDismissed: (direction) {
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
          buildBottomContainer(context),
        ],
      ),
    );
  }

  Container buildBottomContainer(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[900], borderRadius: BorderRadius.circular(40)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: FloatingActionButton(
              elevation: 20,
              backgroundColor: Colors.red,
              child: status
                  ? Icon(
                      Icons.pause,
                      color: Colors.white,
                    )
                  : null,
              onPressed: () async {
                if(status){
                  await save.stop();
                  //TODO: Push data while stopping, not starting
                  ItemModel im = ItemModel(
                      header: recordName,
                      bodyModel: BodyModel(
                        recording: save.getPath(),
                      ));
                  data.add(im);
                  setState(() {});
                  status=!status;
                }
                else {
                  String textVal = 'Recording ${data.length.toString()}';
                  final TextEditingController _myController =
                  TextEditingController()
                    ..text = textVal;
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
                            if (textVal == null)
                              textVal = 'Recording ${data.length.toString()}';
                            //Todo: record sound
                            recordName=textVal;
                            save = Save(textVal, null);
                            await save.start();
                            Navigator.pop(context);
                            setState(() {});
                            status = !status;
                        },
                        gradient: LinearGradient(colors: [
                          Color.fromRGBO(116, 116, 191, 1.0),
                          Color.fromRGBO(52, 138, 199, 1.0)
                        ]),
                      ),
                    ],
                  ).show();
                }
              },
              splashColor: Colors.purple,
            ),
          )
        ],
      ),
    );
  }
}
