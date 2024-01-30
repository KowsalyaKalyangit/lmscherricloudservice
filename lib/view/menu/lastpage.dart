import 'package:flutter/material.dart';

import '../../allpackages.dart';
import '../../controller/profile_controller.dart';
import '../../utils/textstyles.dart';
import 'profile_bottomsheet.dart';

class LastPage extends StatefulWidget {
  const LastPage({super.key});

  @override
  State<LastPage> createState() => _LastPageState();
}

class _LastPageState extends State<LastPage> {
  ProfileController profileController=Get.put(ProfileController());
  @override
  void initState() {
  fun();
    super.initState();
  }
  fun()async{
     profileController.geteditprofileController(context: context);
    
  }
  @override
  Widget build(BuildContext context) {
    return Obx((){
      if(profileController.editloading.value){
            return Center(child: CircularProgressIndicator(),);
          }
          else if(profileController.editprofiledata.isEmpty){
            return Center(child: Text('No Data Found'),);
          }
          else{
    return Scaffold(
        appBar: AppBar(
          title:  Container(
              color: const Color(0xffD9D9D9).withOpacity(0.1),
              height: 7.00.hp, width: 95.00.wp,
              // padding: const EdgeInsets.only(
              //   left: 20,
              //   right: 20,
              // ),
              child: TextFormField(
                controller: profileController.name,
                
               
                style: GoogleFonts.jost(
                    textStyle: TextStyle(
                        fontSize: 10.00.sp,
                        color: forminputcolor,
                        fontWeight: FontWeight.w500)),
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(color: appcolor, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                          color: const Color(0xffC6C6C6).withOpacity(0.5),
                          width: 1),
                    ),
                    fillColor: const Color(0xffC6C6C6),
                      prefixIcon: Icon(Icons.person_outline,color: appcolor,),
                    hintText: 'Name',
                    contentPadding: const EdgeInsets.only(left: 10),
                    hintStyle: GoogleFonts.jost(
                        textStyle: TextStyle(
                            fontSize: 10.00.sp,
                            color: formhintcolor,
                            fontWeight: FontWeight.w500)),
                    border: const OutlineInputBorder(
                      gapPadding: 4,
                    )),
              ),
            ),
          actions: [
            IconButton(onPressed: (){
              showModalBottomSheet(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40))),
                context: context,
                builder: (BuildContext context) {
                  return BottomSheetContent();
                },
              );
            }, icon: Icon(Icons.edit))
          ],
        ),
        body: Column(children: [
    
        ]),
      );
  }});
  }
}