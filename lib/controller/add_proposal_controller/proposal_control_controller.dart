
import 'dart:developer';

import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/service/add_proposal_service/proposal_control_service.dart';
 
import 'package:leadingmanagementsystem/service/add_proposal_service/proposal_load_service.dart';
 
 
 

import '../../model/Add_proposal/proposal_control_response.dart';
 
 
class ProposalControlController extends GetxController{
  List<ProposalControlModel> _proposalControl=[];
  List<ProposalControlModel> get getproposalControl=>_proposalControl;
   RxBool isproposalControlLoad = true.obs;
   ProposalControlService proposalControlService=ProposalControlService();
  Future proposalControlController() async {
    isproposalControlLoad(true);
    try {
      var response = await proposalControlService.proposalControlService();
      log(response.toString());
      if (response != null) {
        _proposalControl.clear();
        print('res---------------$response');
        _proposalControl.add(response);
       
           
      
        isproposalControlLoad(false);
        
         
      } else {
        isproposalControlLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}