 

import 'package:leadingmanagementsystem/utils/textstyles.dart';

import '../../allpackages.dart';
import '../../controller/profile_controller.dart';
import '../../utils/small_action_button.dart';
import 'detail_section.dart';
import 'profile_image.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
   
  // ignore: prefer_final_fields

  var items = [
    'TamilNadu',
    'Assam',
    'Bihar',
    'Andhra Prdhesh',
    'Uttra ',
  ];

  String dropdownvalue = 'TamilNadu';
   ProfileController profileController=ProfileController();
  @override
  void initState() {
  profileController.profileController();
    super.initState();
  }
 
   
   

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
          backgroundColor:appcolor,
          body: Obx((){
            if(profileController.isProfileLoad.value){
                return Center(child: CircularProgressIndicator(),);
              }
              else if(profileController.getprofiledetails.isEmpty){
                return Center(child: Text('No data found'),);
              }
              else{
       return SafeArea(
                child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Center(
                            child: Padding(
                          padding: EdgeInsets.only(left: 10.0, top: 4.00.hp),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Image.asset(
                                  'assets/images/back_arrow.png',
                                  height: 35,
                                  width: 35,
                                ),
                              )
                            ],
                          ),
                        )),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 16.00.hp,
                          ),
                          child: Container(
                              width: 100.00.wp,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                    bottomLeft: Radius.circular(20.0),
                                    bottomRight: Radius.circular(20.0),
                                  )),
                              child: const DetailsSection()),
                        ),
                      Positioned(
                top: 9.00.hp,
                child: SizedBox(
                  width: 100.00.wp,
                  child: Column(
            children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:   [
                    Center(
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 55.0,
                        child: CircleAvatar(
                          backgroundColor:appcolor,
                          radius: 52.0,
                          child: CircleAvatar(
                             backgroundColor: Colors.white,
                            backgroundImage: NetworkImage(profileController.getprofiledetails[0].data[0].profileImage.toString()),
                            radius: 50.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
            
              
               Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                       '${ profileController.name.text} ${profileController.getprofiledetails[0].data[0].lastname}',
                        textAlign: TextAlign.center,
                        style: editprofilename,
                      ),
                    ),
                  ],
              ),
             
            ],
                  ),
                ),
              )
                      ],
                    ),
                   
                  ],
                ),
              ),
            ));
  }}),
        );
      }
    
  }

