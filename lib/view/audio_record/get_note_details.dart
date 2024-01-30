import 'dart:io';
import 'package:audioplayers/audioplayers.dart' as PlayerState;
import 'package:flutter_sound_lite/flutter_sound.dart';
 
 
import 'package:flutter_sound_lite/public/flutter_sound_recorder.dart';
import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/controller/note_add_controller.dart';
import 'package:leadingmanagementsystem/utils/textstyles.dart';
 
import 'package:permission_handler/permission_handler.dart';
 
import 'package:http/http.dart' as http;
import 'package:record/record.dart';
import 'package:voice_message_package/voice_message_package.dart';

import '../../controller/get_note_controller.dart';

import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_sound_lite/flutter_sound.dart';
import 'package:flutter_sound_lite/public/flutter_sound_player.dart';
 import 'dart:async';
import 'package:audio_session/audio_session.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
 
import 'package:flutter_sound_platform_interface/flutter_sound_recorder_platform_interface.dart';
import 'package:leadingmanagementsystem/controller/note_add_controller.dart';
import 'package:permission_handler/permission_handler.dart';
class RecordingScreen extends StatefulWidget {
  const RecordingScreen({super.key,this.id});
 final String ? id;

  @override
  _RecordingScreenState createState() => _RecordingScreenState();
}

class _RecordingScreenState extends State<RecordingScreen> {

  NoteAddController noteAddController=Get.put(NoteAddController());
  NotesDetailsController notesDetailsController=Get.put(NotesDetailsController());
    final recorder=FlutterSoundRecorder();
    
 var button1 ;
 var button2 ;
  bool _isRecording = false;
  
   ///-------------------------------------------------------
    Codec _codec = Codec.aacADTS;
  String _mPath = 'tau_file.aac';
  FlutterSoundPlayer? _mPlayer = FlutterSoundPlayer();
  FlutterSoundRecorder? _mRecorder = FlutterSoundRecorder();
  bool _mPlayerIsInited = false;
  bool _mRecorderIsInited = false;
  bool _mplaybackReady = false;
  
   ///-------------------------------------------------------
   
 
  File? audioFiles;
  bool ? isRecorderReady;
  bool play=true;
  Future records()async{
    await recorder.startRecorder(
      
       
      toFile: 'audio');
play=false;
  }
    Future<void> startRecording() async {
    try {
      await recorder.openAudioSession();
      await recorder.startRecorder(
      //  toFile: 'audio',
       
        
      );
      
      _isRecording = true;
     
    } catch (e) {
      print('Error starting recording: $e');
    }
  }
 String formatTime(int seconds) {
    return '${(Duration(seconds: seconds))}'.split('.')[0].padLeft(8, '0');
  }
  Future stop()async{
   final path= await recorder.stopRecorder();
   final audiofile=File(path!);
   print(audiofile);
   setState(() {
     audioFiles=audiofile;
   });
   
   
     
   noteAddController.categoryImage(audiofile);
   

  }

@override
  void initState() {
   notesDetailsController.noteDetailsController(leadid: widget.id.toString(),);
    _mPlayer!.openAudioSession().then((value) {
      setState(() {
        _mPlayerIsInited = true;
      });
    });

    openTheRecorder().then((value) {
      setState(() {
        _mRecorderIsInited = true;
      });
    });
   //initRecorder();
    super.initState();
  }

  //////------
    Future<void> openTheRecorder() async {
    if (!kIsWeb) {
      var status = await Permission.microphone.request();
      if (status != PermissionStatus.granted) {
        throw RecordingPermissionException('Microphone permission not granted');
      }
    }
    await _mRecorder!.openAudioSession();
    if (!await _mRecorder!.isEncoderSupported(_codec) && kIsWeb) {
      _codec = Codec.opusWebM;
      _mPath = 'tau_file.webm';
      if (!await _mRecorder!.isEncoderSupported(_codec) && kIsWeb) {
        _mRecorderIsInited = true;
        return;
      }
    }
    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration(
      avAudioSessionCategory: AVAudioSessionCategory.playAndRecord,
      avAudioSessionCategoryOptions:
          AVAudioSessionCategoryOptions.allowBluetooth |
              AVAudioSessionCategoryOptions.defaultToSpeaker,
      avAudioSessionMode: AVAudioSessionMode.spokenAudio,
      avAudioSessionRouteSharingPolicy:
          AVAudioSessionRouteSharingPolicy.defaultPolicy,
      avAudioSessionSetActiveOptions: AVAudioSessionSetActiveOptions.none,
      androidAudioAttributes: const AndroidAudioAttributes(
        contentType: AndroidAudioContentType.speech,
        flags: AndroidAudioFlags.none,
        usage: AndroidAudioUsage.voiceCommunication,
      ),
      androidAudioFocusGainType: AndroidAudioFocusGainType.gain,
      androidWillPauseWhenDucked: true,
    ));

