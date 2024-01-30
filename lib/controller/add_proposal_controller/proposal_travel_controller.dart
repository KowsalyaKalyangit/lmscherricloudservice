import 'dart:developer';

import 'package:leadingmanagementsystem/allpackages.dart';

import '../../model/Add_proposal/proposal_travel_response.dart';

import '../../service/add_proposal_service/proposal_travel_service.dart';

class ProposalTravelController extends GetxController {
  List<ProposalTravelModel> _proposaltravel = [];
  List<ProposalTravelModel> get getproposalTravel => _proposaltravel;
  RxBool isproposaltravelLoad = true.obs;
  ProposalTravelService proposalTravelService = ProposalTravelService();
  Future proposalTravelController() async {
    isproposaltravelLoad(true);
    try {
      var response = await proposalTravelService.proposalTravelService();
      log(response.toString());
      if (response != null) {
        _proposaltravel.clear();
        print('res---------------$response');
        _proposaltravel.add(response);

        isproposaltravelLoad(false);
      } else {
        isproposaltravelLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}
