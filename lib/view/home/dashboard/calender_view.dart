// import 'package:location/location.dart';

// import '../../../allpackages.dart';
// import '../../../controller/profile_edit_controller.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class MapScreen extends StatelessWidget {
 
// Location location = Location();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Map'),
//       ),
//       body: Obx(() {
//         final currentLocation =;
//         return Column(
//           children: [
//             GoogleMap(
//               initialCameraPosition: CameraPosition(
//                 target: currentLocation,
//                 zoom: 12.0,
//               ),
//               // You can customize the map further here
//             ),
//             ElevatedButton(
//               onPressed: locationController.startTracking,
//               child: Text('Start Tracking'),
//             ),
//             ElevatedButton(
//               onPressed: locationController.stopTracking,
//               child: Text('Stop Tracking'),
//             ),
//           ],
//         );
//       }),
//     );
//   }
// }

 
 import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

import '../../../allpackages.dart';

 class ImageUploaderr extends StatefulWidget {
  const ImageUploaderr({super.key});

  @override
  State<ImageUploaderr> createState() => _ImageUploaderrState();
}

class _ImageUploaderrState extends State<ImageUploaderr> {
  File? _file;

  Future<void> _pickImage() async {
  
    final pickedFile = await FilePicker.platform.pickFiles(
                      type: FileType.any,
                    );
          
                

    if (pickedFile != null) {
      setState(() {
      _file = File(pickedFile.files.single.path!);
      });
    }
  

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       
      body: Center(
        child: Column(
         // mainAxisAlignment: MainAxisAlignment.center,
         
         
          children: <Widget>[
            SizedBox(height: 10.0.hp,),
             InkWell(
              onTap: () {
                 _pickImage(
                  );
              },
              child: Container(
                height: 30.0.hp,
                width: 80.0.wp,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(5)

                ),
               
                child:Center(child: Image.asset('assets/images/upload.png',height: 15.0.hp,)),
              ),
            ),
            SizedBox(height: 2.0.hp,),
            _file == null
                ? Text('no selected data')
                : Column(children: [
              // Image.file(_file!,height: 30.0.hp,) ,
                  Text(_file!.path.split('/').last)
                  ]),
           
          ],
        ),
      ),
    );
  }
}
  