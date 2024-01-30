import 'dart:developer';

import 'package:leadingmanagementsystem/allpackages.dart';

import 'package:leadingmanagementsystem/service/add_proposal_service/proposal_create_service.dart';
import 'package:leadingmanagementsystem/view/assign/proposal_page.dart';

import '../../model/Add_proposal/proposal_create_response.dart';

class ProposalCreateController extends GetxController {
  List<ProposalCreateModel> _proposalcreateitem = [];
  List<ProposalCreateModel> get getproposalcreate => _proposalcreateitem;
  RxBool iscreateitemLoad = true.obs;
  ProposalCreateService proposalCreateService = ProposalCreateService();

  Future proposalCreateController({
    dashboard,leadid,subject,total,subtotal,taxamount,open_till,date,proposal_to,
    country,zip,state,city,address,email,phone,status,currency,liftpriceid,loadid,speedid,
travelid,stopid,openingid,controlid,operationid,machineid,hoistwaysize,carsize,delivery,
erection,power_supply
  }) async {
    iscreateitemLoad(true);
    try {
      var response = await proposalCreateService.proposalCreateService(
        leadid: leadid,subject: subject,total: total,subtotal: subtotal,taxamount: taxamount,
        open_till: open_till,date: date,proposal_to: proposal_to,country: country,zip: zip,
        state: state,city: city,address: address,email: email,phone: phone,status: status,currency: currency,
        liftpriceid: liftpriceid,loadid: loadid,speedid: speedid,travelid: travelid,stopid: stopid,
        openingid: openingid,controlid: controlid,operationid: operationid,machineid: machineid,hoistwaysize: hoistwaysize,
        carsize: carsize,delivery: delivery,erection: erection,power_supply: power_supply,

      );
      log(response.toString());
      if (response != null) {
        _proposalcreateitem.clear();
        print('res---------------$response');
        _proposalcreateitem.add(response);
       Get.back();
       Get.back();
       

        iscreateitemLoad(false);
      } else {
        iscreateitemLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}
