import 'dart:developer';

import 'package:leadingmanagementsystem/allpackages.dart';

import '../../model/Add_proposal/proposal_edit_response.dart';

import '../../service/add_proposal_service/proposal_edit_service.dart';

class ProposalEditController extends GetxController {
  List<ProposalEditModel> _proposalEdit = [];
  List<ProposalEditModel> get getproposalEdit => _proposalEdit;
  RxBool isproposalEditLoad = true.obs;
  ProposalEditService proposalEditService = ProposalEditService();
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
  //...
  TextEditingController hoistwaysize = TextEditingController();
  TextEditingController carsize = TextEditingController();
  TextEditingController delivery = TextEditingController();
  TextEditingController eretionname = TextEditingController();
  TextEditingController powersupply = TextEditingController();
   
  RxString type = ''.obs;
  RxString load = ''.obs;
  RxString speed = ''.obs;
  RxString travel = ''.obs;
  RxString operation = ''.obs;
  RxString control = ''.obs;
  RxString machine = ''.obs;
    RxString total = ''.obs;
  RxString subtotal = ''.obs;

  Future proposalEditController({proposalid}) async {
    isproposalEditLoad(true);
    try {
      var response =
          await proposalEditService.proposalEditService(proposalid: proposalid);
      log(response.toString());
      if (response != null) {
        

        
        
        _proposalEdit.add(response);
       

        subject.text = _proposalEdit[0].data[0].subject;
        leadname.text = _proposalEdit[0].data[0].lead;
        address.text = _proposalEdit[0].data[0].address;
        city.text = _proposalEdit[0].data[0].city;
        state.text = _proposalEdit[0].data[0].state;
        country.text = _proposalEdit[0].data[0].country;
        zip.text = _proposalEdit[0].data[0].zip;
        tomail.text = _proposalEdit[0].data[0].toemail;
        phone.text = _proposalEdit[0].data[0].phone;
        date.text =
            '${DateTime.parse(_proposalEdit[0].data[0].date.toString()).year.toString()}-${DateTime.parse(_proposalEdit[0].data[0].date.toString()).month.toString()}-${DateTime.parse(_proposalEdit[0].data[0].date.toString()).day}';
        // date.text = _getproposalrelated[0].data[0].date.toString();
        oepntill.text =
            '${DateTime.parse(_proposalEdit[0].data[0].openTill.toString()).year.toString()}-${DateTime.parse(_proposalEdit[0].data[0].openTill.toString()).month.toString()}-${DateTime.parse(_proposalEdit[0].data[0].openTill.toString()).day}';
        type.value = _proposalEdit[0].data[0].type;
        load.value=_proposalEdit[0].data[0].load;
          speed.value=_proposalEdit[0].data[0].speed;
            travel.value=_proposalEdit[0].data[0].travel;
              operation.value=_proposalEdit[0].data[0].operation;
                control.value=_proposalEdit[0].data[0].control;
                  machine.value=_proposalEdit[0].data[0].machine;
                    hoistwaysize.text = _proposalEdit[0].data[0].hoistwaysize;
        carsize.text = _proposalEdit[0].data[0].carsize;
        delivery.text = _proposalEdit[0].data[0].delivery;
        eretionname.text = _proposalEdit[0].data[0].erection;
        powersupply.text = _proposalEdit[0].data[0].powerSupply;
        
                 

        isproposalEditLoad(false);
      } else {
        isproposalEditLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}
