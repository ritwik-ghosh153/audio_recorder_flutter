import 'package:flutter/material.dart';
import 'recording.dart';

List<ItemModel> data=[ItemModel(header: 'hello', bodyModel: BodyModel(recording: 1,play: FlatButton(child: Text('button'),)))];

class Work extends StatefulWidget {
  @override
  _WorkState createState() => _WorkState();
}

class _WorkState extends State<Work> {
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
          Container(
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
                    onPressed: (){
                      int index=data.length;
                      setState(() {
                      data.add(ItemModel(header: 'hello'+index.toString(), bodyModel: BodyModel(recording: index, play: FlatButton(child: Text('button '+index.toString()),))));
                      });
                    },
                    splashColor: Colors.purple,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
