import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/utils/textstyles.dart';
import 'package:leadingmanagementsystem/view/assign/attachement_upload.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/attachment_details_controller.dart';
import '../../controller/delete_attachment_controller.dart';
import '../../controller/upload_controller.dart';

class AttachmentScreen extends StatefulWidget {
  const AttachmentScreen({super.key,this.id});
  final String ?id;

  @override
  State<AttachmentScreen> createState() => _AttachmentScreenState();
}

class _AttachmentScreenState extends State<AttachmentScreen> {
   FileUploadController categoryApprovalViewModel =
      Get.put(FileUploadController());
      AttchamentLeadsDetailsController attchamentLeadsDetailsController=AttchamentLeadsDetailsController();
       var fileName;
        
  deleteFunc(data){
    return  showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  //title: const Text("Alert Dialog Box"),
                  content: const Text("Do you want delete this item ?"),
                  actions: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                            height: 6.0.hp,
                            width: 20.0.wp,
                                            decoration: BoxDecoration(
                            color: appcolor,
                            borderRadius: BorderRadius.circular(5)),
                            child: Center(child: Text('Cancel',style: subtitleStylecolor,)),),
                    ),
                          InkWell(
                            onTap: (){
                              attchamentDeleteController.attachmentDeleteController(leadid: widget.id.toString(),attachementid: data.toString()).then((value){
                 Get.back();
            attchamentLeadsDetailsController.getAttchamentLeadsDetailsController(leadid: widget.id.toString());
                              });

                            },
                            child: Container(
                            height: 6.0.hp,
                            width: 20.0.wp,
                                            decoration: BoxDecoration(
                            color: appcolor,
                            borderRadius: BorderRadius.circular(5)),
                            child: Center(child: Text('Yes',style: subtitleStylecolor,)),),
                          )

                      ],
                    )                  ]
                ),
              );
  }
  showdialogfunc(){
        return showDialog(
                context: context,
                builder: (ctx) => StatefulBuilder(
                  builder: (context,setState) {
                    return AlertDialog(
                        insetPadding: EdgeInsets.symmetric(horizontal: 1),
                       
                      actions: <Widget>[
                        Obx(()=>
                            Column(
                                      children: [
                                       
                                        SizedBox(height: 5.0.hp,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                          Stack(
                            children: [
                               Container(
                                height: MediaQuery.of(context).size.height * 0.3,
                                width: MediaQuery.of(context).size.width * 0.80,
                                decoration:   BoxDecoration(
                                  borderRadius: BorderRadius.circular(05),
                                ),),
                              Positioned(
                                top: 2.5.hp,
                             
                                child: Container(
                                  height: 26.5.hp,
                                  width: MediaQuery.of(context).size.width * 0.80,
                                  decoration:   BoxDecoration(
                                    borderRadius: BorderRadius.circular(05),
                                    border: Border.all(color:Colors.grey.shade400)),
                                  child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: categoryApprovalViewModel
                                              .categoryImage.value.path.isEmpty
                                          ? Center(child: Text('Please select the file'))
                                          :Center(
                                            child: ListTile(
                                              contentPadding: EdgeInsets.only(left: 10.0.wp),
                                              leading: Image.asset('assets/images/folder.png',height: 4.0.hp,),
                                              title: Text(fileName.toString(),style: notificationsubtitle,),
                                            ),
                                          )
                                              
                                           ),
                                ),
                              ),
                               Positioned(
                                top: 0.0.hp,
                                 left: 36.0.wp,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      categoryApprovalViewModel.categoryImage(File(''));
                                      Get.back();
                                    });
                                  },
                                  child: CircleAvatar(
                                    child: Icon(Icons.cancel,color: logocolor,),
                                    backgroundColor: appcolor,),
                                )),
                            ],
                          ),
                                          ],
                                        ),
                             
                                      
                                        InkWell(
                                          onTap: () async {
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles(
                            type: FileType.any,
                          );
                          File file = File(result!.files.single.path!);
                           categoryApprovalViewModel.categoryImage(file);
                             fileName = file.path.split('/').last;
                                          
                                           
                                          },
                                          child: Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 25.0, top: 10),
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/upload.png',
                                  height: 20,
                                  width: 20,
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  'Pick',
                                  style: GoogleFonts.openSans(
                                      textStyle: TextStyle(
                                          fontSize: MediaQuery.of(context).size.height *
                                              0.013,
                                          color: const Color(0xFF7C7B7B),
                                          fontWeight: FontWeight.w600)),
                                )
                              ],
                            ),
                          ),
                                          ),
                                        ),
                             
                                        InkWell(
                                          onTap: () {
                          if(categoryApprovalViewModel
                                              .categoryImage.value.path.isEmpty){
                            Fluttertoast.showToast(msg: 'pls select the file');
                             
                          }
                           categoryApprovalViewModel.createCategory(id:widget.id.toString()).then((value){
                              
            attchamentLeadsDetailsController.getAttchamentLeadsDetailsController(leadid: widget.id.toString());
              
                  
                              
                            
                            
                           });
                            
                                          },
                                          child: Container(
                          height: 6.0.hp,
                          width: 20.0.wp,
                                          decoration: BoxDecoration(
                          color: appcolor,
                          borderRadius: BorderRadius.circular(5)),
                          child: Center(child: Text('Upload',style: subtitleStylecolor,)),
                                          ),
                                        )
                                      ],
                                    ),
                        )
                      ],
                    );
                  }
                ),
              );
      }

      @override
  void initState() {
  setState(() {
     attchamentLeadsDetailsController.getAttchamentLeadsDetailsController(leadid: widget.id.toString());
  });
   super.initState();
  }
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  AttchamentDeleteController attchamentDeleteController=Get.put(AttchamentDeleteController());
  Future<Null> refreshList() async {
    refreshKey.currentState?.show(atTop: false);
    await Future.delayed(Duration(seconds: 2));

    setState(() {
     attchamentLeadsDetailsController.getAttchamentLeadsDetailsController(leadid: widget.id.toString());
    });

    return null;
  }

  
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () =>
            refreshList(),
             
           
      child: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: (){
           showdialogfunc();
         //Get.to(ImageUpload(id: widget.id.toString(),));
       
        },child: Image.asset('assets/images/upload.png'),),
    
        body: RefreshIndicator(
           onRefresh: () {
            return attchamentLeadsDetailsController.getAttchamentLeadsDetailsController(leadid: widget.id.toString());
             
           },
          child: Obx((){
            if(attchamentLeadsDetailsController.isLeadsDetailsLoad.value)
        {
          return Center(child: CircularProgressIndicator(),);
        }    
        else if(attchamentLeadsDetailsController.getattachmentleadsdetails[0].data.isEmpty){
          return Center(child: Text('No Data Found'));
        
        }
        else{
           return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: attchamentLeadsDetailsController.getattachmentleadsdetails[0].data.length,
                itemBuilder: (context,index){
                  var data= attchamentLeadsDetailsController.getattachmentleadsdetails[0].data[index];
                return Card(
                  child: ListTile(
                    leading: Image.asset('assets/images/folder.png',height: 4.0.hp,),
                    title: Text(data.fileName.toString(),style: notificationsubtitle,),
                    subtitle:InkWell(
                      onTap: () async{
                        var apiurl=data.download.toString();
                        Uri attachment = Uri.parse(apiurl);
                      if (await launchUrl(attachment)) {
                          //email app opened
                      }else{
                          //
                      }
                      },
                      child: Text('click to download',style: GoogleFonts.jost(
                          textStyle: TextStyle(
                              fontSize: 9.00.sp,
                              color:Colors.blue,
                              decoration: TextDecoration.underline,
                              
                              fontWeight: FontWeight.w500)),),
                    ) ,
                    trailing: InkWell(
                      onTap: (){
                    
                        setState(() {
            
          deleteFunc(data.id.toString());
         
                          

                          //deleteaddon(id: widget.id.toString(),index: index);
                        });
                      },
                      child: Icon(Icons.cancel_outlined,color: logocolor,)),
                  ),
                );
         }) );}}),
        )),
    );
} 
      
    
  }
 