    _mRecorderIsInited = true;
  }

    record() {
    _mRecorder!
        .startRecorder(
      toFile: _mPath,
      codec: _codec,
      audioSource: theSource,
    )
        .then((value) {
        
      setState(() {
        
      });
    });
  }

  void stopRecorder() async {

    // var path= _mRecorder!.stopRecorder().then((value) {
    //   setState(() {
    //     //var url = value;
 
    //     _mplaybackReady = true;
    //   });
    // });
    // noteAddController.categoryImage(File(path.toString()));
    final path= await _mRecorder!.stopRecorder();
   final audiofile=File(path!);
   print(audiofile);
   setState(() {
     audioFiles=audiofile;
   });
   
   
     
   noteAddController.categoryImage(audioFiles);
  }

  initRecorder() async{
    final status= await Permission.microphone.request();
    if(status!=PermissionStatus.granted){
      throw 'Microphone permission not granted';
    }
    await recorder.openAudioSession();

  }
  Future<void> initRecorders() async {
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw 'Microphone permission not granted';
    }
     
    isRecorderReady = true;
    recorder.setSubscriptionDuration(
      const Duration(
        microseconds: 100,
      ),
    );
  }
@override
  void dispose() {
   recorder.closeAudioSession();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: appcolor,
        onPressed: (){
          showDialog(
  context: context,
  builder: (ctx) => StatefulBuilder(builder:
      (BuildContext context, StateSetter setState) {
    return AlertDialog(
      title: Text(
        "ADD NOTE",
        textAlign: TextAlign.center,
      ),
      content: Container(
        width: 150,
        height: 200,
        decoration: BoxDecoration(
          border:
              Border.all(width: 1, color: Colors.grey),
        ),
        child:  Container(
        height: 25.0.hp,
        width: 60.0.wp,
        decoration: BoxDecoration(border: Border.all(color: formhintcolor),borderRadius: BorderRadius.circular(5),
        
        
        
        ),
        child: Row(
          
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Center(child: 
          
          
          ElevatedButton(
            style:  ElevatedButton.styleFrom(backgroundColor: button1==true?Colors.green:Colors.grey),
            
            onPressed: ()async{
        
      
    
          await record();
          Fluttertoast.showToast(msg: 'Recording...');
         
          setState(() {
            button1=true;
            button2=false;
        
      },);
        

      }, child: Text( "START"))),
      Center(child: ElevatedButton(
         style:  ElevatedButton.styleFrom(backgroundColor: button2==true?Colors.red:Colors.grey),
        onPressed: ()async{
     
            stopRecorder();
           Fluttertoast.showToast(msg: 'Recording Stop...');
         
        
          setState(() {
             button1=false;
            button2=true;
        
      },);
        

      }, child: Text('STOP'))),],),
      ),
        alignment: Alignment.center,
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            Navigator.of(ctx).pop();
          },
          child: Text("CANCEL"),
        ),
      ElevatedButton(
        style:  ElevatedButton.styleFrom(backgroundColor: Colors.blue),
        onPressed: ()async{
          if(audioFiles!=null){
 noteAddController.noteAddController(leadid: widget.id,context: context).then((value) {
 notesDetailsController.noteDetailsController(leadid: widget.id).then((value) =>  Get.back());

            });
            Navigator.of(ctx).pop();
            setState(() {
              
            },);
          }
      
           
         
        
        

      }, child: Text('SEND'))
      ],
    );
  }),
);
          //Get.to(  AudioRecordPage(id: widget.id.toString(),));
        },child: Icon(Icons.cloud_upload_outlined),),
        body: Obx((){
          if(notesDetailsController.isAddDetailsLoad.value){
            return Center(child: CircularProgressIndicator(),);
          }
          else if(notesDetailsController.getleadsdetails[0].data.isEmpty){
            return Center(child: Text('No Data Found'),);
          }
          else{
         return  ListView.builder(
          itemCount:notesDetailsController.getleadsdetails[0].data.length,
          itemBuilder: ( (context, index) {
            return Padding(
              padding:   EdgeInsets.only(left:10.0,right: 10),
              child: Column(
                children: [
                  Container(
                   height: 15.0.hp,
                    width: 100.0.wp,
                    child: Padding(
                      padding: const EdgeInsets.only(left:8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         
                                   Text(notesDetailsController.getleadsdetails[0].data[index].addedby.toString(),style: listtitle,),
                                 
                                      Text(notesDetailsController.getleadsdetails[0].data[index].dateadded.toString(),style: formhintstyle,),
                                       VoiceMessageView(
                                    controller: VoiceController(
                                      audioSrc:
                                          notesDetailsController.getleadsdetails[0].data[index].filename,
                                      maxDuration:Duration(seconds: notesDetailsController.getleadsdetails[0].data[index].filename.length),
                                      isFile: false,
                                      onComplete: () {
                                        print('onComplete');
                                      },
                                      onPause: () {
                                        print('onPause');
                                      },
                                      onPlaying: () {
                                        print('onPlaying');
                                      },
                                    ),
                                    innerPadding: 2,
                                    cornerRadius: 20,
                                    size: 30,
                                    circlesColor: Colors.green,
                                   
                                    activeSliderColor: Colors.green,
                                    notActiveSliderColor: Colors.grey[200],
                                    counterTextStyle: TextStyle(fontSize: 10),
                                  ),
                                  Divider(color: Colors.grey,)
                                   
                        ],
                      ),
                    ),
                  ),
                  
                ]
              ),
            );
            
          }));
    } })
          
         
       
    );
}
}
typedef _Fn = void Function();

 

const theSource = AudioSource.microphone;