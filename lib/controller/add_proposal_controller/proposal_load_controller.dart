
import 'dart:developer';

import 'package:leadingmanagementsystem/allpackages.dart';
 
import 'package:leadingmanagementsystem/service/add_proposal_service/proposal_load_service.dart';
 
 
 

import '../../model/Add_proposal/proposal_load_response.dart';
 
class ProposalLoadController extends GetxController{
  List<ProposalLoadModel> _proposalLoad=[];
  List<ProposalLoadModel> get getproposalload=>_proposalLoad;
   RxBool isproposaLoad = true.obs;
   ProposalLoadService proposalLoadService=ProposalLoadService();
  Future proposalrelatedController() async {
    isproposaLoad(true);
    try {
      var response = await proposalLoadService.proposalLoadService();
      log(response.toString());
      if (response != null) {
        _proposalLoad.clear();
        print('res---------------$response');
        _proposalLoad.add(response);
       
           
      
        isproposaLoad(false);
        
         
      } else {
        isproposaLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}