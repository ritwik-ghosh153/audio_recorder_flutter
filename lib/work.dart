import 'package:flutter/material.dart';

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
            child: ListView.builder(itemBuilder: (context, index){return null;}),
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
                    onPressed: (){},
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
