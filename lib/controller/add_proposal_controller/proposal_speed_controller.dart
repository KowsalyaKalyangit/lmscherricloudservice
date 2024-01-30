import 'dart:developer';

import 'package:leadingmanagementsystem/allpackages.dart';

import '../../model/Add_proposal/proposal_speed_response.dart';

import '../../service/add_proposal_service/proposal_status_service.dart';
import '../../service/add_proposal_service/prposal_speed_service.dart';

class ProposalSpeedController extends GetxController {
  List<ProposalSpeedModel> _proposalspeed = [];
  List<ProposalSpeedModel> get getproposalSpeed => _proposalspeed;
  RxBool isproposalspeedLoad = true.obs;
  ProposalSPeedService proposalSPeedService = ProposalSPeedService();
  Future proposalSpeedController() async {
    isproposalspeedLoad(true);
    try {
      var response = await proposalSPeedService.proposalSpeedService();
      log(response.toString());
      if (response != null) {
        _proposalspeed.clear();
        print('res---------------$response');
        _proposalspeed.add(response);

        isproposalspeedLoad(false);
      } else {
        isproposalspeedLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}
