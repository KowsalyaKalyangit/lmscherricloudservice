
import 'dart:developer';

import 'package:leadingmanagementsystem/allpackages.dart';
 
import 'package:leadingmanagementsystem/service/get_leads_service.dart';
import 'package:leadingmanagementsystem/service/proposal/proposal_lead_type_service.dart';

import '../../model/proposal_response/proposal_leadtype_response.dart';

class ProposalLeadTypeController extends GetxController{
  List<ProposalLeadTypeModel> _leadstypeDetails=[];
  List<ProposalLeadTypeModel> get getleadstypeDetails=>_leadstypeDetails;
   RxBool isLeadstypeLoad = true.obs;
   ProposalTypeService proposalTypeService=ProposalTypeService();
  Future proposalLeadTypeController() async {
    isLeadstypeLoad(true);
    try {
      var response = await proposalTypeService.proposalTypeService();
      log(response.toString());
      if (response != null) {
        _leadstypeDetails.clear();
        print('res---------------$response');
        _leadstypeDetails.add(response);
       
           
      
        isLeadstypeLoad(false);
        
         
      } else {
        isLeadstypeLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}