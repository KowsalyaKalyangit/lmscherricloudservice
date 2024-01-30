// import 'dart:convert';
// import 'dart:io';

// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'package:flutter/material.dart';
// import 'package:flutter_sound_lite/flutter_sound.dart';
// import 'package:flutter_sound_lite/public/flutter_sound_player.dart';
//  import 'dart:async';
// import 'package:audio_session/audio_session.dart';
// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'package:flutter/material.dart';
 
// import 'package:flutter_sound_platform_interface/flutter_sound_recorder_platform_interface.dart';
// import 'package:leadingmanagementsystem/controller/note_add_controller.dart';
// import 'package:permission_handler/permission_handler.dart';

 

// import 'dart:async';
// import 'dart:io';
// import 'package:audio_session/audio_session.dart';
// import 'package:flutter/material.dart';
 
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';

// /*
//  * This is an example showing how to record to a Dart Stream.
//  * It writes all the recorded data from a Stream to a File, which is completely stupid:
//  * if an App wants to record something to a File, it must not use Streams.
//  *
//  * The real interest of recording to a Stream is for example to feed a
//  * Speech-to-Text engine, or for processing the Live data in Dart in real time.
//  *
//  */

// ///
// const int tSampleRate = 44000;
// typedef _Fn = void Function();

// /// Example app.
// class RecordToStreamExample extends StatefulWidget {
//   @override
//   _RecordToStreamExampleState createState() => _RecordToStreamExampleState();
// }

// class _RecordToStreamExampleState extends State<RecordToStreamExample> {
//   FlutterSoundPlayer? _mPlayer = FlutterSoundPlayer();
//   FlutterSoundRecorder? _mRecorder = FlutterSoundRecorder();
//   bool _mPlayerIsInited = false;
//   bool _mRecorderIsInited = false;
//   bool _mplaybackReady = false;
//   String? _mPath;
//   StreamSubscription? _mRecordingDataSubscription;

//   Future<void> _openRecorder() async {
//     var status = await Permission.microphone.request();
//     if (status != PermissionStatus.granted) {
//       throw RecordingPermissionException('Microphone permission not granted');
//     }
//     await _mRecorder!.openAudioSession();

//     final session = await AudioSession.instance;
//     await session.configure(AudioSessionConfiguration(
//       avAudioSessionCategory: AVAudioSessionCategory.playAndRecord,
//       avAudioSessionCategoryOptions:
//           AVAudioSessionCategoryOptions.allowBluetooth |
//               AVAudioSessionCategoryOptions.defaultToSpeaker,
//       avAudioSessionMode: AVAudioSessionMode.spokenAudio,
//       avAudioSessionRouteSharingPolicy:
//           AVAudioSessionRouteSharingPolicy.defaultPolicy,
//       avAudioSessionSetActiveOptions: AVAudioSessionSetActiveOptions.none,
//       androidAudioAttributes: const AndroidAudioAttributes(
//         contentType: AndroidAudioContentType.speech,
//         flags: AndroidAudioFlags.none,
//         usage: AndroidAudioUsage.voiceCommunication,
//       ),
//       androidAudioFocusGainType: AndroidAudioFocusGainType.gain,
//       androidWillPauseWhenDucked: true,
//     ));

//     setState(() {
//       _mRecorderIsInited = true;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     // Be careful : openAudioSession return a Future.
//     // Do not access your FlutterSoundPlayer or FlutterSoundRecorder before the completion of the Future
//     _mPlayer!.openAudioSession().then((value) {
//       setState(() {
//         _mPlayerIsInited = true;
//       });
//     });
//     _openRecorder();
//   }

//   @override
//   void dispose() {
//     stopPlayer();
//     _mPlayer!.closeAudioSession();
//     _mPlayer = null;

//     stopRecorder();
//    // _mRecorder!.closeRecorder();
//     _mRecorder = null;
//     super.dispose();
//   }

