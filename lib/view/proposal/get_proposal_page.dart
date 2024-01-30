import 'package:flutter/material.dart';
import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/controller/add_proposal_controller/get_proposal_related_controller.dart';
import 'package:leadingmanagementsystem/utils/textstyles.dart';
import 'package:leadingmanagementsystem/view/assign/proposal_page.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/add_proposal_controller/proposal_get_controller.dart';
import 'package:intl/intl.dart';

import '../proposal_edit/proposal_edit_page.dart';

class ProposalGetPage extends StatefulWidget {
  const ProposalGetPage({super.key,this.id});
  final String ?id;

  @override
  State<ProposalGetPage> createState() => _ProposalGetPageState();
}

class _ProposalGetPageState extends State<ProposalGetPage> {
  ProposalGetController proposalGetController=Get.put(ProposalGetController());
 
  var proposalindex=0;
  @override
  void initState() {
     proposalGetController.getproposalController(leadid: widget.id.toString());
      
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       floatingActionButton: FloatingActionButton(
        backgroundColor: appcolor,
        child: Icon(Icons.add,color: screenbackground,),
        onPressed: () {
        Get.to( ProposalPage(id:widget.id.toString()),);
      },),
      body:  Obx((){
        if(proposalGetController.isproposalgetLoad.value){
          return Center(child: CircularProgressIndicator(),);
        }
        else if(proposalGetController.getproposallist[0].data.isEmpty){
          return Center(child: Text('No data Found'),);
        }
        else{
     return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: proposalGetController.getproposallist[0].data.length,
            itemBuilder: (context,index){
              var item=proposalGetController.getproposallist[0].data[index];
              // String date = DateFormat("yyyy-MM-dd").format(item.date.toString());
              //   String opentill = DateFormat("yyyy-MM-dd").format(item.opentill);
            return InkWell(
              onTap: (){
                setState(() {
                  proposalindex=index;
                });
              },
              child: Column(
                children: [
                  Container(
                    height: 7.0.hp,
                    width: 100.0.wp,
                    decoration: BoxDecoration(
                      
                    ),
                    child: Card(
                      color: proposalindex==index?Color.fromARGB(255, 50, 53, 69):screenbackground,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        
                        children: [
                          SizedBox(width: 2.0.wp,),
                          Container(
                            width: 70.0.wp,
                            child: Text(item.number.toString(),style:
                            proposalindex==index?listtitlecolor:
                             listtitlefont,)),
                             
                    Row(
                      children: [
                        Container(
                           width: 10.0.wp,
                          child: Text(item.status.toString(),style: formhintstyle,)),
                          SizedBox(width: 2.0.wp,),
                        Icon(Icons.arrow_drop_down,color: proposalindex==index?screenbackground:toptitlecolor,)
                      ],
                    ),
                  
                          
                        ],
                      ),
                    )),
                    proposalindex==index?Container(
                      height: 23.0.hp,
                      width: 92.0.wp,
                      decoration: BoxDecoration(
                        border: Border.all(color: formhintcolor),
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                           SizedBox(height: 2.0.wp,),
                          Row(
                            children: [
                              SizedBox(width: 2.0.wp,),
                              Text('Subject: ',style: listtitlefont,),
                               SizedBox(width: 2.0.wp,),
                               Text(item.subject.toString(),style: listtitlefont,)
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(width: 3.0.wp,),
                              Text('Opentill ',style: listtitlefont,),
                               SizedBox(width: 32.0.wp,),
                               Text('Date',style: listtitlefont,)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 4.0.hp,
                                width: 40.0.wp,
                                decoration: BoxDecoration(
                                  color: appcolor.withOpacity(0.1),
                                  border: Border.all(color: formhintcolor),
                                  borderRadius: BorderRadius.circular(5)
                                ),
                                child: Center(child: Text(item.opentill)),
                              ),
                             Container(
                                height: 4.0.hp,
                                width: 40.0.wp,
                                decoration: BoxDecoration(
                                    color: appcolor.withOpacity(0.1),
                                  border: Border.all(color: formhintcolor),
                                  borderRadius: BorderRadius.circular(5)
                                ),
                                child: Center(child: Text(item.date)),
                              ),
                            ],
                          ),
                           Row(
                            children: [
                              SizedBox(width: 2.0.wp,),
                              Text('Date created: ',style: listtitlefont,),
                               SizedBox(width: 2.0.wp,),
                               Text(item.datecreated.toString(),style: formhintstyle,)
                            ],
                          ),
                          
                           Row(
                            
                            children: [
                              SizedBox(width: 2.0.wp,),
                              Container(
                                height: 4.0.hp,
                                width: 42.0.wp,
                                child: Text('Total: ',style: listtitlefont,)),
                               SizedBox(width: 2.0.wp,),
                               Container(
                                // height: 4.0.hp,
                                width: 42.0.wp,
                              
                                child: Center(child: Text(item.total.toString(),style: listtitlefont,)))
                            ],
                          ),
                            Row(
                            children: [
                              SizedBox(width: 2.0.wp,),
                              InkWell(
                                onTap: () async{
                                  Uri mail = Uri.parse(item.viewlink);
                      if (await launchUrl(mail)) {
                          //email app opened
                      }else{
                          //
                      }
                                },
                                    
                     
                           
                                    
                                child: Container(
                                  height: 4.0.hp,
                                  width: 15.0.wp,
                                    decoration: BoxDecoration(color:appcolor,borderRadius: BorderRadius.circular(5) ),
                                
                                  child: Center(child: Text('View',style: listtitlecolor))),
                              ),
                               SizedBox(width: 2.0.wp,),
             item.edit=='1'?                InkWell(
                                onTap: () {
                                  //Get.to(ProposalEditPage(id:item.proposalid.toString()));
                                },
                                child: Container(
                                  height: 4.0.hp,
                                  width: 15.0.wp,
                                    decoration: BoxDecoration(color:appcolor,borderRadius: BorderRadius.circular(5) ),
                                
                                  child: Center(child: Text('Edit',style: listtitlecolor))),
                              ):Container()
                            ],
                          ),
                            SizedBox(height: 2.0.wp,),
                        ],
                      ),
                      ):Container(),
                      
                ],
              ),
            );
          }),
      );
   } })
    );
  }
}