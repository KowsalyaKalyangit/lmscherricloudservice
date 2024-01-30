
import 'dart:developer';

import 'package:leadingmanagementsystem/allpackages.dart';
 

import 'package:leadingmanagementsystem/service/get_note_service.dart';

import '../model/note_details_response.dart';

class NotesDetailsController extends GetxController{
  List<NotesDetailsModel> _notesDetails=[];
  List<NotesDetailsModel> get getleadsdetails=>_notesDetails;
   RxBool isAddDetailsLoad = true.obs;
   NoteDetailsService noteDetailsService=NoteDetailsService();
  Future noteDetailsController({leadid}) async {
    isAddDetailsLoad(true);
    try {
      var response = await noteDetailsService.noteDetailsService(leadid: leadid);
      log(response.toString());
      if (response != null) {
        _notesDetails.clear();
        print('res---------------$response');
        _notesDetails.add(response);
       
           
      
        isAddDetailsLoad(false);
        
         
      } else {
        isAddDetailsLoad(false);
        Get.back(); 
      }
    } catch (e) {
      rethrow;
    }
  }
}