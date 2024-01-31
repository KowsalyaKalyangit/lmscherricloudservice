import 'dart:developer';

import 'package:leadingmanagementsystem/model/add_leads_response.dart';
import 'package:leadingmanagementsystem/model/leads_source_model.dart';
import 'package:leadingmanagementsystem/model/leads_status_response.dart';
import 'package:leadingmanagementsystem/service/add_leads_service.dart';
import 'package:leadingmanagementsystem/service/leads_coutry_service.dart';
import 'package:leadingmanagementsystem/service/leads_status_service.dart';

import '../allpackages.dart';
import '../service/leads_source_service.dart';
import 'login_controller.dart';

 

class AddAssignDetailsController extends GetxController {
  RxBool filldetailsLoad = true.obs;
    
  
  TextEditingController name = TextEditingController();
  TextEditingController position = TextEditingController();

  TextEditingController email = TextEditingController();
    TextEditingController phone = TextEditingController();
      TextEditingController leadsvalue = TextEditingController();
  TextEditingController companyName = TextEditingController();
  TextEditingController desc = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController city = TextEditingController();
  
  TextEditingController state = TextEditingController();
 var countryName = '';

  TextEditingController zipcode = TextEditingController();
  AddLeadsService addLeadsService=AddLeadsService();
  RxBool isLeadsLoading = true.obs;
   
 
  RxBool isCountryLoading = true.obs;
  RxString orderID = ''.obs;
  List<LeadsCountryModel> _profileupdatecountry = [];
  List<LeadsCountryModel> get getprofileUpdatecountry => _profileupdatecountry;
  LeadsCountryService leadsCountryService=LeadsCountryService();
  //leads status
  LeadsStatusService leadsStatusService=LeadsStatusService();
   List<LeadsStatusModel> _statusleads = [];
  List<LeadsStatusModel> get getstatusLead => _statusleads;
  RxBool isStatusLoading = true.obs;

  //leads source
  LeadsSourceService leadsSourceService=LeadsSourceService();
  List<LeadsSourceModel> _sourceleads = [];
  List<LeadsSourceModel> get getSourceLead => _sourceleads;
  RxBool isSourceLoading = true.obs;


  Future addLeadsDetailsController({context,country,status,source}) async {
    if (name.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter user name');
    } else if (position.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter mobile number');
    } else if (email.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter emailID');
    } else if (phone.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter companyname');
    } else if (leadsvalue.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter gstnumbr');
    } else if (companyName.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter address');
    } else if (desc.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter street');
    } else if (address.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter state');
    } else if (city.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter city');
    } else if (state.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter pincode');
    } 
    else if (zipcode.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter pincode');
    }
    else {
     isLeadsLoading(true);
      if (isLeadsLoading.value) {
        _loadingBar(context);
      }
      try {
        var response = await addLeadsService.addLeadsService(
                 
  
    name:name.text,
    position:position.text,
    email:email.text,
    phone:phone.text,
    leadvalue:leadsvalue.text,
    company:companyName.text,
    description:desc.text,
    address:address.text,
    city:city.text,
    state:state.text,
    country:country,
    zipcode:zipcode.text,
    status:status,
    source:source);

        if (response != null) {
          
             

          isLeadsLoading(false);
           Get.back();
          
        } 

        else {
           isLeadsLoading(false);
          Get.back();
        }
      } catch (e) {
        rethrow;
      }
    }
  }

 
   
  Future getCountry() async {
    isCountryLoading(true);
    try {
      var response = await leadsCountryService.leadsCountryService();
      log(response.toString());
      if (response != null) {
        _profileupdatecountry.clear();
        print('res---------------$response');
        _profileupdatecountry.add(response);
       
        //  for( var i=0;i< _profileupdatecountry[0].data.length;i++){
        //   log('cccuntry-----------');
        //     log(_profileupdatecountry[0].data.toSet().toList().length.toString());
        //  }
      
        isCountryLoading(false);
        
         
      } else {
        isCountryLoading(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
   Future getStatus() async {
    isStatusLoading(true);
    try {
      var response = await leadsStatusService.leadsStatusService();
      log(response.toString());
      if (response != null) {
        _statusleads.clear();
        print('res---------------$response');
        _statusleads.add(response);
       
           
      
        isStatusLoading(false);
        
         
      } else {
        isStatusLoading(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
  //leads_source
  Future getSourceLeads() async {
    isSourceLoading(true);
    try {
      var response = await leadsSourceService.leadsSourceService();
      log(response.toString());
      if (response != null) {
        _sourceleads.clear();
        print('res---------------$response');
        _sourceleads.add(response);
       
           
      
        isSourceLoading(false);
        
         
      } else {
        isSourceLoading(false);
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

