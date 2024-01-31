import 'dart:developer';

import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/service/add_proposal_service/proposal_operation_service.dart';

 

import '../../model/Add_proposal/proposal_operation_amt_response.dart';
import '../../model/Add_proposal/proposal_operation_response.dart';
import '../../service/add_proposal_service/proposal_operation_amt_service.dart';
import '../../utils/common_variable.dart';
 

class ProposalOperationController extends GetxController {
  List<ProposalOperationModel> _proposalOperation = [];
  List<ProposalOperationModel> get getproposalOperation => _proposalOperation;
  RxBool isproposalOperationLoad = true.obs;
  ProposalOperationService proposalOperationService = ProposalOperationService();

  ///
   List<ProposalOpersationAmtModel> _proposaloperationamt = [];
  List<ProposalOpersationAmtModel> get getproposaloperationamt => _proposaloperationamt;
  RxBool isproposaloperationamtLoad = true.obs;
  ProposalOperationAmtService proposalOpersationAmtModel =
      ProposalOperationAmtService();
  Future proposalOperationController() async {
    isproposalOperationLoad(true);
    try {
      var response = await proposalOperationService.proposalOperationService();
      log(response.toString());
      if (response != null) {
        _proposalOperation.clear();
        print('res---------------$response');
        _proposalOperation.add(response);

        isproposalOperationLoad(false);
      } else {
        isproposalOperationLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future proposalOperationAmtController({operationid, typeid,total, subtotal}) async {
   
    try {
      var response = await proposalOpersationAmtModel.proposalOperationAmtService(
          operationid: operationid,typeid:typeid, total: total, subtotal: subtotal);
      log(response.toString());
      if (response != null) {
         isproposaloperationamtLoad(true);
        _proposaloperationamt.clear();
        
        _proposaloperationamt.add(response);
        commonVariable.commonapidata.value=_proposaloperationamt[0].data[0].subtotal.toString();
         commonVariable.commontotal.value=_proposaloperationamt[0].data[0].total.toString();

        isproposaloperationamtLoad(false);
      } else {
        isproposaloperationamtLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}
