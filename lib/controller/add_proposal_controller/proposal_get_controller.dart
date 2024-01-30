
import 'dart:developer';

import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/service/add_proposal_service/proposal_control_service.dart';
import 'package:leadingmanagementsystem/service/add_proposal_service/proposal_get_service.dart';
 
import 'package:leadingmanagementsystem/service/add_proposal_service/proposal_load_service.dart';
 
 
 

import '../../model/Add_proposal/proposal_control_response.dart';
import '../../model/Add_proposal/proposal_currency_response.dart';
import '../../model/Add_proposal/proposal_get_response.dart';
import '../../service/add_proposal_service/proposal_currency_service.dart';
 
 
class ProposalGetController extends GetxController{
  List<ProposalGetModel> _getproposallist=[];
  List<ProposalGetModel> get getproposallist=>_getproposallist;
   RxBool isproposalgetLoad = true.obs;
   GetProposalService getproposalService=GetProposalService();
  Future getproposalController({leadid}) async {
    isproposalgetLoad(true);
    try {
      var response = await getproposalService.getProposalService(leadid: leadid);
      log(response.toString());
      if (response != null) {
        _getproposallist.clear();
        print('res---------------$response');
        _getproposallist.add(response);
       
           
      
        isproposalgetLoad(false);
        
         
      } else {
        isproposalgetLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}