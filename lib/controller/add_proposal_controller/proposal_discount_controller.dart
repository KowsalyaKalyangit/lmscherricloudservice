
import 'dart:developer';

import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/model/Add_proposal/proposal_discount_response.dart';
import 'package:leadingmanagementsystem/service/add_proposal_service/proposal_control_service.dart';
 
import 'package:leadingmanagementsystem/service/add_proposal_service/proposal_load_service.dart';
 
 
 

import '../../model/Add_proposal/proposal_control_response.dart';
import '../../model/Add_proposal/proposal_currency_response.dart';
import '../../model/Add_proposal/proposal_discount_response.dart';
import '../../service/add_proposal_service/proposal_currency_service.dart';
import '../../service/add_proposal_service/proposal_discount_service.dart';
 
 
class ProposalDiscountController extends GetxController{
  List<ProposalDiscountModel> _proposaldiscount=[];
  List<ProposalDiscountModel> get getproposalCurrency=>_proposaldiscount;
   RxBool isproposalDiscountLoad = true.obs;
   ProposalDiscountService proposalCurrencyService=ProposalDiscountService();
  Future proposalDiscountController() async {
    isproposalDiscountLoad(true);
    try {
      var response = await proposalCurrencyService.proposalDiscountService();
      log(response.toString());
      if (response != null) {
        _proposaldiscount.clear();
        print('res---------------$response');
        _proposaldiscount.add(response);
       
           
      
        isproposalDiscountLoad(false);
        
         
      } else {
        isproposalDiscountLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}