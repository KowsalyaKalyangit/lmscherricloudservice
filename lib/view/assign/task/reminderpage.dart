import 'package:flutter/material.dart';
import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/controller/reminder_controller.dart';
import 'package:leadingmanagementsystem/utils/textstyles.dart';
 import 'package:intl/intl.dart';

class ReminderScreen extends StatefulWidget {
  const ReminderScreen({super.key, this.id});
  final String? id;

  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  ReminderController reminderController = Get.put(ReminderController());
@override
  void initState() {
  reminderController.reminderController(leadid: widget.id.toString());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx((){
      if(reminderController.isreminderLoad.value){
return Center(child: CircularProgressIndicator(),);
      }
      else if(reminderController.getreminderdetails.isEmpty){
        return Center(child: Text('No Data Found'),);
      }
      else{
  return ListView.builder(
    itemCount: reminderController.getreminderdetails[0].data.length,
    itemBuilder: (context, index) {
       var item=reminderController.getreminderdetails[0].data[index];
    String date = DateFormat("yyyy-MM-dd hh:mm:ss").format(item.date);
      
    
   
          return Container(
            height: 14.0.hp,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                  
                  children: [
           item.profileimg.isNotEmpty?      Center(
             child: ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                            child: Image.network(
                              item.profileimg,
                              fit: BoxFit.cover,
                              height: 7.0.hp,
                              width: 14.0.wp,
                            ),
                          ),
           ):Center(
             child: ClipRRect(
              
                            borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                            child: Image.asset(
                             'assets/img/profile.png',
                              fit: BoxFit.cover,
                              height: 7.0.hp,
                              width: 14.0.wp,
                            ),
                          ),
           ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.remindby,
                            style: listtitlefont,
                            maxLines: 2,
                          ),
                          Text(
                            item.description,
                            style: GoogleFonts.jost(
    textStyle: TextStyle(
        fontSize: 9.00.sp, color: appcolor, fontWeight: FontWeight.w500)),
                            maxLines: 2,
                          ),
                           
                          InkWell(
                            onTap: () {
                              showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  titlePadding: EdgeInsets.symmetric(
                                      horizontal: 14, vertical: 10),
                                  contentPadding: EdgeInsets.all(0),
                                  title: Text(
                                    item.description,
                                    style: listtitlefont,
                                  ),
                                  // content: const Text(
                                  //     "You have raised a Alert Dialog Box"),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(ctx).pop();
                                      },
                                      child: Container(
                                        height: 30.0,
                                        width: 60.0,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            color: appcolor),
                                        child: Center(
                                          child: Text(
                                            "Cancel",
                                            style: listtitlecolor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: Text(
                              "Read more",
                              style:  GoogleFonts.jost(
    textStyle: TextStyle(
        fontSize: 9.00.sp, color: Colors.blue, fontWeight: FontWeight.w500,decoration: TextDecoration.underline)),
                            ),
                          ),
                          Text(date,style: formhintstyle,)
                        ]),
                        ),

                       
                  ],
                ),
              )
            ),
          );
        });
  }})
    );
  }
}
