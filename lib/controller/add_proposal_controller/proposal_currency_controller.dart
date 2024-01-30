
import 'dart:developer';

import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/service/add_proposal_service/proposal_control_service.dart';
 
import 'package:leadingmanagementsystem/service/add_proposal_service/proposal_load_service.dart';
 
 
 

import '../../model/Add_proposal/proposal_control_response.dart';
import '../../model/Add_proposal/proposal_currency_response.dart';
import '../../service/add_proposal_service/proposal_currency_service.dart';
 
 
class ProposalCurrencyController extends GetxController{
  List<ProposalCurrencyModel> _proposalCurrency=[];
  List<ProposalCurrencyModel> get getproposalCurrency=>_proposalCurrency;
   RxBool isproposalCurrencyLoad = true.obs;
   ProposalCurrencyService proposalCurrencyService=ProposalCurrencyService();
  Future proposalCurrencyController() async {
    isproposalCurrencyLoad(true);
    try {
      var response = await proposalCurrencyService.proposalCurrencyService();
      log(response.toString());
      if (response != null) {
        _proposalCurrency.clear();
        print('res---------------$response');
        _proposalCurrency.add(response);
       
           
      
        isproposalCurrencyLoad(false);
        
         
      } else {
        isproposalCurrencyLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}