import 'package:flutter/material.dart';
import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/utils/textstyles.dart';

import '../../controller/profile_controller.dart';
import '../../utils/small_action_button.dart';

class BottomSheetContent extends StatefulWidget {
  const BottomSheetContent({super.key});

  @override
  State<BottomSheetContent> createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  var reason;
  var city;
  ProfileController profileController=ProfileController();
  @override
  void initState() {
  profileController.profileController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
     return Obx((){
       if(profileController.isProfileLoad.value){
            return Center(child: CircularProgressIndicator(),);
          }
          else if(profileController.getprofiledetails.isEmpty){
            return Center(child: Text('No Data Found'),);
          }
          else{
      return Column(
         
        children: [
          // Background screen
          SizedBox(height: 1.0.hp,),
           Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:   [
                      Center(
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 30.0,
                          child: CircleAvatar(
                            backgroundColor:appcolor,
                            radius: 32.0,
                            child: CircleAvatar(
                               backgroundColor: Colors.white,
                              backgroundImage: NetworkImage(profileController.getprofiledetails[0].data[0].profileImage.toString()),
                              radius: 28.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 1.0.hp,),
                  Text(profileController.name.text,style: listtitle,),
                   SizedBox(height: 1.0.hp,),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                       Container(
              color: const Color(0xffD9D9D9).withOpacity(0.1),
              height: 7.00.hp, width: 45.00.wp,
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
                    label: Text('Firstname'),
                    labelStyle:GoogleFonts.jost(
                        textStyle: TextStyle(
                            fontSize: 10.00.sp,
                            color: formhintcolor,
                            fontWeight: FontWeight.w500)) ,
                    fillColor: const Color(0xffC6C6C6),
                      prefixIcon: Icon(Icons.person_outline,color: appcolor,),
                    hintText: 'fname',
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
             
            Container(
              color: const Color(0xffD9D9D9).withOpacity(0.1),
              height: 7.00.hp, width: 45.00.wp,
              // padding: const EdgeInsets.only(
              //   left: 20,
              //   right: 20,
              // ),
              child: TextFormField(
                
                
               controller: profileController.lname,
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
                    label: Text('Lastname'),
                    labelStyle:GoogleFonts.jost(
                        textStyle: TextStyle(
                            fontSize: 10.00.sp,
                            color: formhintcolor,
                            fontWeight: FontWeight.w500)) ,
                      prefixIcon: Icon(Icons.person_outline,color: appcolor,),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                          color: const Color(0xffC6C6C6).withOpacity(0.5),
                          width: 1),
                    ),
                    fillColor: const Color(0xffC6C6C6),
                    hintText: 'lastname',
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
                    ],
                   ),
           
            
            const SizedBox(
              height: 15,
            ),
            Container(
              color: const Color(0xffD9D9D9).withOpacity(0.1),
              height: 7.00.hp, width: 95.00.wp,
              // padding: const EdgeInsets.only(
              //   left: 20,
              //   right: 20,
              // ),
              child: TextFormField(
                enabled: false,
                
               controller: profileController.email,
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
                    label: Text('Email'),
                    labelStyle:GoogleFonts.jost(
                        textStyle: TextStyle(
                            fontSize: 10.00.sp,
                            color: formhintcolor,
                            fontWeight: FontWeight.w500)) ,
                      prefixIcon: Icon(Icons.email_outlined,color: appcolor,),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                          color: const Color(0xffC6C6C6).withOpacity(0.5),
                          width: 1),
                    ),
                    fillColor: const Color(0xffC6C6C6),
                    hintText: 'Email ID',
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
            const SizedBox(
              height: 15,
            ),
            Container(
              color: const Color(0xffD9D9D9).withOpacity(0.1),
              height: 10.00.hp,
              width: 95.00.wp,
              child: TextFormField(
                controller: profileController.mobile,
             
                enableInteractiveSelection: false,
                // validator: (value) {
                //   if (value!.isEmpty) {
                //     return 'Please Enter mobile Number';
                //   } else if (value.length != 10) {
                //     return "Please enter valid mobile number";
                //   } else {
                //     return null;
                //   }
                // },
              //  maxLength: 10,
               //keyboardType: TextInputType.number,
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
                    hintText: 'Mobile Number',
                    label: Text('Mobile'),
                    labelStyle:GoogleFonts.jost(
                        textStyle: TextStyle(
                            fontSize: 10.00.sp,
                            color: formhintcolor,
                            fontWeight: FontWeight.w500)) ,
                     
                    prefixIcon: Icon(Icons.phone,color: appcolor,),
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
            
            
           
           SizedBox(
                      width: 100.00.wp,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20.00,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SmallActionButton(
                                  press: () {
                                    Navigator.of(context).pop();
                                  },
                                  elevationvalue: 0,
                                  text: 'CANCEL',
                                  bordercolor: Colors.white,
                                  bgcolor: appcolor,
                                  style: GoogleFonts.jost(
                                      textStyle: TextStyle(
                                          fontSize: 11.00.sp,
                                          letterSpacing: 1.5,
                                          color: screenbackground,
                                          fontWeight: FontWeight.w500)),
                                ),
                                SmallActionButton(
                                  press: () async {
                                    print('clickkk');
                                    
                                   await profileController.geteditprofileController(context:context).then((value) {
                                        
                                       
                                   });
                                   
                                    Get.back();
                                
                                  },
                                  elevationvalue: 0,
                                  text: 'SAVE',
                                  bordercolor: logocolor,
                                  bgcolor: logocolor,
                                  style: GoogleFonts.jost(
                                      textStyle: TextStyle(
                                          fontSize: 11.00.sp,
                                          letterSpacing: 1.5,
                                          color: screenbackground,
                                          fontWeight: FontWeight.w500)),
                                )
                              ]),
                     
          
        ],
           ))]);
  }});
  }
}
