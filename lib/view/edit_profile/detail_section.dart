import 'dart:developer';

import 'package:leadingmanagementsystem/controller/profile_controller.dart';
import 'package:leadingmanagementsystem/utils/textstyles.dart';

import '../../allpackages.dart';
import '../../utils/small_action_button.dart';
import '../menu/menu_screen.dart';

 

class DetailsSection extends StatefulWidget {
  const DetailsSection({
    Key? key,
  }) : super(key: key);

  @override
  State<DetailsSection> createState() => _DetailsSectionState();
}

class _DetailsSectionState extends State<DetailsSection> {
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
    return  Column(
        children: [
          SizedBox(
            height: 15.00.hp,
          ),
          
          Container(
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
           SizedBox(
            height: 2.00.hp,
          ),
          Container(
            color: const Color(0xffD9D9D9).withOpacity(0.1),
            height: 7.00.hp, width: 95.00.wp,
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
          const SizedBox(
            height: 15,
          ),
          
          const SizedBox(
            height: 15,
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
                                // Get.back();
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
                        const SizedBox(
                          height: 20.00,
                        ),
                      ],
                    ),
                  ),
          const SizedBox(
            height: 30,
          ),
        ],
      );
    
  }
}



