import 'dart:developer';
import 'package:http/http.dart' as http;

import '../../allpackages.dart';

import '../../model/Add_proposal/proposal_operation_amt_response.dart';

class ProposalOperationAmtService {
  Future proposalOperationAmtService(
      {operationid, typeid, subtotal, total}) async {
    log('enterrrrr');
    try {
      var data = {
        "dashboard": "getproposaloperationvalue",
        "operationid": operationid ?? '',
        "typeid": typeid ?? '',
        "subtotal": subtotal ?? '',
        "total": total ?? ''
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
        return ProposalOpersationAmtModel.fromJson(jsonresponse);
      } else {
        Fluttertoast.showToast(msg: jsonresponse['message'].toString());
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}
