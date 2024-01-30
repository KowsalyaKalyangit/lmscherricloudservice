import 'dart:developer';

import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/service/add_proposal_service/proposal_operation_service.dart';

 

import '../../model/Add_proposal/proposal_operation_response.dart';
 

class ProposalOperationController extends GetxController {
  List<ProposalOperationModel> _proposalOperation = [];
  List<ProposalOperationModel> get getproposalOperation => _proposalOperation;
  RxBool isproposalOperationLoad = true.obs;
  ProposalOperationService proposalOperationService = ProposalOperationService();
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
}
