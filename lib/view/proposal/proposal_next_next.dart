import 'package:flutter/material.dart';
import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/controller/add_proposal_controller/proposal_control_controller.dart';
import 'package:leadingmanagementsystem/controller/add_proposal_controller/proposal_machine_controller.dart';
import 'package:leadingmanagementsystem/controller/add_proposal_controller/proposal_operation_controller.dart';

import '../../controller/add_proposal_controller/proposal_open_controller.dart';
import '../../controller/add_proposal_controller/proposal_stop_controller.dart';
import '../../controller/add_proposal_controller/proposal_travel_controller.dart';
import '../../utils/textstyles.dart';

class ProposalNextNextPage extends StatefulWidget {
  const ProposalNextNextPage({super.key});

  @override
  State<ProposalNextNextPage> createState() => _ProposalNextNextPageState();
}

class _ProposalNextNextPageState extends State<ProposalNextNextPage> {
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
      ProposalMachineController proposalMachineController=Get.put(ProposalMachineController());
  var travel;
  var travelindex;
  var proposalstop;
  var proposalopen;
  var proposalControl;
  var proposalOperation;
  var proposalMachine;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                      : proposalTravelController.getproposalTravel[0].data
                          .map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem<String>(
                            value: value.travelid.toString(),
                            child: Container(
                                margin:
                                    const EdgeInsets.only(left: 0, right: 4),
                                child: Text(value.name.toString(),
                                    style: GoogleFonts.jost(
                                        textStyle: TextStyle(
                                            fontSize: 10.00.sp,
                                            color: forminputcolor,
                                            fontWeight: FontWeight.w500)))),
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
                    border: Border.all(color: const Color(0xFFECE9E9))),
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
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                    color: const Color(0xFFECE9E9),
                                    width: MediaQuery.of(context).size.height *
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
                                            fontWeight: FontWeight.w500)),
                                    hint: Text('Stop',
                                        style: GoogleFonts.jost(
                                            textStyle: TextStyle(
                                                fontSize: 10.00.sp,
                                                color: formhintcolor,
                                                fontWeight: FontWeight.w500))),
                                    onChanged: (newValue) {
                                      setState(() {
                                        if (newValue != null) {
                                          setState(() {
                                            proposalstop = newValue.toString();
                                            print('newwvalue');
                                            print(newValue.toString());
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
                                            .getproposalStop[0].data.isEmpty
                                        ? []
                                        : proposalStopController
                                            .getproposalStop[0].data
                                            .map<DropdownMenuItem<String>>(
                                                (value) {
                                            return DropdownMenuItem<String>(
                                              value: value.stopid.toString(),
                                              child: Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 0, right: 4),
                                                  child: Text(
                                                      value.name.toString(),
                                                      style: GoogleFonts.jost(
                                                          textStyle: TextStyle(
                                                              fontSize:
                                                                  10.00.sp,
                                                              color:
                                                                  forminputcolor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500)))),
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
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                    color: const Color(0xFFECE9E9),
                                    width: MediaQuery.of(context).size.height *
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
                                            fontWeight: FontWeight.w500)),
                                    hint: Text('Opening',
                                        style: GoogleFonts.jost(
                                            textStyle: TextStyle(
                                                fontSize: 10.00.sp,
                                                color: formhintcolor,
                                                fontWeight: FontWeight.w500))),
                                    onChanged: (newValue) {
                                      setState(() {
                                        if (newValue != null) {
                                          setState(() {
                                            proposalopen = newValue.toString();
                                            print('newwvalue');
                                            print(newValue.toString());
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
                                            .getproposalOpen[0].data.isEmpty
                                        ? []
                                        : proposalOpenController
                                            .getproposalOpen[0].data
                                            .map<DropdownMenuItem<String>>(
                                                (value) {
                                            return DropdownMenuItem<String>(
                                              value: value.openingid.toString(),
                                              child: Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 0, right: 4),
                                                  child: Text(
                                                      value.name.toString(),
                                                      style: GoogleFonts.jost(
                                                          textStyle: TextStyle(
                                                              fontSize:
                                                                  10.00.sp,
                                                              color:
                                                                  forminputcolor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500)))),
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
                      : proposalControlController.getproposalControl[0].data
                          .map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem<String>(
                            value: value.controlid.toString(),
                            child: Container(
                                margin:
                                    const EdgeInsets.only(left: 0, right: 4),
                                child: Text(value.name.toString(),
                                    style: GoogleFonts.jost(
                                        textStyle: TextStyle(
                                            fontSize: 10.00.sp,
                                            color: forminputcolor,
                                            fontWeight: FontWeight.w500)))),
                          );
                        }).toList(),
                ),
              )),
        ]),
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
                  items: proposalOperationController
                          .getproposalOperation[0].data.isEmpty
                      ? []
                      : proposalOperationController.getproposalOperation[0].data
                          .map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem<String>(
                            value: value.operationid.toString(),
                            child: Container(
                                margin:
                                    const EdgeInsets.only(left: 0, right: 4),
                                child: Text(value.name.toString(),
                                    style: GoogleFonts.jost(
                                        textStyle: TextStyle(
                                            fontSize: 10.00.sp,
                                            color: forminputcolor,
                                            fontWeight: FontWeight.w500)))),
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
                  items: proposalMachineController.getproposalMachine[0].data.isEmpty
                      ? []
                      : proposalMachineController.getproposalMachine[0].data
                          .map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem<String>(
                            value: value.machineid.toString(),
                            child: Container(
                                margin:
                                    const EdgeInsets.only(left: 0, right: 4),
                                child: Text(value.name.toString(),
                                    style: GoogleFonts.jost(
                                        textStyle: TextStyle(
                                            fontSize: 10.00.sp,
                                            color: forminputcolor,
                                            fontWeight: FontWeight.w500)))),
                          );
                        }).toList(),
                ),
              )),
        ]),
      ],
    );
  }
}