//   Future<IOSink> createFile() async {
//     var tempDir = await getTemporaryDirectory();
//     _mPath = '${tempDir.path}/flutter_sound_example.pcm';
//     var outputFile = File(_mPath!);
//     if (outputFile.existsSync()) {
//       await outputFile.delete();
//     }
//     return outputFile.openWrite();
//   }

//   // ----------------------  Here is the code to record to a Stream ------------

//   Future<void> record() async {
//     assert(_mRecorderIsInited && _mPlayer!.isStopped);
//     var sink = await createFile();
//     var recordingDataController = StreamController<Food>();
//     _mRecordingDataSubscription =
//         recordingDataController.stream.listen((buffer) {
//       if (buffer is FoodData) {
//         sink.add(buffer.data!);
//       }
//     });
//     await _mRecorder!.startRecorder(
//       toStream: recordingDataController.sink,
//       codec: Codec.pcm16,
//       numChannels: 1,
//       sampleRate: tSampleRate,
//     );
//     setState(() {});
//   }
//   // --------------------- (it was very simple, wasn't it ?) -------------------

//   Future<void> stopRecorder() async {
//     await _mRecorder!.stopRecorder();
//      print(File(_mPath.toString()));
//      NoteAddController().categoryImage(File(_mPath.toString()));
//     if (_mRecordingDataSubscription != null) {
//       await _mRecordingDataSubscription!.cancel();
//       _mRecordingDataSubscription = null;
//     }
//     _mplaybackReady = true;
//   }

//   _Fn? getRecorderFn() {
//     if (!_mRecorderIsInited || !_mPlayer!.isStopped) {
//       return null;
//     }
//     return _mRecorder!.isStopped
//         ? record
//         : () {
//             stopRecorder().then((value) => setState(() {}));
//           };
//   }

//   void play() async {
    
//     assert(_mPlayerIsInited &&
//         _mplaybackReady &&
//         _mRecorder!.isStopped &&
//         _mPlayer!.isStopped);
//     await _mPlayer!.startPlayer(
//         fromURI: _mPath,
//         sampleRate: tSampleRate,
//         codec: Codec.pcm16,
//         numChannels: 1,
//         whenFinished: () {
//           setState(() {});
//         }); // The readability of Dart is very special :-(
//     setState(() {});
//   }

//   Future<void> stopPlayer() async {
//     await _mPlayer!.stopPlayer();
//   }

//   _Fn? getPlaybackFn() {
//     if (!_mPlayerIsInited || !_mplaybackReady || !_mRecorder!.isStopped) {
//       return null;
//     }
//     return _mPlayer!.isStopped
//         ? play
//         : () {
//             stopPlayer().then((value) => setState(() {}));
//           };
//   }

//   // ----------------------------------------------------------------------------------------------------------------------

//   @override
//   Widget build(BuildContext context) {
//     Widget makeBody() {
//       return Column(
//         children: [
//           Container(
//             margin: const EdgeInsets.all(3),
//             padding: const EdgeInsets.all(3),
//             height: 80,
//             width: double.infinity,
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               color: Color(0xFFFAF0E6),
//               border: Border.all(
//                 color: Colors.indigo,
//                 width: 3,
//               ),
//             ),
//             child: Row(children: [
//               ElevatedButton(
//                 onPressed: getRecorderFn(),
//                 //color: Colors.white,
//                 //disabledColor: Colors.grey,
//                 child: Text(_mRecorder!.isRecording ? 'Stop' : 'Record'),
//               ),
//               SizedBox(
//                 width: 20,
//               ),
//               Text(_mRecorder!.isRecording
//                   ? 'Recording in progress'
//                   : 'Recorder is stopped'),
//             ]),
//           ),
//           Container(
//             margin: const EdgeInsets.all(3),
//             padding: const EdgeInsets.all(3),
//             height: 80,
//             width: double.infinity,
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               color: Color(0xFFFAF0E6),
//               border: Border.all(
//                 color: Colors.indigo,
//                 width: 3,
//               ),
//             ),
//             child: Row(children: [
//               ElevatedButton(
//                 onPressed: getPlaybackFn(),
//                 //color: Colors.white,
//                 //disabledColor: Colors.grey,
//                 child: Text(_mPlayer!.isPlaying ? 'Stop' : 'Play'),
//               ),
//               SizedBox(
//                 width: 20,
//               ),
//               Text(_mPlayer!.isPlaying
//                   ? 'Playback in progress'
//                   : 'Player is stopped'),

