//import 'dart:async';
//import 'dart:io' as io;
//import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';
//import 'package:file/local.dart';
//import 'package:flutter/services.dart';
//import 'package:path_provider/path_provider.dart';
//
//class Process {
//
//  Process(this._recorder,this._current,this._currentStatus);
//
//  final LocalFileSystem localFileSystem= LocalFileSystem();
//
//  FlutterAudioRecorder _recorder;
//  Recording _current;
//  RecordingStatus _currentStatus = RecordingStatus.Unset;
//
//  init() async {
//    try {
//      if (await FlutterAudioRecorder.hasPermissions) {
//        String customPath = '/flutter_audio_recorder_';
//        io.Directory appDocDirectory;
//        //        io.Directory appDocDirectory = await getApplicationDocumentsDirectory();
//        if (io.Platform.isIOS) {
//          appDocDirectory = await getApplicationDocumentsDirectory();
//        } else {
//          appDocDirectory = await getExternalStorageDirectory();
//        }
//
//        // can add extension like ".mp4" ".wav" ".m4a" ".aac"
//        customPath = appDocDirectory.path +
//            customPath +
//            DateTime.now().millisecondsSinceEpoch.toString();
//
//        // .wav <---> AudioFormat.WAV
//        // .mp4 .m4a .aac <---> AudioFormat.AAC
//        // AudioFormat is optional, if given value, will overwrite path extension when there is conflicts.
//        _recorder =
//            FlutterAudioRecorder(customPath, audioFormat: AudioFormat.WAV);
//
//        await _recorder.initialized;
//        // after initialization
//        var current = await _recorder.current(channel: 0);
//        print(current);
//        // should be "Initialized", if all working fine
//          _current = current;
//          _currentStatus = current.status;
//          print(_currentStatus);
//      } else {
//        print("You must accept permissions");
//      }
//    } catch (e) {
//      print(e);
//    }
//  }
//  start() async {
//    try {
//      await _recorder.start();
//      var recording = await _recorder.current(channel: 0);
//        _current = recording;
//
//      const tick = const Duration(milliseconds: 50);
//      new Timer.periodic(tick, (Timer t) async {
//        if (_currentStatus == RecordingStatus.Stopped) {
//          t.cancel();
//        }
//
//        var current = await _recorder.current(channel: 0);
//        // print(current.status);
//          _current = current;
//          _currentStatus = _current.status;
//      });
//    } catch (e) {
//      print(e);
//    }
//  }
//
//  resume() async {
//    await _recorder.resume();
//  }
//
//  pause() async {
//    await _recorder.pause();
//  }
//
//  stop() async {
//    var result = await _recorder.stop();
//    print("Stop recording: ${result.path}");
//    print("Stop recording: ${result.duration}");
//      _current = result;
//      _currentStatus = _current.status;
//  }
//}
