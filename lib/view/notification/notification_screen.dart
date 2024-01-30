 

import '../../allpackages.dart';
import '../../controller/notification_controller.dart';
import '../../utils/textstyles.dart';
import 'notification_list.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        //Get.offAll(HomePage());
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            elevation: 10,
            backgroundColor: appcolor,
            centerTitle: true,
            // leading: Padding(
            //   padding: const EdgeInsets.all(10.0),
            //   child: InkWell(
            //     onTap: () {
            //       Get.offAll(HomePage());
            //     },
            //     child: Image.asset(
            //       'assets/images/back.png',
            //       width: 20,
            //       height: 20,
            //     ),
            //   ),
            // ),
            automaticallyImplyLeading: false,
            title: Text(
              'NOTIFICATION',
              style: apptitle,
            )),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              SizedBox(
                height: 20,
              ),
              NotificationList(),
            ],
          ),
        )),
      ),
    );
  }
}
