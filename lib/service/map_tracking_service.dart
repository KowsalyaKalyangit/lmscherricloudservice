// import 'dart:developer';
// import 'package:http/http.dart' as http;
 
// import '../allpackages.dart';
 
// import '../model/map_model.dart';
 
 

 

// class MapTrackTimeService {
//   Future mapTrackTimeService({leadid}
//        ) async {
//          SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     var staffid = sharedPreferences.getString(Constants.staffid);
//     log('enterrrrr');
//     try {
//       var data = {
//         "dashboard": "getstafftracker",
//         "staffid":staffid??""
        
//       };
//         var jsonencode=jsonEncode(data);

//       log(data.toString());
//       log('dddddddddddd');

//       var response =
//           await http.post(Uri.parse('https://professionalelevators.in/api/servicelogin.php'), body: jsonencode);

//       var jsonresponse = jsonDecode(response.body);
//       log(response.body.toString());

//       if (response.statusCode == 200) {
        
//           Fluttertoast.showToast(msg: jsonresponse['message']);
//           return MapTrackTimeModel.fromJson(jsonresponse);
//         } else {
//           Fluttertoast.showToast(msg: jsonresponse['message'].toString());
//          // Get.back();
//         }
      
//     } catch (e) {
//       rethrow;
//     }
//   }
// }
