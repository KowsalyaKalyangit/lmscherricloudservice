import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/utils/textstyles.dart';
import 'package:leadingmanagementsystem/view/assign/attachement_screen.dart';

import '../../controller/attachment_details_controller.dart';
import '../../controller/upload_controller.dart';
 

class ImageUpload extends StatefulWidget {
  const ImageUpload({Key? key,this.id}) : super(key: key);
  final String ?id;

  @override
  State<ImageUpload> createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  FileUploadController categoryApprovalViewModel =
      Get.put(FileUploadController());
         
      AttchamentLeadsDetailsController attchamentLeadsDetailsController=AttchamentLeadsDetailsController();
       var fileName;

      
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(backgroundColor: appcolor,
      title: Text('File Upload',style: toptitleStyle,),),
       body: Obx(()=>
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
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
     );
  }
}


 