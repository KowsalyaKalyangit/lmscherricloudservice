import 'package:flutter/material.dart';
import 'package:leadingmanagementsystem/utils/utils.dart';

import '../../utils/textstyles.dart';

class LeadsDashboardPage extends StatefulWidget {
  const LeadsDashboardPage({super.key});

  @override
  State<LeadsDashboardPage> createState() => _LeadsDashboardPageState();
}

class _LeadsDashboardPageState extends State<LeadsDashboardPage> {
  var statusupdate=['Converted','Pending','Renewable'];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:15,right: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 1.0.hp,),
Text('Leads List',style: listtitle,),
SizedBox(height: 1.0.hp,),
Container(height: 5.0.hp,width: 100.0.wp,decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: appcolor),child: Padding(
  padding: const EdgeInsets.only(left:15,right: 10),
  child:   Row(
    
    children: [
      Container(
        width: 35.0.wp,
        child: Text('SNo',style: subtitleStylecolor,)),
      Container(
        
        width: 30.0.wp,
        child: Text('Leads',style: subtitleStylecolor,)),
         Container(
          width: 20.0.wp,
          child: Text('Status',style: subtitleStylecolor,)),
  
    ],
  ),
),),
 SizedBox(height: 1.0.hp,),
         Container(
            height: 20.0.hp,
            width: 100.0.wp,
            child: Card(
               shape: RoundedRectangleBorder(
                    
                    borderRadius: BorderRadius.circular(5.0),
                    ),
              child: ListView.builder(
                itemCount: 5,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context,index){
                  index=index+1;
                  
                return Container(
                  height: 4.0.hp,
                  width: 100.0.wp,
                  child: Padding(
  padding: const EdgeInsets.only(left:25,right: 0),
  child:   Row(
     
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        width: 25.0.wp,
        child: Text(index.toString(),style: listview,)),
      Container(
        width: 35.0.wp,
        child: Text('Leads_Name',style: listview,)),
         Container(
          width: 20.0.wp,
          child: Text(index%2==0?'Converted':"Pending",style: listview,)),
  
    ],
  ),
),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}