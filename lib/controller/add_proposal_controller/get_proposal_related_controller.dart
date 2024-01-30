import 'dart:developer';

import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/model/Add_proposal/get_proposal_related_model.dart';
import 'package:leadingmanagementsystem/service/add_proposal_service/get_proposal_related_service.dart';
import 'package:leadingmanagementsystem/service/add_proposal_service/proposal_related_service.dart';

import '../../model/proposal_response/proposal_leadtype_response.dart';

class GetProposalRelatedController extends GetxController {
  List<GetProposalRelatedModel> _getproposalrelated = [];
  List<GetProposalRelatedModel> get getproposalrelatedDetails =>
      _getproposalrelated;
  RxBool isgetproposalreletadLoad = true.obs;
  GetProposalRelatedService getproposalRelatedService =
      GetProposalRelatedService();
 TextEditingController subject = TextEditingController();
  TextEditingController toname = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController zip = TextEditingController();
  TextEditingController tomail = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController oepntill = TextEditingController();
  TextEditingController leadname = TextEditingController();
  
  Future getproposalrelatedController({leadid}) async {
    isgetproposalreletadLoad(true);
    try {
      var response = await getproposalRelatedService.proposalRelatedService(
          leadid: leadid, );
      log(response.toString());
      if (response != null) {
        _getproposalrelated.clear();
        print('res---------------$response');
        _getproposalrelated.add(response);
         toname.text = _getproposalrelated[0].data[0].to;
        address.text = _getproposalrelated[0].data[0].address;
        city.text = _getproposalrelated[0].data[0].city;
        state.text = _getproposalrelated[0].data[0].state;
        country.text = _getproposalrelated[0].data[0].country;
        zip.text = _getproposalrelated[0].data[0].zip;
        tomail.text = _getproposalrelated[0].data[0].toemail;
        phone.text = _getproposalrelated[0].data[0].phone;
        date.text =
            '${DateTime.parse(_getproposalrelated[0].data[0].date.toString()).year.toString()}-${DateTime.parse(_getproposalrelated[0].data[0].date.toString()).month.toString()}-${DateTime.parse(_getproposalrelated[0].data[0].date.toString()).day}';
        // date.text = _getproposalrelated[0].data[0].date.toString();
        oepntill.text =
            '${DateTime.parse(_getproposalrelated[0].data[0].opentill.toString()).year.toString()}-${DateTime.parse(_getproposalrelated[0].data[0].opentill.toString()).month.toString()}-${DateTime.parse(_getproposalrelated[0].data[0].opentill.toString()).day}';
        leadname.text =
            '${_getproposalrelated[0].data[0].name}-${_getproposalrelated[0].data[0].email}';
             
        isgetproposalreletadLoad(false);
      } else {
        isgetproposalreletadLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}
