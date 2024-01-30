import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/controller/add_proposal_controller/proposal_load_amt_controller.dart';
import 'package:leadingmanagementsystem/controller/add_proposal_controller/proposal_load_controller.dart';
import 'package:leadingmanagementsystem/controller/add_proposal_controller/proposal_open_controller.dart';
import 'package:leadingmanagementsystem/controller/add_proposal_controller/proposal_speed_amount_controller.dart';
import 'package:leadingmanagementsystem/controller/add_proposal_controller/proposal_stop_controller.dart';
import 'package:leadingmanagementsystem/model/Add_proposal/proposal_speed_amount_response.dart';
import 'package:leadingmanagementsystem/utils/textstyles.dart';

import '../../controller/add_proposal_controller/add_item_proposal_controller.dart';
import '../../controller/add_proposal_controller/get_addlistitem_controller.dart';
import '../../controller/add_proposal_controller/proposal_control_controller.dart';
import '../../controller/add_proposal_controller/proposal_create_controller.dart';
import '../../controller/add_proposal_controller/proposal_edit_controller.dart';
import '../../controller/add_proposal_controller/proposal_machine_controller.dart';
import '../../controller/add_proposal_controller/proposal_operationamt_controller.dart';
import '../../controller/add_proposal_controller/proposal_operation_controller.dart';
import '../../controller/add_proposal_controller/proposal_speed_controller.dart';
import '../../controller/add_proposal_controller/proposal_travel_amt_controller.dart';
import '../../controller/add_proposal_controller/proposal_travel_controller.dart';
import '../../utils/common_variable.dart';
 

class ProposalEditNextPage extends StatefulWidget {
  const ProposalEditNextPage({super.key,this.id,this.subjectname,this.opentillname,this.datename,this.proposaltoname,
  this.countryname,this.zipname,this.statename,this.emailname,this.phonename,this.status,this.cityname,this.addressname,this.currencyname});
  final String? id;
  final String? subjectname;
  final String? opentillname;
  final String? datename;
  final String? proposaltoname;
  final String? countryname;
  final String? zipname;
  final String? statename;
  final String? cityname;
  final String? addressname;
  final String? emailname;
  final String? phonename;
  final String? status;
  final String? currencyname;

  @override
  State<ProposalEditNextPage> createState() => _ProposalEditNextPageState();
}

class _ProposalEditNextPageState extends State<ProposalEditNextPage> {
   ProposalEditController proposalEditController=Get.put(ProposalEditController());
  AddItemProposalController addItemProposalController =
      Get.put(AddItemProposalController());
  GetAddItemListController getAddItemListController =
      Get.put(GetAddItemListController());
  ProposalLoadController proposalLoadController =
      Get.put(ProposalLoadController());
  ProposalSpeedController proposalSpeedController =
      Get.put(ProposalSpeedController());
  ProposalTravelController proposalTravelController =
      Get.put(ProposalTravelController());
  ProposalStopController proposalStopController =
      Get.put(ProposalStopController());
  ProposalOpenController proposalOpenController =
      Get.put(ProposalOpenController());
  ProposalControlController proposalControlController =
      Get.put(ProposalControlController());
  ProposalOperationController proposalOperationController =
      Get.put(ProposalOperationController());
  ProposalMachineController proposalMachineController =
      Get.put(ProposalMachineController());
  ProposalSpeedAmtController proposalSpeedAmtController =
      Get.put(ProposalSpeedAmtController());
  ProposalLoadAmtController proposalLoadAmtController =
      Get.put(ProposalLoadAmtController());
      ProposalOperationAmtController proposalOperationAmtController=Get.put(ProposalOperationAmtController());
  ProposalTravelAmtController proposalTravelAmtController =
      Get.put(ProposalTravelAmtController());

  
  ProposalCreateController proposalCreateController =
      Get.put(ProposalCreateController());
  var discount_type = ['%', 'Fixed Amount'];
  var discount_type_name;
  var additem;
  var selectedindex;
  var load;
  var travel;
  var travelindex;
  var proposalstop;
  var proposalopen;
  var proposalControl;
  var proposalOperation;
  var proposalMachine;
  var speedvalue;
  // var addcon=true;
  // var loadcon=true;
  // var speedcon=true;
  // var travelcon=true;

  @override
  void initState() {
    func();
    super.initState();
  }

