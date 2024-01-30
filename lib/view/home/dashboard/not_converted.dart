import 'dart:io';

import 'package:image_picker/image_picker.dart';

import '../../../allpackages.dart';
 import 'package:http/http.dart' as http;

class UploadPage extends StatefulWidget {
  UploadPage({  Key ?key,  }) : super(key: key);

   

  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {

  Future<String> uploadImage(filename,  ) async {
    var request = http.MultipartRequest('POST', Uri.parse('https://api.escuelajs.co/api/v1/files/upload'));
    request.files.add(await http.MultipartFile.fromPath('picture', filename));
    var res = await request.send();
    return res.reasonPhrase.toString();
  }
  String state = "";
func
(String filename,) async {
  var request = http.MultipartRequest('POST', Uri.parse('https://api.escuelajs.co/api/v1/files/upload'));
  request.files.add(
    http.MultipartFile(
      'file',
      File(filename).readAsBytes().asStream(),
      File(filename).lengthSync(),
      filename: filename.split("/").last
    )
  );
  var res = await request.send();
  print(res);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter File Upload Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(state)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
            final imagePicker = ImagePicker();
          var file = await imagePicker.pickImage(source: ImageSource.gallery);
          var res = await uploadImage(file!.path);
          // setState(() {
          //   state = res;
          //   print(res);
          // });
          func(res);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}