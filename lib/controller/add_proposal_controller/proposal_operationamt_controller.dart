 import 'dart:developer';

import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/service/add_proposal_service/proposal_operation_amt_service.dart';
import 'package:leadingmanagementsystem/utils/common_variable.dart';

import '../../model/Add_proposal/proposal_load_amt_response.dart';
import '../../model/Add_proposal/proposal_load_response.dart';

import '../../model/Add_proposal/proposal_operation_amt_response.dart';
import '../../service/add_proposal_service/proposal_load_amt_service.dart';

class ProposalOperationAmtController extends GetxController {
  List<ProposalOpersationAmtModel> _proposaloperationamt = [];
  List<ProposalOpersationAmtModel> get getproposaloperationamt => _proposaloperationamt;
  RxBool isproposaloperationamtLoad = true.obs;
  ProposalOperationAmtService proposalOpersationAmtModel =
      ProposalOperationAmtService();
  var speeddata;
  Future proposalOperationAmtController({operationid, typeid,total, subtotal}) async {
    isproposaloperationamtLoad(true);
    try {
      var response = await proposalOpersationAmtModel.proposalOperationAmtService(
          operationid: operationid,typeid:typeid, total: total, subtotal: subtotal);
      log(response.toString());
      if (response != null) {
        _proposaloperationamt.clear();
        print('res---------------$response');
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
