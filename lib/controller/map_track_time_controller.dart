
import 'dart:developer';

import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/model/map_time_track_model.dart';
 

import 'package:leadingmanagementsystem/service/get_note_service.dart';
import 'package:leadingmanagementsystem/service/map_track_time_service.dart';

 

class MapTrackTimeController extends GetxController{
  List<MapTrackTimeModel> _maptimeDetails=[];
  List<MapTrackTimeModel> get getmaptimedetails=>_maptimeDetails;
   RxBool isMaptimeLoad = true.obs;
   MapTrackTimeService mapTrackTimeService=MapTrackTimeService();
  Future mapTrackTimeController() async {
    isMaptimeLoad(true);
    try {
      var response = await mapTrackTimeService.mapTrackTimeService();
      log(response.toString());
      if (response != null) {
        _maptimeDetails.clear();
        print('res---------------$response');
        _maptimeDetails.add(response);
       
           
      
        isMaptimeLoad(false);
         //Get.back();
        
         
      } else {
        isMaptimeLoad(false);
        //Get.back(); 
      }
    } catch (e) {
      rethrow;
    }
  }
}