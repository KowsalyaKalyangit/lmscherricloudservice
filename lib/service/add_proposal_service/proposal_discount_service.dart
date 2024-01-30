import 'dart:developer';
import 'package:http/http.dart' as http;

import '../../allpackages.dart';
import '../../model/Add_proposal/proposal_control_response.dart';
import '../../model/Add_proposal/proposal_currency_response.dart';
import '../../model/Add_proposal/proposal_discount_response.dart';
import '../../model/Add_proposal/proposal_load_response.dart';
 

class ProposalDiscountService {
  Future proposalDiscountService() async {
    
    log('enterrrrr');
    try {
      var data = {
        "dashboard": "getproposaldsiscount",
      };
      var jsonencode = jsonEncode(data);

      log(data.toString());
      log('dddddddddddd');

      var response =
          await http.post(Uri.parse(Urls.lead_country), body: jsonencode);

      var jsonresponse = jsonDecode(response.body);
      log(response.body.toString());

      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: jsonresponse['message']);
        return ProposalDiscountModel.fromJson(jsonresponse);
      } else {
        Fluttertoast.showToast(msg: jsonresponse['message'].toString());
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}
