import 'dart:developer';

import 'package:leadingmanagementsystem/allpackages.dart';

import 'package:leadingmanagementsystem/service/add_proposal_service/proposal_machine_service.dart';

import '../../model/Add_proposal/proposal_machine_response.dart';

class ProposalMachineController extends GetxController {
  List<ProposalMachineModel> _proposalMachine = [];
  List<ProposalMachineModel> get getproposalMachine => _proposalMachine;
  RxBool isproposalMachineLoad = true.obs;
  ProposalMachineService proposalMachineService = ProposalMachineService();
  Future proposalMachineController() async {
    isproposalMachineLoad(true);
    try {
      var response = await proposalMachineService.proposalMachineService();
      log(response.toString());
      if (response != null) {
        _proposalMachine.clear();
        print('res---------------$response');
        _proposalMachine.add(response);

        isproposalMachineLoad(false);
      } else {
        isproposalMachineLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}