  func() {
     proposalEditController.proposalEditController(proposalid:widget.id.toString());
      addItemProposalController.addItemProposalController().then((value) {
       addItemProposalController.getadditemproposal[0].data[0].id;
      });
    proposalLoadController.proposalrelatedController().then((value) {
      setState(() {
    load=     proposalLoadController.getproposalload[0].data[0].loadid;
      });
    });

    proposalSpeedController.proposalSpeedController().then((value) {
      setState(() {
        proposalSpeedController.getproposalSpeed[0].data[0].speedid.toString();
      });
    });

    proposalTravelController.proposalTravelController().then((value) {
      setState(() {
       proposalTravelController.getproposalTravel[0].data[0].travelid;
      });
    });

    proposalStopController.proposalStopController().then((value) {
      setState(() {
     proposalstop=    proposalStopController.getproposalStop[0].data[0].stopid;
      });
    });

    proposalOpenController.proposalOpenController().then((value) {
      setState(() {
     proposalopen= proposalOpenController.getproposalOpen[0].data[0].openingid;
      });
    });

    proposalControlController.proposalControlController().then((value) {
      setState(() {
    proposalControl=     proposalControlController.getproposalControl[0].data[0].controlid;
      });
    });

    proposalOperationController.proposalOperationController().then((value) {
      setState(() {
       proposalOperationController.getproposalOperation[0].data[0].operationid.toString();
      });
    });
    proposalMachineController.proposalMachineController().then((value) {
      setState(() {
      proposalMachineController.getproposalMachine[0].data[0].machineid;
      });
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
          height: 23.0.hp,
          child: Container(
            height: 40.0.hp,
            width: 80.0.wp,
            decoration: BoxDecoration(
                // color: Colors.deepOrange,
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(20.0))),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  alignment: Alignment.bottomRight,
                  height: 3.0.hp,
                  width: 50.0.wp,
                  decoration:
                      BoxDecoration(border: Border.all(color: formhintcolor)),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Sub Total: ',
                          style: GoogleFonts.jost(
                              textStyle: TextStyle(
                                  fontSize: 8.00.sp,
                                  color: toptitlecolor,
                                  fontWeight: FontWeight.w800)),
                        ),

                        //  proposalSpeedAmtController.getproposalspeedamt.isEmpty?Text('null'):  proposalSpeedAmtController.getproposalspeedamt[0].from=='speedamount'?Text( proposalSpeedAmtController.getproposalspeedamt[0].data[0].subtotal.toString()):
                        //   getAddItemListController.getadditemproposal.isEmpty?Text(''):Text(getAddItemListController.getadditemproposal[0].data[0].subtotal.toString())
                        //getAddItemListController.getadditemproposal.isEmpty?Text('click'):

                        Obx(() {
                          if (getAddItemListController.isadditemlistLoad.value &&
                              
                              proposalLoadAmtController
                                  .isproposaLoadamtLoad.value &&
                              proposalSpeedAmtController
                                  .isproposaspeedamtLoad.value &&
                                   
                              proposalTravelAmtController
                                  .isproposltravelamtLoad.value) {
                            return Text('0');
                          } else if (getAddItemListController.getadditemproposal.isEmpty &&
                               
                              proposalLoadAmtController
                                  .getproposalloadamt.isEmpty &&
                              proposalSpeedAmtController
                                  .getproposalspeedamt.isEmpty &&
                              proposalTravelAmtController
                                  .getproposaltravelamt.isEmpty) {
                            return Text('ccc');
                          } else {
                            return Text(
                                '${commonVariable.commonapidata.value.toString()}');
                          }
                        })
                      ],
                    ),
                  ),
                ),
                // Container(
                //     alignment: Alignment.bottomRight,
                //     height: 7.0.hp,
                //     width: 100.0.wp,
                //     // decoration: BoxDecoration(
                //     //   border: Border.all(color: formhintcolor)
                //     // ),
                //     child: Center(
                //         child: Row(
                //             //mainAxisAlignment: MainAxisAlignment.spaceAround,
                //             children: [
                //           Container(
                //             color: const Color(0xffD9D9D9).withOpacity(0.1),
                //             height: 6.00.hp, width: 30.00.wp,
                //             // padding: const EdgeInsets.only(
                //             //   left: 20,
                //             //   right: 20,
                //             // ),
                //             child: TextFormField(
                //               //  controller: getProposalRelatedController.oepntill,
                //               style: GoogleFonts.jost(
                //                   textStyle: TextStyle(
                //                       fontSize: 10.00.sp,
                //                       color: forminputcolor,
                //                       fontWeight: FontWeight.w500)),
                //               decoration: InputDecoration(
                //                   focusedBorder: OutlineInputBorder(
                //                     borderRadius: BorderRadius.circular(5.0),
                //                     borderSide: const BorderSide(
                //                         color: appcolor, width: 1),
                //                   ),
                //                   label: Text('Discount'),
                //                   labelStyle: formhintstyle,
                //                   enabledBorder: OutlineInputBorder(
                //                     borderRadius: BorderRadius.circular(5.0),
                //                     borderSide: BorderSide(
                //                         color: const Color(0xffC6C6C6)
                //                             .withOpacity(0.5),
                //                         width: 1),
                //                   ),
                //                   fillColor: const Color(0xffC6C6C6),
                //                   hintText: '',
                //                   contentPadding:
                //                       const EdgeInsets.only(left: 10),
                //                   hintStyle: GoogleFonts.jost(
                //                       textStyle: TextStyle(
                //                           fontSize: 10.00.sp,
                //                           color: formhintcolor,
                //                           fontWeight: FontWeight.w500)),
                //                   border: const OutlineInputBorder(
                //                     gapPadding: 4,
                //                   )),
                //             ),
                //           ),
                //           Row(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               Container(
                //                   height: 6.00.hp,
                //                   width: discount_type_name == '%'
                //                       ? 10.0.wp
                //                       : 30.00.wp,
                //                   decoration: BoxDecoration(
                //                     borderRadius: BorderRadius.circular(5.0),
                //                     border: Border.all(
                //                       color: formhintcolor,
                //                       width:
                //                           MediaQuery.of(context).size.height *
                //                               0.001,
                //                     ),
                //                   ),
                //                   child: DropdownButtonHideUnderline(
                //                     child: DropdownButton<String>(
                //                       isExpanded: true,
                //                       value: discount_type_name,
                //                       style: GoogleFonts.jost(
                //                           textStyle: TextStyle(
                //                               fontSize: 8.00.sp,
                //                               color: forminputcolor,
                //                               fontWeight: FontWeight.w500)),
                //                       hint: Text('',
                //                           style: GoogleFonts.jost(
                //                               textStyle: TextStyle(
                //                                   fontSize: 8.00.sp,
                //                                   color: formhintcolor,
                //                                   fontWeight:
                //                                       FontWeight.w500))),
                //                       onChanged: (newValue) {
                //                         setState(() {
                //                           if (newValue != null) {
                //                             setState(() {
                //                               discount_type_name =
                //                                   newValue.toString();
                //                               print('newwvalue');
                //                               print(newValue.toString());
                //                             });
                //                           }
                //                         });
                //                       },
                //                       icon: Icon(
                //                         Icons.arrow_drop_down,
                //                         size: 20,
                //                         color: const Color(0xFF737070),
                //                       ),
                //                       items: discount_type
                //                           .map<DropdownMenuItem<String>>(
                //                               (value) {
                //                         return DropdownMenuItem<String>(
                //                           value: value.toString(),
                //                           child: Container(
                //                               margin: const EdgeInsets.only(
                //                                   left: 0, right: 0),
                //                               child: Text(value.toString(),
                //                                   style: GoogleFonts.jost(
                //                                       textStyle: TextStyle(
                //                                           fontSize: 10.00.sp,
                //                                           color:
                //                                               forminputcolor,
                //                                           fontWeight:
                //                                               FontWeight
                //                                                   .w500)))),
                //                         );
                //                       }).toList(),
                //                     ),
                //                   )),
                //             ],
                //           ),
                //           Container(
                //             alignment: Alignment.centerRight,
                //             width: 30.0.wp,
                //             child: Text(
                //               '-1234456789 ',
                //               style: listtitlefont,
                //             ),
                //           ),
                //         ]))),
                Container(
                  alignment: Alignment.bottomRight,
                  height: 3.0.hp,
                  width: 50.0.wp,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'CGST(9.00%): ',
                          style: GoogleFonts.jost(
                              textStyle: TextStyle(
                                  fontSize: 8.00.sp,
                                  color: toptitlecolor,
                                  fontWeight: FontWeight.w800)),
                        ),
                        Text(
                          '₹8910.00',
                          style: GoogleFonts.jost(
                              textStyle: TextStyle(
                                  fontSize: 8.00.sp,
                                  color: toptitlecolor,
                                  fontWeight: FontWeight.w800)),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  height: 3.0.hp,
                  width: 50.0.wp,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'SGST(9.00%): ',
                          style: GoogleFonts.jost(
                              textStyle: TextStyle(
                                  fontSize: 8.00.sp,
                                  color: toptitlecolor,
                                  fontWeight: FontWeight.w800)),
                        ),
                        Text(
                          '₹8910.00',
                          style: GoogleFonts.jost(
                              textStyle: TextStyle(
                                  fontSize: 8.00.sp,
                                  color: toptitlecolor,
                                  fontWeight: FontWeight.w800)),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  height: 3.0.hp,
                  width: 50.0.wp,
                  decoration:
                      BoxDecoration(border: Border.all(color: formhintcolor)),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Total: ',
                          style: GoogleFonts.jost(
                              textStyle: TextStyle(
                                  fontSize: 8.00.sp,
                                  color: toptitlecolor,
                                  fontWeight: FontWeight.w800)),
                        ),
                        Obx(() {
                          if (getAddItemListController.isadditemlistLoad.value &&
                              proposalOperationAmtController.isproposaloperationamtLoad.value
                                   &&
                              proposalLoadAmtController
                                  .isproposaLoadamtLoad.value &&
                              proposalSpeedAmtController
                                  .isproposaspeedamtLoad.value &&
                              proposalTravelAmtController
                                  .isproposltravelamtLoad.value) {
                            return Text('0');
                          } else if (getAddItemListController.getadditemproposal.isEmpty &&
                              proposalOperationAmtController
                                  .getproposaloperationamt.isEmpty &&
                              proposalLoadAmtController
                                  .getproposalloadamt.isEmpty &&
                              proposalSpeedAmtController
                                  .getproposalspeedamt.isEmpty &&
                              proposalTravelAmtController
                                  .getproposaltravelamt.isEmpty) {
                            return Text('ccc');
                          } else {
                            return Text(
                              '${commonVariable.commontotal.value.toString()}',
                              style: GoogleFonts.jost(
                                  textStyle: TextStyle(
                                      fontSize: 8.00.sp,
                                      color: toptitlecolor,
                                      fontWeight: FontWeight.w800)),
                            );
                          }
                        })
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.0.hp,
                ),
                InkWell(
                  onTap: () {
                    proposalCreateController.proposalCreateController(
                        leadid: widget.id.toString(),
                        subject: widget.subjectname.toString(),
                        total:commonVariable.commontotal.value.toString(),
                        subtotal: commonVariable.commonapidata.value.toString(),
                        taxamount: '156600',
                        open_till: widget.opentillname.toString(),
                        date: widget.datename.toString(),
                        proposal_to: widget.proposaltoname.toString(),
                        country: widget.countryname.toString(),
                        zip: widget.zipname.toString(),
                        state: widget.statename.toString(),
                        city: widget.cityname.toString(),
                        address: widget.addressname.toString(),
                        email: widget.emailname.toString(),
                        phone: widget.phonename.toString(),
                        status: widget.statename.toString(),
                        currency: widget.currencyname.toString(),
                        liftpriceid: additem,
                        loadid: load,
                        speedid: speedvalue,
                        travelid: travel,
                        stopid: proposalstop,
                        openingid: proposalopen,
                        controlid: proposalControl,
                        operationid: proposalOperation,
                        machineid: proposalMachine,
                        hoistwaysize: getAddItemListController.hoistwaysize.text,
                        carsize: getAddItemListController.carsize.text,
                        delivery: getAddItemListController.delivery.text,
                        erection: getAddItemListController.erection.text,
                        power_supply: getAddItemListController.powersupply.text,);
                  },
                  child: Container(
                    height: 4.0.hp,
                    width: 30.0.wp,
                    decoration: BoxDecoration(
                        color: Colors.green[600],
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        'SAVE',
                        style: GoogleFonts.jost(
                            textStyle: TextStyle(
                                fontSize: 8.00.sp,
                                color: toptitlecolor,
                                fontWeight: FontWeight.w800)),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
      appBar: AppBar(
        backgroundColor: appcolor,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            color: screenbackground,
          ),
        ),
      ),
      body: Obx(() {
        if (
         
          addItemProposalController.isadditemLoad.value ||
            proposalLoadController.isproposaLoad.value ||
            proposalSpeedController.isproposalspeedLoad.value ||
            proposalTravelController.isproposaltravelLoad.value ||
            proposalControlController.isproposalControlLoad.value ||
            proposalStopController.isproposalStopLoad.value ||
            proposalOpenController.isproposalOpenLoad.value ||
            proposalOperationController.isproposalOperationLoad.value ||
            proposalMachineController.isproposalMachineLoad.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (
           
          addItemProposalController.getadditemproposal.isEmpty ||
            proposalLoadController.getproposalload.isEmpty ||
            proposalControlController.getproposalControl.isEmpty ||
            proposalSpeedController.getproposalSpeed.isEmpty ||
            proposalTravelController.getproposalTravel.isEmpty ||
            proposalOpenController.getproposalOpen.isEmpty ||
            proposalOperationController.getproposalOperation.isEmpty ||
            proposalMachineController.getproposalMachine.isEmpty) {
          return Center(
            child: Text('No data Found'),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 5.0, bottom: 5.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Add Item',
                    style: listtitlefont,
                  ),
                  SizedBox(
                    height: 1.0.hp,
                  ),
                  Row(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 7.00.hp,
                            width: 90.00.wp,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                color: const Color(0xFFECE9E9),
                                width:
                                    MediaQuery.of(context).size.height * 0.001,
                              ),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: additem,
                                style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        fontSize: 10.00.sp,
                                        color: forminputcolor,
                                        fontWeight: FontWeight.w500)),
                                hint: Text( '',
                                    style: GoogleFonts.jost(
                                        textStyle: TextStyle(
                                            fontSize: 10.00.sp,
                                            color: formhintcolor,
                                            fontWeight: FontWeight.w500))),
                                onChanged: (newValue) {
                                  setState(() {
                                    if (newValue != null) {
                                      setState(() {
                                        additem = newValue.toString();
                                        print('newwvalue');
                                        print(newValue.toString());
                                        print('clickkkk');

                                        getAddItemListController
                                            .getAddItemListController(
                                                liftid: newValue.toString());
                                        selectedindex = 0;

                                        // addcon=true;
                                      });
                                    }
                                  });
                                },
                                icon: Icon(
                                  selectedindex == 0
                                      ? Icons.arrow_drop_up_outlined
                                      : Icons.arrow_drop_down,
                                  size: 20,
                                  color: const Color(0xFF737070),
                                ),
                                items: addItemProposalController
                                        .getadditemproposal[0].data.isEmpty
                                    ? []
                                    : addItemProposalController
                                        .getadditemproposal[0].data
                                        .map<DropdownMenuItem<String>>((value) {
                                        return DropdownMenuItem<String>(
                                          value: value.id.toString(),
                                          child: Container(
                                              margin: const EdgeInsets.only(
                                                  left: 0, right: 4),
                                              child: Text(
                                                proposalEditController.type.isNotEmpty? 
                                          
                                         value.optionname.toString() :proposalEditController.type.value,
                                                  style: GoogleFonts.jost(
                                                      textStyle: TextStyle(
                                                          fontSize: 10.00.sp,
                                                          color: forminputcolor,
                                                          fontWeight: FontWeight
                                                              .w500)))),
                                        );
                                      }).toList(),
                              ),
                            )),
                      ],
                    ),
                  ]),
                  SizedBox(
                    height: 1.0.hp,
                  ),
                  getAddItemListController.isadditemlistLoad.value
                      ? Center(
                          child: Container(),
                        )
                      : getAddItemListController.getadditemproposal.isEmpty
                          ? Text('No data Found')
                          : selectedindex == 0
                              ? Container(
                                  height: 26.0.hp,
                                  width: 100.0.wp,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(color: formhintcolor)),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 1.0.hp,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            // color: const Color(0xffD9D9D9).withOpacity(0.1),
                                            height: 2.00.hp,
                                            width: 25.00.wp,
                                            child: Text(
                                              'Type*',
                                              style: socialbutton,
                                            ),
                                          ),
                                          Container(
                                            // color: const Color(0xffD9D9D9).withOpacity(0.1),
                                            height: 2.00.hp,
                                            width: 25.00.wp,
                                            child: Text(
                                              'Specification*',
                                              style: socialbutton,
                                            ),
                                          ),
                                          Container(
                                            // color: const Color(0xffD9D9D9).withOpacity(0.1),
                                            height: 2.00.hp,
                                            width: 25.00.wp,
                                            child: Text(
                                              'Passenger*',
                                              style: socialbutton,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 1.0.hp,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            // color: const Color(0xffD9D9D9).withOpacity(0.1),
                                            height: 4.00.hp,
                                            width: 25.00.wp,
                                            decoration: BoxDecoration(
                                                color: teal.withOpacity(0.1),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                border: Border.all(
                                                    color: const Color(
                                                        0xffD9D9D9))),
                                            child: Center(
                                                child: Text(
                                                    getAddItemListController
                                                        .getadditemproposal[0]
                                                        .data[0]
                                                        .typename
                                                        .toString())),
                                          ),
                                          Container(
                                            // color: const Color(0xffD9D9D9).withOpacity(0.1),
                                            height: 4.00.hp,
                                            width: 25.00.wp,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: teal.withOpacity(0.1),
                                                border: Border.all(
                                                    color: const Color(
                                                        0xffD9D9D9))),
                                            child: Center(
                                                child: Text(
                                                    getAddItemListController
                                                        .getadditemproposal[0]
                                                        .data[0]
                                                        .specificationname
                                                        .toString())),
                                          ),
                                          Container(
                                            // color: const Color(0xffD9D9D9).withOpacity(0.1),
                                            height: 4.00.hp,
                                            width: 25.00.wp,

                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: teal.withOpacity(0.1),
                                                border: Border.all(
                                                    color: const Color(
                                                        0xffD9D9D9))),
                                            child: Center(
                                                child: Text(
                                                    getAddItemListController
                                                        .getadditemproposal[0]
                                                        .data[0]
                                                        .passenger
                                                        .toString())),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 1.0.hp,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            // color: const Color(0xffD9D9D9).withOpacity(0.1),
                                            height: 2.00.hp,
                                            width: 48.00.wp,
                                            child: Text(
                                              ' Car Enclosure*',
                                              style: socialbutton,
                                            ),
                                          ),
                                          Container(
                                            // color: const Color(0xffD9D9D9).withOpacity(0.1),
                                            height: 2.00.hp,
                                            width: 25.00.wp,
                                            child: Text(
                                              'Hoistway Doors*',
                                              style: socialbutton,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 1.0.hp,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            // color: const Color(0xffD9D9D9).withOpacity(0.1),
                                            height: 4.00.hp,
                                            width: 40.00.wp,
                                            decoration: BoxDecoration(
                                                color: teal.withOpacity(0.1),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                border: Border.all(
                                                    color: const Color(
                                                        0xffD9D9D9))),
                                            child: Center(
                                                child: Text(
                                                    getAddItemListController
                                                        .getadditemproposal[0]
                                                        .data[0]
                                                        .carEnclosure
                                                        .toString())),
                                          ),
                                          Container(
                                            // color: const Color(0xffD9D9D9).withOpacity(0.1),
                                            height: 4.00.hp,
                                            width: 40.00.wp,
                                            decoration: BoxDecoration(
                                                color: teal.withOpacity(0.1),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                border: Border.all(
                                                    color: const Color(
                                                        0xffD9D9D9))),
                                            child: Center(
                                                child: Text(
                                                    getAddItemListController
                                                        .getadditemproposal[0]
                                                        .data[0]
                                                        .hoistwayDoors
                                                        .toString())),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 1.0.hp,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            // color: const Color(0xffD9D9D9).withOpacity(0.1),
                                            height: 2.00.hp,
                                            width: 48.00.wp,
                                            child: Text(
                                              'Entrance *',
                                              style: socialbutton,
                                            ),
                                          ),
                                          Container(
                                            // color: const Color(0xffD9D9D9).withOpacity(0.1),
                                            height: 2.00.hp,
                                            width: 25.00.wp,
                                            child: Text(
                                              'Door Operation *',
                                              style: socialbutton,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 1.0.hp,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            // color: const Color(0xffD9D9D9).withOpacity(0.1),
                                            height: 5.00.hp,
                                            width: 40.00.wp,
                                            decoration: BoxDecoration(
                                                color: teal.withOpacity(0.1),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                border: Border.all(
                                                    color: const Color(
                                                        0xffD9D9D9))),
                                            child: Center(
                                                child: Text(
                                                    getAddItemListController
                                                        .getadditemproposal[0]
                                                        .data[0]
                                                        .entrances
                                                        .toString())),
                                          ),
                                          Container(
                                            // color: const Color(0xffD9D9D9).withOpacity(0.1),
                                            height: 4.00.hp,
                                            width: 40.00.wp,
                                            decoration: BoxDecoration(
                                                color: teal.withOpacity(0.1),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                border: Border.all(
                                                    color: const Color(
                                                        0xffD9D9D9))),
                                            child: Center(
                                                child: Text(
                                                    getAddItemListController
                                                        .getadditemproposal[0]
                                                        .data[0]
                                                        .doorOperation
                                                        .toString())),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              : Container(),
                  Text(
                    'Load*',
                    style: listtitlefont,
                  ),
                  SizedBox(
                    height: 1.0.hp,
                  ),
                  Row(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 7.00.hp,
                            width: 90.00.wp,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                color: const Color(0xFFECE9E9),
                                width:
                                    MediaQuery.of(context).size.height * 0.001,
                              ),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: load,
                                style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        fontSize: 10.00.sp,
                                        color: forminputcolor,
                                        fontWeight: FontWeight.w500)),
                                hint: Text('Load',
                                    style: GoogleFonts.jost(
                                        textStyle: TextStyle(
                                            fontSize: 10.00.sp,
                                            color: formhintcolor,
                                            fontWeight: FontWeight.w500))),
                                onChanged: (newValue) {
                                  setState(() {
                                    if (newValue != null) {
                                      setState(() {
                                        load = newValue.toString();
                                        print('newwvalue');
                                        print(newValue.toString());
                                        print('clickkkk');

                                        proposalLoadAmtController
                                            .proposalLoadAmtController(
                                                loadid: load,
                                                subtotal:
                                                    getAddItemListController
                                                        .getadditemproposal[0]
                                                        .data[0]
                                                        .subtotal,
                                                total: getAddItemListController
                                                    .getadditemproposal[0]
                                                    .data[0]
                                                    .total);

                                        //loadcon=true;
                                      });
                                    }
                                  });
                                },
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  size: 20,
                                  color: const Color(0xFF737070),
                                ),
                                items: proposalLoadController
                                        .getproposalload[0].data.isEmpty
                                    ? []
                                    : proposalLoadController
                                        .getproposalload[0].data
                                        .map<DropdownMenuItem<String>>((value) {
                                        return DropdownMenuItem<String>(
                                          value: value.loadid.toString(),
                                          child: Container(
                                              margin: const EdgeInsets.only(
                                                  left: 0, right: 4),
                                              child: Text(
                                              proposalEditController.load.isEmpty?proposalEditController.load.toString():   value.optionname.toString(),
                                                  style: GoogleFonts.jost(
                                                      textStyle: TextStyle(
                                                          fontSize: 10.00.sp,
                                                          color: forminputcolor,
                                                          fontWeight: FontWeight
                                                              .w500)))),
                                        );
                                      }).toList(),
                              ),
                            )),
                      ],
                    ),
                  ]),
                  SizedBox(
                    height: 1.0.hp,
                  ),
                  Text(
                    'Speed*',
                    style: listtitlefont,
                  ),
                  SizedBox(
                    height: 1.0.hp,
                  ),
                  Row(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 7.00.hp,
                            width: 90.00.wp,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                color: const Color(0xFFECE9E9),
                                width:
                                    MediaQuery.of(context).size.height * 0.001,
                              ),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: speedvalue,
                                style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        fontSize: 10.00.sp,
                                        color: forminputcolor,
                                        fontWeight: FontWeight.w500)),
                                hint: Text('Speed',
                                    style: GoogleFonts.jost(
                                        textStyle: TextStyle(
                                            fontSize: 10.00.sp,
                                            color: formhintcolor,
                                            fontWeight: FontWeight.w500))),
                                onChanged: (newValue) {
                                  setState(() {
                                    if (newValue != null) {
                                      setState(() {
                                        speedvalue = newValue.toString();
                                        print('newwvalue');
                                        print(newValue.toString());
                                        print('clickkkk');

                                        proposalSpeedAmtController
                                            .proposalSpeedAmtController(
                                                speedid: speedvalue,
                                                total: getAddItemListController
                                                    .getadditemproposal[0]
                                                    .data[0]
                                                    .total
                                                    .toString(),
                                                subtotal:
                                                    getAddItemListController
                                                        .getadditemproposal[0]
                                                        .data[0]
                                                        .subtotal
                                                        .toString());

                                        //speedcon=true;
                                      });
                                    }
                                  });
                                },
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  size: 20,
                                  color: const Color(0xFF737070),
                                ),
                                items: proposalSpeedController
                                        .getproposalSpeed[0].data.isEmpty
                                    ? []
                                    : proposalSpeedController
                                        .getproposalSpeed[0].data
                                        .map<DropdownMenuItem<String>>((value) {
                                        return DropdownMenuItem<String>(
                                          value: value.speedid.toString(),
                                          child: Container(
                                              margin: const EdgeInsets.only(
                                                  left: 0, right: 4),
                                              child: Text(value.name.toString(),
                                                  style: GoogleFonts.jost(
                                                      textStyle: TextStyle(
                                                          fontSize: 10.00.sp,
                                                          color: forminputcolor,
                                                          fontWeight: FontWeight
                                                              .w500)))),
                                        );
                                      }).toList(),
                              ),
                            )),
                      ],
                    ),
                  ]),
                  SizedBox(
                    height: 1.0.hp,
                  ),
                  Text(
                    'Travel*',
                    style: listtitlefont,
                  ),
                  SizedBox(
                    height: 1.0.hp,
                  ),
                  Row(children: [
                    Container(
                        height: 7.00.hp,
                        width: 90.00.wp,
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
                            value: travel,
                            style: GoogleFonts.jost(
                                textStyle: TextStyle(
                                    fontSize: 10.00.sp,
                                    color: forminputcolor,
                                    fontWeight: FontWeight.w500)),
                            hint: Text('Travel',
                                style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        fontSize: 10.00.sp,
                                        color: formhintcolor,
                                        fontWeight: FontWeight.w500))),
                            onChanged: (newValue) {
                              setState(() {
                                if (newValue != null) {
                                  setState(() {
                                    travel = newValue.toString();
                                    print('newwvalue');
                                    print(newValue.toString());
                                    print('clickkkk');
                                    travelindex = 0;
                                    proposalTravelAmtController
                                        .proposaltravelAmtController(
                                            travelid: travel,
                                            specid: getAddItemListController
                                                .getadditemproposal[0]
                                                .data[0]
                                                .specificationid
                                                .toString(),
                                            subtotal: getAddItemListController
                                                .getadditemproposal[0]
                                                .data[0]
                                                .subtotal
                                                .toString(),
                                            total: getAddItemListController
                                                .getadditemproposal[0]
                                                .data[0]
                                                .total
                                                .toString());
                                    // travelcon=true;
                                  });
                                }
                              });
                            },
                            icon: Icon(
                              Icons.arrow_drop_down,
                              size: 20,
                              color: const Color(0xFF737070),
                            ),
                            items: proposalTravelController
                                    .getproposalTravel[0].data.isEmpty
                                ? []
                                : proposalTravelController
                                    .getproposalTravel[0].data
                                    .map<DropdownMenuItem<String>>((value) {
                                    return DropdownMenuItem<String>(
                                      value: value.travelid.toString(),
                                      child: Container(
                                          margin: const EdgeInsets.only(
                                              left: 0, right: 4),
                                          child: Text(value.name.toString(),
                                              style: GoogleFonts.jost(
                                                  textStyle: TextStyle(
                                                      fontSize: 10.00.sp,
                                                      color: forminputcolor,
                                                      fontWeight:
                                                          FontWeight.w500)))),
                                    );
                                  }).toList(),
                          ),
                        )),
                  ]),
                  SizedBox(
                    height: 0.5.hp,
                  ),
                  travelindex == 0
                      ? Container(
                          height: 10.0.hp,
                          width: 90.0.wp,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border:
                                  Border.all(color: const Color(0xFFECE9E9))),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 2.0.wp,
                                  ),
                                  Container(
                                    // color: const Color(0xffD9D9D9).withOpacity(0.1),
                                    height: 2.00.hp,
                                    width: 45.00.wp,
                                    child: Text(
                                      'Stop*',
                                      style: socialbutton,
                                    ),
                                  ),
                                  Container(
                                    // color: const Color(0xffD9D9D9).withOpacity(0.1),
                                    height: 2.00.hp,
                                    width: 25.00.wp,
                                    child: Text(
                                      'Opening*',
                                      style: socialbutton,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 1.0.hp,
                              ),
                              Row(children: [
                                Row(children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 1.0.wp,
                                      ),
                                      Container(
                                          height: 5.00.hp,
                                          width: 40.00.wp,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          decoration: BoxDecoration(
                                            color: teal.withOpacity(0.1),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            border: Border.all(
                                              color: const Color(0xFFECE9E9),
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.001,
                                            ),
                                          ),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton<String>(
                                              value: proposalstop,
                                              style: GoogleFonts.jost(
                                                  textStyle: TextStyle(
                                                      fontSize: 10.00.sp,
                                                      color: forminputcolor,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                              hint: Text('stop'),
                                              onChanged: (newValue) {
                                                setState(() {
                                                  if (newValue != null) {
                                                    setState(() {
                                                      proposalstop =
                                                          newValue.toString();
                                                      print('newwvalue');
                                                      print(
                                                          newValue.toString());
                                                      print('clickkkk');
                                                    });
                                                  }
                                                });
                                              },
                                              icon: Icon(
                                                Icons.arrow_drop_down,
                                                size: 20,
                                                color: const Color(0xFF737070),
                                              ),
                                              items: proposalStopController
                                                      .getproposalStop[0]
                                                      .data
                                                      .isEmpty
                                                  ? []
                                                  : proposalStopController
                                                      .getproposalStop[0].data
                                                      .map<
                                                          DropdownMenuItem<
                                                              String>>((value) {
                                                      return DropdownMenuItem<
                                                          String>(
                                                        value: value.stopid
                                                            .toString(),
                                                        child: Container(
                                                            margin:
                                                                const EdgeInsets
                                                                    .only(
                                                                    left: 0,
                                                                    right: 4),
                                                            child:Obx(() {
                                                if (proposalTravelAmtController
                                                        .isproposltravelamtLoad
                                                        .value &&
                                                    getAddItemListController
                                                        .isadditemlistLoad
                                                        .value) {
                                                  return Center(
                                                    child: Text('Stop'),
                                                  );
                                                } else if (proposalTravelAmtController
                                                        .getproposaltravelamt
                                                        .isEmpty ||
                                                    getAddItemListController
                                                        .getadditemproposal
                                                        .isEmpty) {
                                                  return Text('No data found');
                                                } else {
                                                  return Text(
                                                      proposalTravelAmtController
                                                          .getproposaltravelamt[
                                                              0]
                                                          .data[0]
                                                          .stop
                                                          .toString(),
                                                      style: GoogleFonts.jost(
                                                          textStyle: TextStyle(
                                                              fontSize:
                                                                  10.00.sp,
                                                              color:
                                                                  formhintcolor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500)));
                                                }
                                              })),
                                                      );
                                                    }).toList(),
                                            ),
                                          )),
                                    ],
                                  ),
                                ]),
                                SizedBox(
                                  width: 5.0.wp,
                                ),
                                Row(children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          height: 5.00.hp,
                                          width: 40.00.wp,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          decoration: BoxDecoration(
                                            color: teal.withOpacity(0.1),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            border: Border.all(
                                              color: const Color(0xFFECE9E9),
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.001,
                                            ),
                                          ),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton<String>(
                                              value: proposalopen,
                                              style: GoogleFonts.jost(
                                                  textStyle: TextStyle(
                                                      fontSize: 10.00.sp,
                                                      color: forminputcolor,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                              hint:Text('Opening'),
                                              onChanged: (newValue) {
                                                setState(() {
                                                  if (newValue != null) {
                                                    setState(() {
                                                      proposalopen =
                                                          newValue.toString();
                                                      print('newwvalue');
                                                      print(
                                                          newValue.toString());
                                                      print('clickkkk');
                                                      travelindex = 0;
                                                    });
                                                  }
                                                });
                                              },
                                              icon: Icon(
                                                Icons.arrow_drop_down,
                                                size: 20,
                                                color: const Color(0xFF737070),
                                              ),
                                              items: proposalOpenController
                                                      .getproposalOpen[0]
                                                      .data
                                                      .isEmpty
                                                  ? []
                                                  : proposalOpenController
                                                      .getproposalOpen[0].data
                                                      .map<
                                                          DropdownMenuItem<
                                                              String>>((value) {
                                                      return DropdownMenuItem<
                                                          String>(
                                                        value: value.openingid
                                                            .toString(),
                                                        child: Container(
                                                            margin:
                                                                const EdgeInsets
                                                                    .only(
                                                                    left: 0,
                                                                    right: 4),
                                                            child:  Obx(() {
                                                if (proposalTravelAmtController
                                                        .isproposltravelamtLoad
                                                        .value &&
                                                    getAddItemListController
                                                        .isadditemlistLoad
                                                        .value) {
                                                  return Center(
                                                    child: Text('Opening'),
                                                  );
                                                } else if (proposalTravelAmtController
                                                        .getproposaltravelamt
                                                        .isEmpty ||
                                                    getAddItemListController
                                                        .getadditemproposal
                                                        .isEmpty) {
                                                  return Text('No data found');
                                                } else {
                                                  return Text(
                                                      proposalTravelAmtController
                                                          .getproposaltravelamt[
                                                              0]
                                                          .data[0]
                                                          .opening
                                                          .toString(),
                                                      style: GoogleFonts.jost(
                                                          textStyle: TextStyle(
                                                              fontSize:
                                                                  10.00.sp,
                                                              color:
                                                                  formhintcolor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500)));
                                                }
                                              }),)
                                                      );
                                                    }).toList(),
                                            ),
                                          )),
                                    ],
                                  ),
                                ]),
                              ]),
                            ],
                          ),
                        )
                      : Container(),
                  SizedBox(
                    height: 1.0.hp,
                  ),
                  Text(
                    'Operation*',
                    style: listtitlefont,
                  ),
                  SizedBox(
                    height: 1.0.hp,
                  ),
                  Row(children: [
                    Container(
                        height: 7.00.hp,
                        width: 90.00.wp,
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
                            value: proposalOperation,
                            style: GoogleFonts.jost(
                                textStyle: TextStyle(
                                    fontSize: 10.00.sp,
                                    color: forminputcolor,
                                    fontWeight: FontWeight.w500)),
                            hint: Text('Operation',
                                style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        fontSize: 10.00.sp,
                                        color: formhintcolor,
                                        fontWeight: FontWeight.w500))),
                            onChanged: (newValue) {
                              setState(() {
                                if (newValue != null) {
                                  setState(() {
                                    proposalOperation = newValue.toString();
                                    print('newwvalue');
                                    print(newValue.toString());
                                    print('clickkkk');
                                  
                                    proposalOperationAmtController
                                        .proposalOperationAmtController(
                                            operationid: proposalOperation,
                                            typeid: getAddItemListController
                                                .getadditemproposal[0]
                                                .data[0]
                                                .typeid
                                                .toString(),
                                            total: getAddItemListController
                                                .getadditemproposal[0]
                                                .data[0]
                                                .total
                                                .toString(),
                                            subtotal: getAddItemListController
                                                .getadditemproposal[0]
                                                .data[0]
                                                .subtotal
                                                .toString());
                                                  
                                  });
                                }
                              });
                            },
                            icon: Icon(
                              Icons.arrow_drop_down,
                              size: 20,
                              color: const Color(0xFF737070),
                            ),
                            items: proposalOperationController
                                    .getproposalOperation[0].data.isEmpty
                                ? []
                                : proposalOperationController
                                    .getproposalOperation[0].data
                                    .map<DropdownMenuItem<String>>((value) {
                                    return DropdownMenuItem<String>(
                                      value: value.operationid.toString(),
                                      child: Container(
                                          margin: const EdgeInsets.only(
                                              left: 0, right: 4),
                                          child: Text(value.name.toString(),
                                              style: GoogleFonts.jost(
                                                  textStyle: TextStyle(
                                                      fontSize: 10.00.sp,
                                                      color: forminputcolor,
                                                      fontWeight:
                                                          FontWeight.w500)))),
                                    );
                                  }).toList(),
                          ),
                        )),
                  ]),
                  SizedBox(
                    height: 1.0.hp,
                  ),
                  Text(
                    'Control*',
                    style: listtitlefont,
                  ),
                  SizedBox(
                    height: 1.0.hp,
                  ),
                  Row(children: [
                    Container(
                        height: 7.00.hp,
                        width: 90.00.wp,
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
                            value: proposalControl,
                            style: GoogleFonts.jost(
                                textStyle: TextStyle(
                                    fontSize: 10.00.sp,
                                    color: forminputcolor,
                                    fontWeight: FontWeight.w500)),
                            hint: Text('Control',
                                style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        fontSize: 10.00.sp,
                                        color: formhintcolor,
                                        fontWeight: FontWeight.w500))),
                            onChanged: (newValue) {
                              setState(() {
                                if (newValue != null) {
                                  setState(() {
                                    proposalControl = newValue.toString();
                                    print('newwvalue');
                                    print(newValue.toString());
                                    print('clickkkk');
                                    travelindex = 1;
                                  });
                                }
                              });
                            },
                            icon: Icon(
                              Icons.arrow_drop_down,
                              size: 20,
                              color: const Color(0xFF737070),
                            ),
                            items: proposalControlController
                                    .getproposalControl[0].data.isEmpty
                                ? []
                                : proposalControlController
                                    .getproposalControl[0].data
                                    .map<DropdownMenuItem<String>>((value) {
                                    return DropdownMenuItem<String>(
                                      value: value.controlid.toString(),
                                      child: Container(
                                          margin: const EdgeInsets.only(
                                              left: 0, right: 4),
                                          child: Text(value.name.toString(),
                                              style: GoogleFonts.jost(
                                                  textStyle: TextStyle(
                                                      fontSize: 10.00.sp,
                                                      color: forminputcolor,
                                                      fontWeight:
                                                          FontWeight.w500)))),
                                    );
                                  }).toList(),
                          ),
                        )),
                  ]),
                  SizedBox(
                    height: 1.0.hp,
                  ),
                  
                  Text(
                    'Machine*',
                    style: listtitlefont,
                  ),
                  SizedBox(
                    height: 1.0.hp,
                  ),
                  Row(children: [
                    Container(
                        height: 7.00.hp,
                        width: 90.00.wp,
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
                            value: proposalMachine,
                            style: GoogleFonts.jost(
                                textStyle: TextStyle(
                                    fontSize: 10.00.sp,
                                    color: forminputcolor,
                                    fontWeight: FontWeight.w500)),
                            hint: Text('Control',
                                style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        fontSize: 10.00.sp,
                                        color: formhintcolor,
                                        fontWeight: FontWeight.w500))),
                            onChanged: (newValue) {
                              setState(() {
                                if (newValue != null) {
                                  setState(() {
                                    proposalMachine = newValue.toString();
                                    print('newwvalue');
                                    print(newValue.toString());
                                    print('clickkkk');
                                    travelindex = 1;
                                  });
                                }
                              });
                            },
                            icon: Icon(
                              Icons.arrow_drop_down,
                              size: 20,
                              color: const Color(0xFF737070),
                            ),
                            items: proposalMachineController
                                    .getproposalMachine[0].data.isEmpty
                                ? []
                                : proposalMachineController
                                    .getproposalMachine[0].data
                                    .map<DropdownMenuItem<String>>((value) {
                                    return DropdownMenuItem<String>(
                                      value: value.machineid.toString(),
                                      child: Container(
                                          margin: const EdgeInsets.only(
                                              left: 0, right: 4),
                                          child: Text(value.name.toString(),
                                              style: GoogleFonts.jost(
                                                  textStyle: TextStyle(
                                                      fontSize: 10.00.sp,
                                                      color: forminputcolor,
                                                      fontWeight:
                                                          FontWeight.w500)))),
                                    );
                                  }).toList(),
                          ),
                        )),
                  ]),
                  // Container(
                  //   height: 30.0.hp,
                  //   width: 80.0.wp,
                  //   decoration: BoxDecoration(
                  //       // color: Colors.deepOrange,
                  //       borderRadius:
                  //           BorderRadius.vertical(top: Radius.circular(20.0))),
                  //   child: Column(
                  //     // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //     crossAxisAlignment: CrossAxisAlignment.end,
                  //     children: <Widget>[
                  //       Container(
                  //         alignment: Alignment.bottomRight,
                  //         height: 5.0.hp,
                  //         width: 50.0.wp,
                  //         decoration: BoxDecoration(
                  //             border: Border.all(color: formhintcolor)),
                  //         child: Center(
                  //           child: Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //             children: [
                  //               Text(
                  //                 'Sub Total: ',
                  //                 style: listtitlefont,
                  //               ),

                  //               //  proposalSpeedAmtController.getproposalspeedamt.isEmpty?Text('null'):  proposalSpeedAmtController.getproposalspeedamt[0].from=='speedamount'?Text( proposalSpeedAmtController.getproposalspeedamt[0].data[0].subtotal.toString()):
                  //               //   getAddItemListController.getadditemproposal.isEmpty?Text(''):Text(getAddItemListController.getadditemproposal[0].data[0].subtotal.toString())
                  //               //getAddItemListController.getadditemproposal.isEmpty?Text('click'):

                  //              Obx(() {
                  //               if(getAddItemListController.isadditemlistLoad.value&&proposalLoadAmtController.isproposaLoadamtLoad.value
                  //               &&proposalSpeedAmtController.isproposaspeedamtLoad.value&&proposalTravelAmtController.isproposltravelamtLoad.value

                  //               ){
                  //                 return Text('loading');
                  //               }
                  //              else if(getAddItemListController.getadditemproposal.isEmpty&&proposalLoadAmtController.getproposalloadamt.isEmpty
                  //              &&proposalSpeedAmtController.getproposalspeedamt.isEmpty&&proposalTravelAmtController.getproposaltravelamt.isEmpty
                  //              ){
                  //                 return Text('ccc');
                  //               }

                  //              else{
                  //                return Text(
                  //                 '${commonVariable.commonapidata.toString()}');
                  //              }})
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //       // Container(
                  //       //     alignment: Alignment.bottomRight,
                  //       //     height: 7.0.hp,
                  //       //     width: 100.0.wp,
                  //       //     // decoration: BoxDecoration(
                  //       //     //   border: Border.all(color: formhintcolor)
                  //       //     // ),
                  //       //     child: Center(
                  //       //         child: Row(
                  //       //             //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //       //             children: [
                  //       //           Container(
                  //       //             color: const Color(0xffD9D9D9).withOpacity(0.1),
                  //       //             height: 6.00.hp, width: 30.00.wp,
                  //       //             // padding: const EdgeInsets.only(
                  //       //             //   left: 20,
                  //       //             //   right: 20,
                  //       //             // ),
                  //       //             child: TextFormField(
                  //       //               //  controller: getProposalRelatedController.oepntill,
                  //       //               style: GoogleFonts.jost(
                  //       //                   textStyle: TextStyle(
                  //       //                       fontSize: 10.00.sp,
                  //       //                       color: forminputcolor,
                  //       //                       fontWeight: FontWeight.w500)),
                  //       //               decoration: InputDecoration(
                  //       //                   focusedBorder: OutlineInputBorder(
                  //       //                     borderRadius: BorderRadius.circular(5.0),
                  //       //                     borderSide: const BorderSide(
                  //       //                         color: appcolor, width: 1),
                  //       //                   ),
                  //       //                   label: Text('Discount'),
                  //       //                   labelStyle: formhintstyle,
                  //       //                   enabledBorder: OutlineInputBorder(
                  //       //                     borderRadius: BorderRadius.circular(5.0),
                  //       //                     borderSide: BorderSide(
                  //       //                         color: const Color(0xffC6C6C6)
                  //       //                             .withOpacity(0.5),
                  //       //                         width: 1),
                  //       //                   ),
                  //       //                   fillColor: const Color(0xffC6C6C6),
                  //       //                   hintText: '',
                  //       //                   contentPadding:
                  //       //                       const EdgeInsets.only(left: 10),
                  //       //                   hintStyle: GoogleFonts.jost(
                  //       //                       textStyle: TextStyle(
                  //       //                           fontSize: 10.00.sp,
                  //       //                           color: formhintcolor,
                  //       //                           fontWeight: FontWeight.w500)),
                  //       //                   border: const OutlineInputBorder(
                  //       //                     gapPadding: 4,
                  //       //                   )),
                  //       //             ),
                  //       //           ),
                  //       //           Row(
                  //       //             mainAxisAlignment: MainAxisAlignment.center,
                  //       //             children: [
                  //       //               Container(
                  //       //                   height: 6.00.hp,
                  //       //                   width: discount_type_name == '%'
                  //       //                       ? 10.0.wp
                  //       //                       : 30.00.wp,
                  //       //                   decoration: BoxDecoration(
                  //       //                     borderRadius: BorderRadius.circular(5.0),
                  //       //                     border: Border.all(
                  //       //                       color: formhintcolor,
                  //       //                       width:
                  //       //                           MediaQuery.of(context).size.height *
                  //       //                               0.001,
                  //       //                     ),
                  //       //                   ),
                  //       //                   child: DropdownButtonHideUnderline(
                  //       //                     child: DropdownButton<String>(
                  //       //                       isExpanded: true,
                  //       //                       value: discount_type_name,
                  //       //                       style: GoogleFonts.jost(
                  //       //                           textStyle: TextStyle(
                  //       //                               fontSize: 8.00.sp,
                  //       //                               color: forminputcolor,
                  //       //                               fontWeight: FontWeight.w500)),
                  //       //                       hint: Text('',
                  //       //                           style: GoogleFonts.jost(
                  //       //                               textStyle: TextStyle(
                  //       //                                   fontSize: 8.00.sp,
                  //       //                                   color: formhintcolor,
                  //       //                                   fontWeight:
                  //       //                                       FontWeight.w500))),
                  //       //                       onChanged: (newValue) {
                  //       //                         setState(() {
                  //       //                           if (newValue != null) {
                  //       //                             setState(() {
                  //       //                               discount_type_name =
                  //       //                                   newValue.toString();
                  //       //                               print('newwvalue');
                  //       //                               print(newValue.toString());
                  //       //                             });
                  //       //                           }
                  //       //                         });
                  //       //                       },
                  //       //                       icon: Icon(
                  //       //                         Icons.arrow_drop_down,
                  //       //                         size: 20,
                  //       //                         color: const Color(0xFF737070),
                  //       //                       ),
                  //       //                       items: discount_type
                  //       //                           .map<DropdownMenuItem<String>>(
                  //       //                               (value) {
                  //       //                         return DropdownMenuItem<String>(
                  //       //                           value: value.toString(),
                  //       //                           child: Container(
                  //       //                               margin: const EdgeInsets.only(
                  //       //                                   left: 0, right: 0),
                  //       //                               child: Text(value.toString(),
                  //       //                                   style: GoogleFonts.jost(
                  //       //                                       textStyle: TextStyle(
                  //       //                                           fontSize: 10.00.sp,
                  //       //                                           color:
                  //       //                                               forminputcolor,
                  //       //                                           fontWeight:
                  //       //                                               FontWeight
                  //       //                                                   .w500)))),
                  //       //                         );
                  //       //                       }).toList(),
                  //       //                     ),
                  //       //                   )),
                  //       //             ],
                  //       //           ),
                  //       //           Container(
                  //       //             alignment: Alignment.centerRight,
                  //       //             width: 30.0.wp,
                  //       //             child: Text(
                  //       //               '-1234456789 ',
                  //       //               style: listtitlefont,
                  //       //             ),
                  //       //           ),
                  //       //         ]))),
                  //       Container(
                  //         alignment: Alignment.bottomRight,
                  //         height: 5.0.hp,
                  //         width: 50.0.wp,
                  //         child: Center(
                  //           child: Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //             children: [
                  //               Text(
                  //                 'CGST(9.00%): ',
                  //                 style: listtitlefont,
                  //               ),
                  //               Text(
                  //                 '₹8910.00',
                  //                 style: listtitlefont,
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //       Container(
                  //         alignment: Alignment.bottomRight,
                  //         height: 5.0.hp,
                  //         width: 50.0.wp,
                  //         child: Center(
                  //           child: Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //             children: [
                  //               Text(
                  //                 'SGST(9.00%): ',
                  //                 style: listtitlefont,
                  //               ),
                  //               Text(
                  //                 '₹8910.00',
                  //                 style: listtitlefont,
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //       Container(
                  //         alignment: Alignment.bottomRight,
                  //         height: 5.0.hp,
                  //         width: 50.0.wp,
                  //         decoration: BoxDecoration(
                  //             border: Border.all(color: formhintcolor)),
                  //         child: Center(
                  //           child: Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //             children: [
                  //               Text(
                  //                 'Total: ',
                  //                 style: listtitlefont,
                  //               ),
                  //               Text(
                  //                 getAddItemListController
                  //                         .getadditemproposal.isEmpty
                  //                     ? ''
                  //                     : '${getAddItemListController.getadditemproposal[0].data[0].total.toString()}',
                  //                 style: listtitlefont,
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  SizedBox(
                      height: 1.0.hp,
                    ),
                    Text(
                      'Hoistway Size*',
                      style: listtitlefont,
                    ),
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
                        controller: getAddItemListController.hoistwaysize,
                        style: GoogleFonts.jost(
                            textStyle: TextStyle(
                                fontSize: 10.00.sp,
                                color: forminputcolor,
                                fontWeight: FontWeight.w500)),
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide:
                                  const BorderSide(color: appcolor, width: 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                  color:
                                      const Color(0xffC6C6C6).withOpacity(0.5),
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
                    Text(
                      'Car Size*',
                      style: listtitlefont,
                    ),
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
                        controller: getAddItemListController.carsize,
                        style: GoogleFonts.jost(
                            textStyle: TextStyle(
                                fontSize: 10.00.sp,
                                color: forminputcolor,
                                fontWeight: FontWeight.w500)),
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide:
                                  const BorderSide(color: appcolor, width: 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                  color:
                                      const Color(0xffC6C6C6).withOpacity(0.5),
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
                    Text(
                      'Delivery*',
                      style: listtitlefont,
                    ),
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
                        controller: getAddItemListController.delivery,
                        style: GoogleFonts.jost(
                            textStyle: TextStyle(
                                fontSize: 10.00.sp,
                                color: forminputcolor,
                                fontWeight: FontWeight.w500)),
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide:
                                  const BorderSide(color: appcolor, width: 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                  color:
                                      const Color(0xffC6C6C6).withOpacity(0.5),
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
                    Text(
                      'Erection& Commissioning*',
                      style: listtitlefont,
                    ),
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
                        controller: getAddItemListController.erection,
                        style: GoogleFonts.jost(
                            textStyle: TextStyle(
                                fontSize: 10.00.sp,
                                color: forminputcolor,
                                fontWeight: FontWeight.w500)),
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide:
                                  const BorderSide(color: appcolor, width: 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                  color:
                                      const Color(0xffC6C6C6).withOpacity(0.5),
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
                    Text(
                      'Power Supply*',
                      style: listtitlefont,
                    ),
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
                        controller: getAddItemListController.powersupply,
                        style: GoogleFonts.jost(
                            textStyle: TextStyle(
                                fontSize: 10.00.sp,
                                color: forminputcolor,
                                fontWeight: FontWeight.w500)),
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide:
                                  const BorderSide(color: appcolor, width: 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                  color:
                                      const Color(0xffC6C6C6).withOpacity(0.5),
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
            ),
          );
        }
      }),
    );
  }
}
