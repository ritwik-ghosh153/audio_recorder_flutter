import 'package:flutter/material.dart';
import 'recording.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
//import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';
import 'process.dart';

class Bottom_Container extends StatefulWidget {
  @override
  _Bottom_ContainerState createState() => _Bottom_ContainerState();
}

class _Bottom_ContainerState extends State<Bottom_Container> {
  @override
  Widget build(BuildContext context) {
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
              onPressed: (){
//                FlutterAudioRecorder _recorder;
//                Recording _current;
//                RecordingStatus _currentStatus = RecordingStatus.Initialized;
//                Process process=Process(_recorder,_current,_currentStatus);
//
//                switch (_currentStatus) {
//                  case RecordingStatus.Initialized:
//                    {
//                      process.start();
//                      break;
//                    }
//                  case RecordingStatus.Recording:
//                    {
//                      process.pause();
//                      break;
//                    }
//                  case RecordingStatus.Paused:
//                    {
//                      process.resume();
//                      break;
//                    }
//                  case RecordingStatus.Stopped:
//                    {
//                      process.init();
//                      break;
//                    }
//                  default:
//                    break;
//                }
              },
              splashColor: Colors.purple,
            ),
          )
        ],
      ),
    );
  }
}
