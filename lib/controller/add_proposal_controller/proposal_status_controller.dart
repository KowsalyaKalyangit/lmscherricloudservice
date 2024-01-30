
import 'dart:developer';

import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/model/Add_proposal/proposal_related_model.dart';
import 'package:leadingmanagementsystem/service/add_proposal_service/proposal_related_service.dart';
 
 

import '../../model/Add_proposal/proposal_status_response.dart';
import '../../model/proposal_response/proposal_leadtype_response.dart';
import '../../service/add_proposal_service/proposal_status_service.dart';

class ProposalStatusController extends GetxController{
  List<ProposalStatusModel> _proposalstatus=[];
  List<ProposalStatusModel> get getproposalstatus=>_proposalstatus;
   RxBool isproposalstatusLoad = true.obs;
   ProposalStatusService proposalStatusService=ProposalStatusService();
  Future proposalStatusController() async {
    isproposalstatusLoad(true);
    try {
      var response = await proposalStatusService.proposalStatusService();
      log(response.toString());
      if (response != null) {
        _proposalstatus.clear();
        print('res---------------$response');
        _proposalstatus.add(response);
       
           
      
        isproposalstatusLoad(false);
        
         
      } else {
        isproposalstatusLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}