//                   ElevatedButton(onPressed: (){
//                     NoteAddController().noteAddController(leadid: 4.toString(),context: context);
//                     setState(() {
                      
//                     });
//                   }, child: Text('buttonclick'))
//             ]),
//           ),
//         ],
//       );
//     }

//     return Scaffold(
//       backgroundColor: Colors.blue,
//       appBar: AppBar(
//         title: const Text('Record to Stream ex.'),
//       ),
//       body: makeBody(),
//     );
//   }
// }





// class SimpleRecorder extends StatefulWidget {
//   @override
//   _SimpleRecorderState createState() => _SimpleRecorderState();
// }

// class _SimpleRecorderState extends State<SimpleRecorder> {
//   Codec _codec = Codec.aacADTS;
//   String _mPath = 'tau_file.aac';
//   FlutterSoundPlayer? _mPlayer = FlutterSoundPlayer();
//   FlutterSoundRecorder? _mRecorder = FlutterSoundRecorder();
//   bool _mPlayerIsInited = false;
//   bool _mRecorderIsInited = false;
//   bool _mplaybackReady = false;
//   NoteAddController noteAddController=Get.put(NoteAddController());

//   @override
//   void initState() {
//     _mPlayer!.openAudioSession().then((value) {
//       setState(() {
//         _mPlayerIsInited = true;
//       });
//     });

//     openTheRecorder().then((value) {
//       setState(() {
//         _mRecorderIsInited = true;
//       });
//     });
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _mPlayer!.closeAudioSession();
//     _mPlayer = null;

//    // _mRecorder!.closeRecorderCompleted();
//     _mRecorder = null;
//     super.dispose();
//   }

//   Future<void> openTheRecorder() async {
//     if (!kIsWeb) {
//       var status = await Permission.microphone.request();
//       if (status != PermissionStatus.granted) {
//         throw RecordingPermissionException('Microphone permission not granted');
//       }
//     }
//     await _mRecorder!.openAudioSession();
//     if (!await _mRecorder!.isEncoderSupported(_codec) && kIsWeb) {
//       _codec = Codec.opusWebM;
//       _mPath = 'tau_file.webm';
//       if (!await _mRecorder!.isEncoderSupported(_codec) && kIsWeb) {
//         _mRecorderIsInited = true;
//         return;
//       }
//     }
//     final session = await AudioSession.instance;
//     await session.configure(AudioSessionConfiguration(
//       avAudioSessionCategory: AVAudioSessionCategory.playAndRecord,
//       avAudioSessionCategoryOptions:
//           AVAudioSessionCategoryOptions.allowBluetooth |
//               AVAudioSessionCategoryOptions.defaultToSpeaker,
//       avAudioSessionMode: AVAudioSessionMode.spokenAudio,
//       avAudioSessionRouteSharingPolicy:
//           AVAudioSessionRouteSharingPolicy.defaultPolicy,
//       avAudioSessionSetActiveOptions: AVAudioSessionSetActiveOptions.none,
//       androidAudioAttributes: const AndroidAudioAttributes(
//         contentType: AndroidAudioContentType.speech,
//         flags: AndroidAudioFlags.none,
//         usage: AndroidAudioUsage.voiceCommunication,
//       ),
//       androidAudioFocusGainType: AndroidAudioFocusGainType.gain,
//       androidWillPauseWhenDucked: true,
//     ));

//     _mRecorderIsInited = true;
//   }

   
//   void record() {
//     _mRecorder!
//         .startRecorder(
//       toFile: _mPath,
//       codec: _codec,
//       audioSource: theSource,
//     )
//         .then((value) {
        
