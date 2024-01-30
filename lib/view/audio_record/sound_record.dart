import 'package:flutter_sound_lite/public/flutter_sound_recorder.dart';
import 'package:permission_handler/permission_handler.dart';

class SoundRecorder{
  FlutterSoundRecorder? _audioRecorder;
  final pathTosave='audio_example.aac';
  bool _isRecordInitialise=false;
  bool get isRecording=>_audioRecorder!.isRecording;

  Future init() async{
    _audioRecorder=FlutterSoundRecorder();

    final status=await Permission.microphone.request();
    if(status!=PermissionStatus.granted){
      throw RecordingPermissionException('microphone permission');
    }

    await _audioRecorder!.openAudioSession();
    _isRecordInitialise=true;

  }

 void dispose(){
  if(!_isRecordInitialise)return;
  _audioRecorder!.closeAudioSession();
  _audioRecorder=null;
  _isRecordInitialise=false;
  
 }

  Future _record()async{
    if(!_isRecordInitialise)return;
    await _audioRecorder!.startRecorder(toFile: pathTosave);
  }

  Future _stop()async{
    if(!_isRecordInitialise)return;
    await _audioRecorder!.stopRecorder();
  }

  Future toggleRecording()async{
    
    if(_audioRecorder!.isStopped){
      await _record();

    }
    else{
      await _stop();
    }
  }
}