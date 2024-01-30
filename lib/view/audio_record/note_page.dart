
// import 'dart:io';
 

// import 'package:audioplayers/audioplayers.dart' as PlayerState;
// import 'package:avatar_glow/avatar_glow.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_sound_lite/flutter_sound.dart';
// import 'package:dio/dio.dart';
// import 'package:leadingmanagementsystem/allpackages.dart';
// import 'package:leadingmanagementsystem/controller/get_note_controller.dart';
// import 'package:leadingmanagementsystem/controller/note_add_controller.dart';
// import 'package:leadingmanagementsystem/utils/utils.dart';
// import 'package:permission_handler/permission_handler.dart';

 
//  class AudioRecordPage extends StatefulWidget {
//   const AudioRecordPage({super.key,this.id});
//   final String ? id;

//   @override
//   State<AudioRecordPage> createState() => _AudioRecordPageState();
// }

// class _AudioRecordPageState extends State<AudioRecordPage> {
//   final recorder=FlutterSoundRecorder();
//    final player = PlayerState.AudioPlayer();
//   bool isPlaying = false;
//   Duration duration = Duration.zero;
//   Duration position = Duration.zero;
//   NoteAddController noteAddController=Get.put(NoteAddController());
//   NotesDetailsController notesDetailsController=Get.put(NotesDetailsController());
 
//   File? audioFiles;
//   bool ? isRecorderReady;
//   Future record()async{
//     await recorder.startRecorder(toFile: 'audio');

//   }
//  String formatTime(int seconds) {
//     return '${(Duration(seconds: seconds))}'.split('.')[0].padLeft(8, '0');
//   }
//   Future stop()async{
//    final path= await recorder.stopRecorder();
//    final audiofile=File(path!);
//    print(audiofile);
//    setState(() {
//      audioFiles=audiofile;
//    });
   
   
     
//    noteAddController.categoryImage(audiofile);
   

//   }

//   @override
//   void initState() {
//    initRecorder();
      
  
//     super.initState();
//   }
//   initRecorder() async{
//     final status= await Permission.microphone.request();
//     if(status!=PermissionStatus.granted){
//       throw 'Microphone permission not granted';
//     }
//     await recorder.openAudioSession();

//   }
//   Future<void> initRecorders() async {
//     final status = await Permission.microphone.request();
//     if (status != PermissionStatus.granted) {
//       throw 'Microphone permission not granted';
//     }
     
//     isRecorderReady = true;
//     recorder.setSubscriptionDuration(
//       const Duration(
//         microseconds: 100,
//       ),
//     );
//   }
// @override
//   void dispose() {
//    recorder.closeAudioSession();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold( 
//     appBar: AppBar(backgroundColor: appcolor,title: Text('Audio Upload'),),
//     body: Column(
//       //mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//           SizedBox(height: 10.0.hp,),
//         AvatarGlow(
//  glowColor: logocolor,
  
//  duration: Duration(milliseconds: 2000),
//  repeat: true,
  
//  child: Material(     // Replace this child with your own
//    elevation: 8.0,
//    shape: CircleBorder(),
//    child: CircleAvatar(
//      backgroundColor:logocolor,
//      child: Icon(Icons.mic,size: 40,color: toptitlecolor,),
//      radius: 50.0,
//    ),
//  ),
// ),
//         SizedBox(height: 10.0.hp,),
 
//         StreamBuilder<RecordingDisposition>(
//           stream: recorder.onProgress,
//           builder: (context, snapshot) {
//             print('snapshot.hasData :${snapshot.hasData}');
//             final duration =
//                 snapshot.hasData ? snapshot.data!.duration : Duration.zero;

//             print('duration :$duration');
//             String twoDigits(int n) => n.toString().padLeft(2, '0');
//             final minutes = twoDigits(duration.inMinutes.remainder(60));
//             final seconds = twoDigits(duration.inSeconds.remainder(60));
            
//     //          String minutes = (duration.inSeconds ~/ 60).toString();
//     // String seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
     
//             return Text(
//               duration.inSeconds.toString(),
//               style: const TextStyle(
//                 fontSize: 20,
//               ),
//             );
//           },
//         ),
//       Text(formatTime(position.inSeconds)),
//                   Text(formatTime((duration - position).inSeconds)),
//       Container(
//         height: 25.0.hp,
//         width: 60.0.wp,
//         decoration: BoxDecoration(border: Border.all(color: formhintcolor),borderRadius: BorderRadius.circular(5),
        
        
        
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [Center(child: ElevatedButton(onPressed: ()async{
        
      
//           await record();
//           Fluttertoast.showToast(msg: 'Recording...');
         
        
        

//       }, child: Text("START"))),
//       Center(child: ElevatedButton(onPressed: ()async{
      
//           await stop();
//            Fluttertoast.showToast(msg: 'Recording Stop...');
         
        
        

//       }, child: Text('STOP'))),],),
//       ),
//  SizedBox(height: 5.0.hp,),
      
//        Center(child: ElevatedButton(onPressed: ()async{
      
//             noteAddController.noteAddController(leadid: widget.id.toString()).then((value) {
//  notesDetailsController.noteDetailsController(leadid: widget.id.toString());
//             });
         
        
        

//       }, child: Text('Send')))
//     ],),
//     );
//   }
// }

