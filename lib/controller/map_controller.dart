import 'dart:developer';
import 'dart:isolate';

import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/model/map_track_model.dart';
import 'package:leadingmanagementsystem/service/map_service.dart';
import 'package:leadingmanagementsystem/view/home/home_screen.dart';
 
 

class MapTrackcontroller extends GetxController{

 
SendPort ?sendPort;
 
  List<MapTrackModel> _mapTrackdetails=[];
  List<MapTrackModel> get getmaptrackdetails=>_mapTrackdetails;
   RxBool isMapTrackLoad = true.obs;
   MapTrackService mapTrackService=MapTrackService();
   
  Future mapTrackController({latitude,longitude,time,flag,logout}) async {
    isMapTrackLoad(true);
    try {
      var response = await mapTrackService.mapTrackService(latitude: latitude,longitude:longitude,time: time,flag:flag,logout: logout);
      log(response.toString());
      if (response != null) {
        _mapTrackdetails.clear();
        print('res---------------$response');
        _mapTrackdetails.add(response);
       
         
      
        isMapTrackLoad(false);
         
         
      } else {
        isMapTrackLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }

   
}

 