//       setState(() {
        
//       });
//     });
//   }

//   void stopRecorder() async {

//     // var path= _mRecorder!.stopRecorder().then((value) {
//     //   setState(() {
//     //     //var url = value;
 
//     //     _mplaybackReady = true;
//     //   });
//     // });
//     // noteAddController.categoryImage(File(path.toString()));
//     final path= await _mRecorder!.stopRecorder();
//    final audiofile=File(path!);
//    print(audiofile);
//    setState(() {
//      audioFiles=audiofile;
//    });
   
   
     
//    noteAddController.categoryImage(audioFiles);
//   }

//   void play() {
//     assert(_mPlayerIsInited &&
//         _mplaybackReady &&
//         _mRecorder!.isStopped &&
//         _mPlayer!.isStopped);
//     _mPlayer!
//         .startPlayer(
//             fromURI: _mPath,
            
//             //codec: kIsWeb ? Codec.opusWebM : Codec.aacADTS,
//             whenFinished: () {
              
//               setState(() {
                   
                    
                    
//               });
             
//             })
//         .then((value) {
          
//       setState(() {});
//     });
//   }

//   void stopPlayer() {
//     _mPlayer!.stopPlayer().then((value) {
//       setState(() {});
//     });
//   }

// // ----------------------------- UI --------------------------------------------

//   _Fn? getRecorderFn() {
//     if (!_mRecorderIsInited || !_mPlayer!.isStopped) {
//       return null;
//     }
//     return _mRecorder!.isStopped ? record : stopRecorder;
//   }

//   _Fn? getPlaybackFn() {
//     if (!_mPlayerIsInited || !_mplaybackReady || !_mRecorder!.isStopped) {
//       return null;
//     }
//     return _mPlayer!.isStopped ? play : stopPlayer;
//   }

//   @override
//   Widget build(BuildContext context) {
//     Widget makeBody() {
//       return Column(
//         children: [
//           Container(
//             margin: const EdgeInsets.all(3),
//             padding: const EdgeInsets.all(3),
//             height: 80,
//             width: double.infinity,
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               color: Color(0xFFFAF0E6),
//               border: Border.all(
//                 color: Colors.indigo,
//                 width: 3,
//               ),
//             ),
//             child: Row(children: [
//               ElevatedButton(
//                 onPressed: getRecorderFn(),
//                 //color: Colors.white,
//                 //disabledColor: Colors.grey,
//                 child: Text(_mRecorder!.isRecording ? 'Stop' : 'Record'),
//               ),
//               SizedBox(
//                 width: 20,
//               ),
//               Text(_mRecorder!.isRecording
//                   ? 'Recording in progress'
//                   : 'Recorder is stopped'),
//             ]),
//           ),
//           Container(
//             margin: const EdgeInsets.all(3),
//             padding: const EdgeInsets.all(3),
//             height: 80,
//             width: double.infinity,
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               color: Color(0xFFFAF0E6),
//               border: Border.all(
//                 color: Colors.indigo,
//                 width: 3,
//               ),
//             ),
//             child: Row(children: [
//               ElevatedButton(
//                 onPressed: getPlaybackFn(),
//                 //color: Colors.white,
//                 //disabledColor: Colors.grey,
//                 child: Text(_mPlayer!.isPlaying ? 'Stop' : 'Play'),
//               ),
//               SizedBox(
//                 width: 20,
//               ),
//               Text(_mPlayer!.isPlaying
//                   ? 'Playback in progress'
//                   : 'Player is stopped'),
//             ]),

//           ),
//           ElevatedButton(onPressed: (){
//             noteAddController.noteAddController(leadid: 3.toString(),context: context);
//           }, child: Text('button'))
//         ],
//       );
//     }

//     return Scaffold(
//       backgroundColor: Colors.blue,
//       appBar: AppBar(
//         title: const Text('Simple Recorder'),
//       ),
//       body: makeBody(),
//     );
//   }
// }