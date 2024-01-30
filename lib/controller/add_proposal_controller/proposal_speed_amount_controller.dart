
import 'dart:developer';

import 'package:leadingmanagementsystem/allpackages.dart';
 
import 'package:leadingmanagementsystem/service/add_proposal_service/proposal_load_service.dart';
import 'package:leadingmanagementsystem/service/add_proposal_service/proposal_speed_amount_service.dart';
 
 
 

import '../../model/Add_proposal/proposal_load_response.dart';
import '../../model/Add_proposal/proposal_speed_amount_response.dart';
import '../../utils/common_variable.dart';
 
class ProposalSpeedAmtController extends GetxController{
  List<ProposalSpeedAmountModel> _proposalspeedamt=[];
  List<ProposalSpeedAmountModel> get getproposalspeedamt=>_proposalspeedamt;
   RxBool isproposaspeedamtLoad = true.obs;
   ProposalSpeedAmountService proposalSpeedAmountService=ProposalSpeedAmountService();
   var speeddata;
  Future proposalSpeedAmtController({speedid,total,subtotal}) async {
    isproposaspeedamtLoad(true);
    try {
      var response = await proposalSpeedAmountService.proposalSpeedAmountService(speedid:speedid,total: total,subtotal: subtotal );
      log(response.toString());
      if (response != null) {
        _proposalspeedamt.clear();
        print('res---------------$response');
        _proposalspeedamt.add(response);
       commonVariable.commonapidata.value=_proposalspeedamt[0].data[0].subtotal.toString();
         commonVariable.commontotal.value=_proposalspeedamt[0].data[0].total.toString();
           
      
        isproposaspeedamtLoad(false);
        
         
      } else {
        isproposaspeedamtLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}