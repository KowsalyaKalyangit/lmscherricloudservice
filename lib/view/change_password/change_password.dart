import 'package:leadingmanagementsystem/view/change_password/create_password.dart';

import '../../allpackages.dart';
import '../../utils/textstyles.dart';
import 'details.dart';
 

class CreatenewPassword extends StatefulWidget {
  const CreatenewPassword({
    Key? key,
  }) : super(key: key);

  @override
  State<CreatenewPassword> createState() => _CreatenewPasswordState();
}

class _CreatenewPasswordState extends State<CreatenewPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: appcolor,
            //  / automaticallyImplyLeading: false,
            centerTitle: true,
            leading: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(Icons.arrow_back))),
            title: Text(
              'Change Password',
              style: toptitleStyle,
            )),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              DummyDetails(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              CreateNewPasswordInputFields(),
            ],
          ),
        )));
  }
}
