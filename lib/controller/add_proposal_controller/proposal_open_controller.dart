import 'dart:developer';

import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/service/add_proposal_service/proposal_stop_service.dart';

import '../../model/Add_proposal/proposal_open_response.dart';
import '../../model/Add_proposal/proposal_stop_response.dart';
import '../../model/Add_proposal/proposal_travel_response.dart';

import '../../service/add_proposal_service/proposal_opening_service.dart';
import '../../service/add_proposal_service/proposal_travel_service.dart';

class ProposalOpenController extends GetxController {
  List<ProposalOpenModel> _proposalOpen = [];
  List<ProposalOpenModel> get getproposalOpen => _proposalOpen;
  RxBool isproposalOpenLoad = true.obs;
  ProposalOpeningService proposalOpeningService = ProposalOpeningService();
  Future proposalOpenController() async {
    isproposalOpenLoad(true);
    try {
      var response = await proposalOpeningService.proposalOpeningService();
      log(response.toString());
      if (response != null) {
        _proposalOpen.clear();
        print('res---------------$response');
        _proposalOpen.add(response);

        isproposalOpenLoad(false);
      } else {
        isproposalOpenLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}
