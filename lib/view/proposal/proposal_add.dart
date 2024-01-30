 

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:leadingmanagementsystem/controller/proposal/proposal_lead_type_controller.dart';
import 'package:leadingmanagementsystem/utils/textstyles.dart';
import 'package:leadingmanagementsystem/utils/utils.dart';

import '../../utils/signup_button.dart';
 

// import '../../allpackages.dart';

class AddProposalPage extends StatefulWidget {
  const AddProposalPage({super.key});

  @override
  State<AddProposalPage> createState() => _AddProposalPageState();
}

class _AddProposalPageState extends State<AddProposalPage> {
  ProposalLeadTypeController proposalLeadTypeController=Get.put(ProposalLeadTypeController());
  var typeindex;
  var countryname;
  var statusname;
    var sourcename;
    var status=['Inprogress','Pending','Completed'];
   var type=['Pet','Pet+','Hydraulic'];
    var specificationname=['MS MTD','MS ACO','SS ACO'];
   var floors=['G+2','G+3+','G+4','G+5'];
  @override
  void initState() {
    //proposalLeadTypeController.proposalLeadTypeController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
         Get.back();
        },icon: Icon(Icons.arrow_back),),
        backgroundColor: appcolor,title: Text('Add Proposal',style: toptitleStyle,),
      ),
      body: 
     
