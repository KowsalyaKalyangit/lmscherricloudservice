
import 'dart:developer';

import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/model/Add_proposal/proposal_related_model.dart';
import 'package:leadingmanagementsystem/service/add_proposal_service/proposal_related_service.dart';
 
 

import '../../model/proposal_response/proposal_leadtype_response.dart';

class ProposalRelatedController extends GetxController{
  List<ProposalRelatedModel> _proposalrelated=[];
  List<ProposalRelatedModel> get getleadstypeDetails=>_proposalrelated;
   RxBool isproposalreletadLoad = true.obs;
   ProposalRelatedService proposalRelatedService=ProposalRelatedService();
  Future proposalrelatedController() async {
    isproposalreletadLoad(true);
    try {
      var response = await proposalRelatedService.proposalRelatedService();
      log(response.toString());
      if (response != null) {
        _proposalrelated.clear();
        print('res---------------$response');
        _proposalrelated.add(response);
       
           
      
        isproposalreletadLoad(false);
        
         
      } else {
        isproposalreletadLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}