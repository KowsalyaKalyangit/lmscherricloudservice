import 'dart:developer';

import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/model/leads_details_response.dart';
import 'package:leadingmanagementsystem/model/profile_update_response.dart';
import 'package:leadingmanagementsystem/service/get_leads_service.dart';
import 'package:leadingmanagementsystem/service/profile/profile_edit_service.dart';
import 'package:leadingmanagementsystem/service/profile/profile_service.dart';

import '../model/profile_edit_response.dart';
import '../model/profile_response.dart';
import '../service/profile/profile_update_service.dart';
import 'login_controller.dart';

class ProfileController extends GetxController {
  List<ProfileModel> _profileDetails = [];
  List<ProfileModel> get getprofiledetails => _profileDetails;
  RxBool isProfileLoad = true.obs;
  ProfileService profileService = ProfileService();
  TextEditingController name = TextEditingController();
   TextEditingController lname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController fb = TextEditingController();

  TextEditingController lkn = TextEditingController();
  TextEditingController mobile = TextEditingController();

  ProfileEditService profileEditService = ProfileEditService();
  RxBool editloading = true.obs;
  List<ProfilEditModel> _editprofiledata = [];
  List<ProfilEditModel> get editprofiledata => _editprofiledata;

  //////update
   ProfileUpdateService profileUpdateService = ProfileUpdateService();
  RxBool updateloading = true.obs;
  List<ProfileUpdateModel> _updateprofiledata = [];
  List<ProfileUpdateModel> get getupdateprofiledata => _updateprofiledata;

  Future profileController() async {
    isProfileLoad(true);
    try {
      var response = await profileService.profileService();
      log(response.toString());
      if (response != null) {
        _profileDetails.clear();
       
        _profileDetails.add(response);
        name.text = _profileDetails[0].data[0].firstname.toString();
        email.text = _profileDetails[0].data[0].email.toString();
       mobile.text= _profileDetails[0].data[0].phonenumber.toString();
       lname.text=_profileDetails[0].data[0].lastname.toString();
         

        

        isProfileLoad(false);
      } else {
        isProfileLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }

    Future geteditprofileController({context}) async {
        editloading(true);
    if (editloading.value) {
      _loadingBar(context);
    }
    try {
      var data = await profileEditService.profileEditService(
        
        firstname: name.text,
        lastname: lname.text,
       
        phonenumber: mobile.text,
       
        facebook: fb.text,
        linkedin: lkn.text,
         
      );
      if (data != null) {
        _editprofiledata.clear();
        
        _editprofiledata.add(data);
        
        editloading(false);
        Get.back();
         
      } else {
        editloading(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }

 
 ////////
    getupdateprofileController() async {

         
    try {
      var data = await profileUpdateService.profileupdateService();
      if (data != null) {
        _updateprofiledata.clear();
        
        _updateprofiledata.add(data);
        
        updateloading(false);
        
         
      } else {
        updateloading(false);
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