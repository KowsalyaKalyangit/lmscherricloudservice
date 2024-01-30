import 'dart:developer';

import 'package:leadingmanagementsystem/allpackages.dart';

import 'package:leadingmanagementsystem/model/leads_profile_response.dart';

import 'package:leadingmanagementsystem/service/lead_profile_service.dart';

class LeadsprofileController extends GetxController {
  List<LeadsProfileModel> _getleadprofile = [];
  List<LeadsProfileModel> get getleadprofile => _getleadprofile;
  RxBool isLeadsProfileLoad = true.obs;
  LeadProfileService leadProfileService = LeadProfileService();
  TextEditingController name = TextEditingController();
  TextEditingController position = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  TextEditingController leadsvalue = TextEditingController();

  TextEditingController companyName = TextEditingController();
  TextEditingController des = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController zip = TextEditingController();
  RxString country = ''.obs;
  RxString status = ''.obs;
  RxString source = ''.obs;
 
var data;
  Future leadprofileController() async {
    isLeadsProfileLoad(true);
    try {
      var response = await leadProfileService.leadProfileService();
      log(response.toString());
      if (response != null) {
        _getleadprofile.clear();
        print('res---------------$response');
        _getleadprofile.add(response);
        name.text = _getleadprofile[0].data[0].name;
        position.text = _getleadprofile[0].data[0].name;
        email.text = _getleadprofile[0].data[0].name;
        phonenumber.text = _getleadprofile[0].data[0].name;
        leadsvalue.text = _getleadprofile[0].data[0].name;
        companyName.text = _getleadprofile[0].data[0].name;
        des.text = _getleadprofile[0].data[0].name;
        address.text = _getleadprofile[0].data[0].name;
        city.text = _getleadprofile[0].data[0].name;
        state.text = _getleadprofile[0].data[0].name;
        zip.text = _getleadprofile[0].data[0].name;
        //countryname = _getleadprofile[0].data[0].country ;
        status.value = _getleadprofile[0].data[0].status;
        source.value = _getleadprofile[0].data[0].source;
       
     

        isLeadsProfileLoad(false);
      } else {
        isLeadsProfileLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}
