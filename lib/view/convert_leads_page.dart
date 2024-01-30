 import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/controller/conveted_leads_controller.dart';

import '../utils/textstyles.dart';

class ConvertedLeadsScreen extends StatefulWidget {
  const ConvertedLeadsScreen({super.key});

  @override
  State<ConvertedLeadsScreen> createState() => _ConvertedLeadsScreenState();
}

class _ConvertedLeadsScreenState extends State<ConvertedLeadsScreen> {
  ConvertedLeadsController convertedLeadsController=Get.put(ConvertedLeadsController());
  @override
  void initState() {
   convertedLeadsController.convertedLeadsController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: appcolor,title: Text('Converted Leads',style: toptitleStyle,),),
        body: Obx((){
if(convertedLeadsController.isleadLoad.value){
  return Center(child: CircularProgressIndicator(),);
}
else if(convertedLeadsController.getnotification.isEmpty){
  return Center(child: Text('No Data Found'),);
}
else{
          return Padding(
            padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 8),
            child: ListView.builder(
              itemCount:convertedLeadsController.getnotification[0].data.length,
              itemBuilder: (context,index){
              return Stack(
                children: [
                  Container(
                    height: 18.0.hp,
                    width: 100.0.wp,
                     
                    child: Card(
                      color: appcolor,
                      shape: RoundedRectangleBorder(
                        
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Row(children: [
                        Padding(
                          padding: EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 20),
                          child: Container(
                           
                            height: 17.0.hp,width: 30.0.wp,decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),color:logocolor
                            ),
                            child: Center(child: Icon(Icons.person,size: 70,color: screenbackground,),),
                            ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                           Row(
                            children: [
                              Text('Name:',style: listtitlecolor,),
                               Text(convertedLeadsController.getnotification[0].data[index].name.toString(),style: listtitlecolor,),
                            ],
                           ),
                            Row(
                            children: [
                              Text('email:',style: listtitlecolor,),
                               Text(convertedLeadsController.getnotification[0].data[index].email.toString(),style: listtitlecolor,),
                            ],
                           ),Row(
                            children: [
                              Text('Phone:',style: listtitlecolor,),
                               Text(convertedLeadsController.getnotification[0].data[index].phonenumber.toString(),style: listtitlecolor,),
                            ],
                           ),Row(
                            children: [
                              Text('Company:',style: listtitlecolor,),
                               Text(convertedLeadsController.getnotification[0].data[index].company.toString(),style: listtitlecolor,),
                            ],
                           ),
                          ],
                        )
                      ],),
                    )
                    
                    ),
                    // Positioned(
                    //   right: 10,
                    //   top: 10,
                    //   child: Container(
                    //     height: 4.0.hp,
                    //     width: 25.0.wp,
                    //     decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color:  Colors.green[600] ),
                    //     child: Center(
                    //       child:  Text(dashboardCategoryController.getdashboardcategorydetails[0].data[index].toString(),style: listtitlecolor,),
                    //     ),
                    //   ),
                    // )
                ],
              );
            }),
          );
  }}),
    );
  }
}