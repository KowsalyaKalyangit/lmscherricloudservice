import 'dart:developer';

import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/utils/common_variable.dart';

import '../../model/Add_proposal/get_addlist_item_response.dart';
import '../../service/add_proposal_service/get_addlist_service.dart';

class GetAddItemListController extends GetxController {
  List<GetAddListItemModel> _additemlist = [];
  List<GetAddListItemModel> get getadditemproposal => _additemlist;
  RxBool isadditemlistLoad = true.obs;
  GetAddListItemService getAddListItemService = GetAddListItemService();
     TextEditingController hoistwaysize = TextEditingController();
     TextEditingController powersupply = TextEditingController();
     TextEditingController carsize = TextEditingController();
     TextEditingController delivery = TextEditingController();
     TextEditingController erection = TextEditingController();
  Future getAddItemListController({liftid}) async {
    isadditemlistLoad(true);
    try {
      var response =
          await getAddListItemService.getAddListItemService(liftid: liftid);
      log(response.toString());
      if (response != null) {
        _additemlist.clear();
        print('res---------------$response');
        _additemlist.add(response);
        commonVariable.commonapidata.value=_additemlist[0].data[0].subtotal.toString();
          commonVariable.commontotal.value=_additemlist[0].data[0].total.toString();
          powersupply.text=_additemlist[0].data[0].powerSupply.toString();

        isadditemlistLoad(false);
      } else {
        isadditemlistLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}