Padding(
        padding: const EdgeInsets.only(left:25.0,right: 25),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               
                  
              Text('To*',style: listtitle,),
                SizedBox(
                  height: 1.0.hp,
                ),
                Container(
                  color: const Color(0xffD9D9D9).withOpacity(0.1),
                  height: 7.00.hp, width: 100.00.wp,
                  // padding: const EdgeInsets.only(
                  //   left: 20,
                  //   right: 20,
                  // ),
                  child: TextFormField(
                    //controller:addAssignDetailsController.address,
                   
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
                        hintText: '',
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
                 
                SizedBox(height: 1.0.wp,),
                
              Text('Address',style: listtitle,),
                SizedBox(
                  height: 1.0.hp,
                ),
                Container(
                  color: const Color(0xffD9D9D9).withOpacity(0.1),
                  height: 9.00.hp, width: 100.00.wp,
                  // padding: const EdgeInsets.only(
                  //   left: 20,
                  //   right: 20,
                  // ),
                  child: TextFormField(
                     maxLines: 6,
                   //  controller:addAssignDetailsController.desc,
                   
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
                        hintText: ' ',
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
                  height: 1.0.hp,
                ),
                
               SizedBox(
                  height: 1.0.hp,
                ),
              Text('City',style: listtitle,),
                SizedBox(
                  height: 1.0.hp,
                ),
                Container(
                  color: const Color(0xffD9D9D9).withOpacity(0.1),
                  height: 7.00.hp, width: 100.00.wp,
                  // padding: const EdgeInsets.only(
                  //   left: 20,
                  //   right: 20,
                  // ),
                  child: TextFormField(
                   // controller:addAssignDetailsController.city,
                   
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
                        hintText: ' ',
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
                  height: 1.0.hp,
                ),
              Text('State',style: listtitle,),
                SizedBox(
                  height: 1.0.hp,
                ),
                Container(
                  color: const Color(0xffD9D9D9).withOpacity(0.1),
                  height: 7.00.hp, width: 100.00.wp,
                  // padding: const EdgeInsets.only(
                  //   left: 20,
                  //   right: 20,
                  // ),
                  child: TextFormField(
                    //controller:addAssignDetailsController. state,
                   
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
                        hintText: '',
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
                  height: 1.0.hp,
                ),
              Row(
                children: [
                    Text('Country',style: listtitle,),  
                    SizedBox(width: 34.0.wp,),
                    
                    Text('Zip Code',style: listtitle,),
                ],
              ),
                SizedBox(
                  height: 1.0.hp,
                ),
              
                Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                    Container(
                        height: 6.00.hp,
                        width: 43.00.wp,
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(
                            color: const Color(0xFFECE9E9),
                            width: MediaQuery.of(context).size.height * 0.001,
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value:countryname,
                            style: GoogleFonts.jost(
                                textStyle: TextStyle(
                                    fontSize: 10.00.sp,
                                    color: forminputcolor,
                                    fontWeight: FontWeight.w500)),
                            hint: Text('Country',
                                style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        fontSize: 10.00.sp,
                                        color: formhintcolor,
                                        fontWeight: FontWeight.w500))),
                            onChanged: ( newValue) {
                               
                              
                                
                           setState(() {
                               
                               if(newValue!=null){
                                countryname=newValue.toString();
                                print('newwvalue');
                                print(newValue.toString());
                               }
                               
                           });
                               
                               
                              
                            },
                            icon: Icon(
                             Icons.arrow_drop_down,
                             size: 20,
                  
                              color: const Color(0xFF737070),
                              
                            ),
                            items:status
                                    .map<DropdownMenuItem<String>>((value) {
                                    return DropdownMenuItem<String>(
                                      value: value.toString(),
                                      child: Container(
                                          margin: const EdgeInsets.only(
                                              left: 0, right: 4),
                                          child: Text(value.toString(),
                                              style: GoogleFonts.jost(
                                                  textStyle: TextStyle(
                                                      fontSize: 10.00.sp,
                                                      color: forminputcolor,
                                                      fontWeight: FontWeight.w500)))),
                                    );
                                  }).toList(),
                          ),
                        )),
                        SizedBox(
                  width: 2.0.hp,
                ),
                Container(
                  color: const Color(0xffD9D9D9).withOpacity(0.1),
                  height: 6.00.hp, width: 40.00.wp,
                  // padding: const EdgeInsets.only(
                  //   left: 20,
                  //   right: 20,
                  // ),
                  child: TextFormField(
                    //controller:addAssignDetailsController. state,
                   
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
                        hintText: '',
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
      
       SizedBox(
                  height: 1.0.hp,
                ),
 Row(
                children: [
                    Text('Status',style: listtitle,),  
                    SizedBox(width: 34.0.wp,),
                    
                    Text('Assigned',style: listtitle,),
                ],
              ),
                Row(
                  children: [
                      Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                    Container(
                        height: 7.00.hp,
                        width: 40.00.wp,
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(
                            color: const Color(0xFFECE9E9),
                            width: MediaQuery.of(context).size.height * 0.001,
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value:statusname,
                            style: GoogleFonts.jost(
                                textStyle: TextStyle(
                                    fontSize: 10.00.sp,
                                    color: forminputcolor,
                                    fontWeight: FontWeight.w500)),
                            hint: Text('status',
                                style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        fontSize: 10.00.sp,
                                        color: formhintcolor,
                                        fontWeight: FontWeight.w500))),
                            onChanged: ( newValue) {
                               
                              
                                
                           setState(() {
                               
                               if(newValue!=null){
                                statusname=newValue.toString();
                                print('newwvalue');
                                print(newValue.toString());
                               }
                               
                           });
                               
                               
                              
                            },
                            icon: Icon(
                             Icons.arrow_drop_down,
                             size: 20,
                  
                              color: const Color(0xFF737070),
                              
                            ),
                            items:  type
                                    .map<DropdownMenuItem<String>>((value) {
                                    return DropdownMenuItem<String>(
                                      value: value .toString(),
                                      child: Container(
                                          margin: const EdgeInsets.only(
                                              left: 0, right: 4),
                                          child: Text(value .toString(),
                                              style: GoogleFonts.jost(
                                                  textStyle: TextStyle(
                                                      fontSize: 10.00.sp,
                                                      color: forminputcolor,
                                                      fontWeight: FontWeight.w500)))),
                                    );
                                  }).toList(),
                          ),
                        )),
                              ],
                             
                  ), 
                  
                    SizedBox(
                  width: 2.0.hp,
                ),
                   Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                    Container(
                        height: 7.00.hp,
                        width: 40.00.wp,
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(
                            color: const Color(0xFFECE9E9),
                            width: MediaQuery.of(context).size.height * 0.001,
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value:statusname,
                            style: GoogleFonts.jost(
                                textStyle: TextStyle(
                                    fontSize: 10.00.sp,
                                    color: forminputcolor,
                                    fontWeight: FontWeight.w500)),
                            hint: Text('status',
                                style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        fontSize: 10.00.sp,
                                        color: formhintcolor,
                                        fontWeight: FontWeight.w500))),
                            onChanged: ( newValue) {
                               
                              
                                
                           setState(() {
                               
                               if(newValue!=null){
                                statusname=newValue.toString();
                                print('newwvalue');
                                print(newValue.toString());
                               }
                               
                           });
                               
                               
                              
                            },
                            icon: Icon(
                             Icons.arrow_drop_down,
                             size: 20,
                  
                              color: const Color(0xFF737070),
                              
                            ),
                            items:  type
                                    .map<DropdownMenuItem<String>>((value) {
                                    return DropdownMenuItem<String>(
                                      value: value .toString(),
                                      child: Container(
                                          margin: const EdgeInsets.only(
                                              left: 0, right: 4),
                                          child: Text(value .toString(),
                                              style: GoogleFonts.jost(
                                                  textStyle: TextStyle(
                                                      fontSize: 10.00.sp,
                                                      color: forminputcolor,
                                                      fontWeight: FontWeight.w500)))),
                                    );
                                  }).toList(),
                          ),
                        )),
                              ],
                             
                  ),
                  ],
                ),
              
                SizedBox(
                  height: 1.0.hp,
                ),
                
                
                  Text('Email*',style: listtitle,),
                SizedBox(
                  height: 1.0.hp,
                ),
                    Container(
                  color: const Color(0xffD9D9D9).withOpacity(0.1),
                  height: 6.00.hp, width: 85.00.wp,
                  // padding: const EdgeInsets.only(
                  //   left: 20,
                  //   right: 20,
                  // ),
                  child: TextFormField(
                    //controller:addAssignDetailsController. state,
                   
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
                        hintText: '',
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
                  height: 1.0.hp,
                ),
                
                
                  Text('Phone',style: listtitle,),
                SizedBox(
                  height: 1.0.hp,
                ),
                    Container(
                  color: const Color(0xffD9D9D9).withOpacity(0.1),
                  height: 6.00.hp, width: 85.00.wp,
                  // padding: const EdgeInsets.only(
                  //   left: 20,
                  //   right: 20,
                  // ),
                  child: TextFormField(
                    //controller:addAssignDetailsController. state,
                   
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
                        hintText: '',
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

              
              
                   
                SizedBox(height: 2.0.hp,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ButtonIconButton(
                    press: () async{
                   
                       
                     
                     
                      
                    },
                    bgcolor: appcolor,
                    bordercolor: appcolor,
                    text: 'NEXT',
                  ),
                ),
                
    SizedBox(height: 5.0.hp,)
            ],
          ),
        ),
      ));
  }}
    