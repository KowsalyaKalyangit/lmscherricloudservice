import 'dart:developer';

import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/service/add_proposal_service/add_item_proposal_service.dart';

import '../../model/Add_proposal/add_item_proposal_response.dart';

class AddItemProposalController extends GetxController {
  List<AddItemProposalModel> _proposaladditem = [];
  List<AddItemProposalModel> get getadditemproposal => _proposaladditem;
  RxBool isadditemLoad = true.obs;
  AddItemProposalService addItemProposalService = AddItemProposalService();

  Future addItemProposalController() async {
    isadditemLoad(true);
    try {
      var response = await addItemProposalService.addItemProposalService();
      log(response.toString());
      if (response != null) {
        _proposaladditem.clear();
        print('res---------------$response');
        _proposaladditem.add(response);

        isadditemLoad(false);
      } else {
        isadditemLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}
