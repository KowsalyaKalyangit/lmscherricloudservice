import 'dart:developer';

import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/utils/common_variable.dart';

import '../../model/Add_proposal/proposal_load_amt_response.dart';
import '../../model/Add_proposal/proposal_load_response.dart';

import '../../service/add_proposal_service/proposal_load_amt_service.dart';

class ProposalLoadAmtController extends GetxController {
  List<ProposalLoadAmtModel> _proposalLoadamt = [];
  List<ProposalLoadAmtModel> get getproposalloadamt => _proposalLoadamt;
  RxBool isproposaLoadamtLoad = true.obs;
  ProposalLoadAmountService proposalLoadAmountService =
      ProposalLoadAmountService();
  var speeddata;
  Future proposalLoadAmtController({loadid, total, subtotal}) async {
    isproposaLoadamtLoad(true);
    try {
      var response = await proposalLoadAmountService.proposalLoadAmountService(
          loadid: loadid, total: total, subtotal: subtotal);
      log(response.toString());
      if (response != null) {
        _proposalLoadamt.clear();
        print('res---------------$response');
        _proposalLoadamt.add(response);
        commonVariable.commonapidata.value=_proposalLoadamt[0].data[0].subtotal.toString();
         commonVariable.commontotal.value=_proposalLoadamt[0].data[0].total.toString();

        isproposaLoadamtLoad(false);
      } else {
        isproposaLoadamtLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}
