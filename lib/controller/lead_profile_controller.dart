import 'dart:developer';

import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/model/lead_profile_edit_response.dart';

import 'package:leadingmanagementsystem/model/leads_profile_response.dart';

import 'package:leadingmanagementsystem/service/lead_profile_service.dart';

import '../service/lead_edit_profile_service.dart';
import 'login_controller.dart';

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
 
  RxString status = ''.obs;
  RxString source = ''.obs;
  RxString countryname=''.obs;
var data;

//
  List<LeadsProfileEditModel> _getleadeditprofile = [];
  List<LeadsProfileEditModel> get getleadeditprofile => _getleadeditprofile;
   RxBool isLeadsProfileeditLoad = true.obs;
   LeadEditProfileService leadEditProfileService=LeadEditProfileService();
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
        position.text = _getleadprofile[0].data[0].position;
        email.text = _getleadprofile[0].data[0].email;
        phonenumber.text = _getleadprofile[0].data[0].phonenumber;
        leadsvalue.text = _getleadprofile[0].data[0].leadValue;
        companyName.text = _getleadprofile[0].data[0].customer;
        des.text = _getleadprofile[0].data[0].description;
        address.text = _getleadprofile[0].data[0].address;
        city.text = _getleadprofile[0].data[0].city;
        state.text = _getleadprofile[0].data[0].state;
        zip.text = _getleadprofile[0].data[0].zip;
       countryname.value = _getleadprofile[0].data[0].country;
        status.value = _getleadprofile[0].data[0].status;
        source.value = _getleadprofile[0].data[0].source;
        log('countrylog');
       log(getleadprofile[0].data[0].country.toString());
     

        isLeadsProfileLoad(false);
          
      } else {
        isLeadsProfileLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future leadprofileEditController({leadid}) async {
    isLeadsProfileeditLoad(true);
      
      // if(isLeadsProfileeditLoad.value){
      //    _loadingBar(context);
      // }
    try {
      var response = await leadEditProfileService.leadProfileEditService(leadid: leadid,name: name.text,position: position.text,
        email: email.text,phonenumber: phonenumber.text,value: leadsvalue.text,company: companyName.text,description: des.text,country: countryname.value.toString(),
        zip: zip.text,city: city.text,state: state.text,address: address.text,status: status.value.toString(),source: source.value.toString()
);
      log(response.toString());
      if (response != null) {
        _getleadeditprofile.clear();
        print('res---------------$response');
        _getleadeditprofile.add(response);
       
           
      
        isLeadsProfileeditLoad(false);
        
         
      } else {
        isLeadsProfileeditLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}


void _loadingBar(BuildContext ctx) {
  showDialog(
      barrierDismissible: false,
      context: ctx,
      builder: (BuildContext context) {
        return const Center(
          child: Loader(),
        );
      });

}


 