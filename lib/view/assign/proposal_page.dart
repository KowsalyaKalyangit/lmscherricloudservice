import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/controller/add_proposal_controller/get_proposal_related_controller.dart';
import 'package:leadingmanagementsystem/controller/add_proposal_controller/proposal_get_controller.dart';

import '../../controller/add_leads_controller.dart';
import '../../controller/add_proposal_controller/proposal_currency_controller.dart';
import '../../controller/add_proposal_controller/proposal_discount_controller.dart';
import '../../controller/add_proposal_controller/proposal_status_controller.dart';
import '../../controller/add_proposal_controller/related_proposal_controller.dart';
import '../../utils/signup_button.dart';
import '../../utils/textstyles.dart';
import '../proposal/proposal_add.dart';
import '../proposal/proposal_nextpage.dart';

class ProposalPage extends StatefulWidget {
  const ProposalPage({super.key, this.id});
  final String? id;

  @override
  State<ProposalPage> createState() => _ProposalPageState();
}

class _ProposalPageState extends State<ProposalPage> {
  var typeindex;
  var countryname;

  var status;

  var related;
  var relateditem;
  var currency;
  var discount;
  AddAssignDetailsController addAssignDetailsController =
      Get.put(AddAssignDetailsController());
  ProposalRelatedController proposalRelatedController =
      Get.put(ProposalRelatedController());
  GetProposalRelatedController getProposalRelatedController =
      Get.put(GetProposalRelatedController());
  ProposalStatusController proposalStatusController =
      Get.put(ProposalStatusController());
  ProposalCurrencyController proposalCurrencyController=Get.put(ProposalCurrencyController());
  ProposalDiscountController proposalDiscountController=Get.put(ProposalDiscountController());
  ProposalGetController proposalGetController=Get.put(ProposalGetController());
  void initState() {
    func();
    super.initState();
  }

  func() {
    getProposalRelatedController
        .getproposalrelatedController(leadid: widget.id.toString())
        .then((value) {
      setState(() {
        addAssignDetailsController.getCountry().then((value) {
          setState(() {
            countryname = addAssignDetailsController
                .getprofileUpdatecountry[0].data[0].countryId;
          });
        });
      });
    });
    proposalRelatedController.proposalrelatedController().then(
      (value) {
        relateditem =
            proposalRelatedController.getleadstypeDetails[0].data[0].value;
      },
    );
    setState(() {});
    proposalStatusController.proposalStatusController().then((e) {
      setState(() {
        status = proposalStatusController.getproposalstatus[0].data[0].value;
      });
    });
    proposalCurrencyController.proposalCurrencyController().then((value){
      currency=proposalCurrencyController.getproposalCurrency[0].data[0].id;
    });
    proposalDiscountController.proposalDiscountController().then((value) {
      discount=proposalDiscountController.getproposalCurrency[0].data[0].value;
    });
  }
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: InkWell(onTap: () {
          Get.back();
        },child: Icon(Icons.arrow_back,color: screenbackground,),),
        backgroundColor: appcolor,title: Text('Add Proposal',style: toptitleStyle,),),
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: logocolor,
        //   onPressed: (){
        //     Get.to(AddProposalPage());
        //   },child: Icon(Icons.add),),
        backgroundColor: screenbackground,
        body: Obx(() {
          if (proposalRelatedController.isproposalreletadLoad.value ||
              getProposalRelatedController.isgetproposalreletadLoad.value ||
              addAssignDetailsController.isCountryLoading.value ||
              proposalStatusController.isproposalstatusLoad.value
        ||proposalCurrencyController.isproposalCurrencyLoad.value||
        proposalDiscountController.isproposalDiscountLoad.value
              ) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (proposalRelatedController.getleadstypeDetails.isEmpty ||
              getProposalRelatedController.getproposalrelatedDetails.isEmpty ||
              addAssignDetailsController.getprofileUpdatecountry.isEmpty ||
              proposalStatusController.getproposalstatus.isEmpty||
              proposalCurrencyController.getproposalCurrency.isEmpty||
              proposalDiscountController.getproposalCurrency.isEmpty
              ) {
            return Center(
              child: Text('No data Found'),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 1.0.hp,
                    ),
                    Text(
                      'Subject*',
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
                        controller: getProposalRelatedController.subject,
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
                    Text(
                      'Related*',
                      style: listtitlefont,
                    ),
                    SizedBox(
                      height: 1.0.hp,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 7.00.hp,
                            width: 86.00.wp,
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
                                value: relateditem,
                                style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        fontSize: 10.00.sp,
                                        color: forminputcolor,
                                        fontWeight: FontWeight.w500)),
                                hint: Text(relateditem.toString(),
                                    style: GoogleFonts.jost(
                                        textStyle: TextStyle(
                                            fontSize: 10.00.sp,
                                            color: formhintcolor,
                                            fontWeight: FontWeight.w500))),
                                onChanged: (newValue) {
                                  setState(() {
                                    if (newValue != null) {
                                     setState(() {
                                        relateditem = newValue.toString();
                                      print('newwvalue');
                                      print(newValue.toString());
                                     });
                                    }
                                  });
                                },
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  size: 20,
                                  color: const Color(0xFF737070),
                                ),
                                items: proposalRelatedController
                                        .getleadstypeDetails[0].data.isEmpty
                                    ? []
                                    : proposalRelatedController
                                        .getleadstypeDetails[0].data
                                        .map<DropdownMenuItem<String>>((value) {
                                        return DropdownMenuItem<String>(
                                          value: value.value.toString(),
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

                               SizedBox(
                      height: 1.0.hp,
                    ),
                    Text(
                      'Lead*',
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
                        controller: getProposalRelatedController.leadname,
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
                      height: 1.0.wp,
                    ),
                    Text(
                      'To*',
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
                        controller: getProposalRelatedController.toname,
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
                      height: 1.0.wp,
                    ),
                    Text(
                      'Address',
                      style: listtitlefont,
                    ),
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
                        controller: getProposalRelatedController.address,
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
                    Row(
                      children: [
                        Text(
                          'State',
                          style: listtitlefont,
                        ),
                        SizedBox(
                          width: 40.0.wp,
                        ),
                        Text(
                          'City',
                          style: listtitlefont,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          color: const Color(0xffD9D9D9).withOpacity(0.1),
                          height: 7.00.hp, width: 40.00.wp,
                          // padding: const EdgeInsets.only(
                          //   left: 20,
                          //   right: 20,
                          // ),
                          child: TextFormField(
                            controller: getProposalRelatedController.city,
                            style: GoogleFonts.jost(
                                textStyle: TextStyle(
                                    fontSize: 10.00.sp,
                                    color: forminputcolor,
                                    fontWeight: FontWeight.w500)),
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: const BorderSide(
                                      color: appcolor, width: 1),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                      color: const Color(0xffC6C6C6)
                                          .withOpacity(0.5),
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
                        Container(
                          color: const Color(0xffD9D9D9).withOpacity(0.1),
                          height: 7.00.hp, width: 40.00.wp,
                          // padding: const EdgeInsets.only(
                          //   left: 20,
                          //   right: 20,
                          // ),
                          child: TextFormField(
                            controller: getProposalRelatedController.state,
                            style: GoogleFonts.jost(
                                textStyle: TextStyle(
                                    fontSize: 10.00.sp,
                                    color: forminputcolor,
                                    fontWeight: FontWeight.w500)),
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: const BorderSide(
                                      color: appcolor, width: 1),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                      color: const Color(0xffC6C6C6)
                                          .withOpacity(0.5),
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
                    Text(
                      'Country',
                      style: listtitlefont,
                    ),
                    SizedBox(
                      height: 1.0.hp,
                    ),
                    Container(
                        height: 6.00.hp,
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
                          child: DropdownButton(
                            value: countryname,
                            style: GoogleFonts.jost(
                                textStyle: TextStyle(
                                    fontSize: 10.00.sp,
                                    color: forminputcolor,
                                    fontWeight: FontWeight.w500)),
                            hint: Text('country',
                                style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        fontSize: 10.00.sp,
                                        color: formhintcolor,
                                        fontWeight: FontWeight.w500))),
                            onChanged: (newValue) {
                              setState(() {
                                if (newValue != null) {
                                  setState(() {
                                    countryname = newValue.toString();
                                    print('newwvalue');
                                    print(newValue.toString());
                                  });
                                }
                              });
                            },
                            icon: Icon(
                              Icons.arrow_drop_down,
                              size: 20,
                              color: const Color(0xFF737070),
                            ),
                            items: addAssignDetailsController
                                    .getprofileUpdatecountry[0].data.isEmpty
                                ? []
                                : addAssignDetailsController
                                    .getprofileUpdatecountry[0].data
                                    .map<DropdownMenuItem<String>>((value) {
                                    return DropdownMenuItem<String>(
                                      value: value.countryId.toString(),
                                      child: Container(
                                          margin: const EdgeInsets.only(
                                              left: 0, right: 4),
                                          child: Text(
                                              value.countryName.toString(),
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
                    SizedBox(
                      height: 1.0.hp,
                    ),
                    Row(
                      children: [
                        Text(
                          'Phone',
                          style: listtitlefont,
                        ),
                        SizedBox(
                          width: 34.0.wp,
                        ),
                        Text(
                          'Zip Code',
                          style: listtitlefont,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.0.hp,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          color: const Color(0xffD9D9D9).withOpacity(0.1),
                          height: 6.00.hp, width: 40.00.wp,
                          // padding: const EdgeInsets.only(
                          //   left: 20,
                          //   right: 20,
                          // ),
                          child: TextFormField(
                            controller: getProposalRelatedController.phone,
                            style: GoogleFonts.jost(
                                textStyle: TextStyle(
                                    fontSize: 10.00.sp,
                                    color: forminputcolor,
                                    fontWeight: FontWeight.w500)),
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: const BorderSide(
                                      color: appcolor, width: 1),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                      color: const Color(0xffC6C6C6)
                                          .withOpacity(0.5),
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
                            controller: getProposalRelatedController.zip,
                            style: GoogleFonts.jost(
                                textStyle: TextStyle(
                                    fontSize: 10.00.sp,
                                    color: forminputcolor,
                                    fontWeight: FontWeight.w500)),
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: const BorderSide(
                                      color: appcolor, width: 1),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                      color: const Color(0xffC6C6C6)
                                          .withOpacity(0.5),
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
                        Text(
                          'Date*',
                          style: listtitlefont,
                        ),
                        SizedBox(
                          width: 34.0.wp,
                        ),
                        Text(
                          'Open Till',
                          style: listtitlefont,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.0.hp,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          color: const Color(0xffD9D9D9).withOpacity(0.1),
                          height: 6.00.hp, width: 40.00.wp,
                          // padding: const EdgeInsets.only(
                          //   left: 20,
                          //   right: 20,
                          // ),
                          child: TextFormField(
                            controller: getProposalRelatedController.date,
                            style: GoogleFonts.jost(
                                textStyle: TextStyle(
                                    fontSize: 10.00.sp,
                                    color: forminputcolor,
                                    fontWeight: FontWeight.w500)),
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: const BorderSide(
                                      color: appcolor, width: 1),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                      color: const Color(0xffC6C6C6)
                                          .withOpacity(0.5),
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
                            controller: getProposalRelatedController.oepntill,
                            style: GoogleFonts.jost(
                                textStyle: TextStyle(
                                    fontSize: 10.00.sp,
                                    color: forminputcolor,
                                    fontWeight: FontWeight.w500)),
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: const BorderSide(
                                      color: appcolor, width: 1),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                      color: const Color(0xffC6C6C6)
                                          .withOpacity(0.5),
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
                    Text(
                      'Status',
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
                              width: 40.00.wp,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(
                                  color: const Color(0xFFECE9E9),
                                  width: MediaQuery.of(context).size.height *
                                      0.001,
                                ),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: status,
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
                                  onChanged: (newValue) {
                                    setState(() {
                                      if (newValue != null) {
                                        setState(() {
                                          status = newValue.toString();
                                          print('newwvalue');
                                          print(newValue.toString());
                                        });
                                      }
                                    });
                                  },
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    size: 20,
                                    color: const Color(0xFF737070),
                                  ),
                                  items: proposalStatusController
                                          .getproposalstatus[0].data.isEmpty
                                      ? []
                                      : proposalStatusController
                                          .getproposalstatus[0].data
                                          .map<DropdownMenuItem<String>>(
                                              (value) {
                                          return DropdownMenuItem<String>(
                                            value: value.value.toString(),
                                            child: Container(
                                                margin: const EdgeInsets.only(
                                                    left: 0, right: 4),
                                                child: Text(
                                                    value.name.toString(),
                                                    style: GoogleFonts.jost(
                                                        textStyle: TextStyle(
                                                            fontSize: 10.00.sp,
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
                      height: 1.0.hp,
                    ),
                    Text(
                      'Email*',
                      style: listtitlefont,
                    ),
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
                        controller: getProposalRelatedController.tomail,
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
                     SizedBox(
                      height: 1.0.hp,
                    ),
                    Row(
                      children: [
                        Text(
                          'Currency*',
                          style: listtitlefont,
                        ),
                        SizedBox(
                          width: 34.0.wp,
                        ),
                        Text(
                          'Discount Type',
                          style: listtitlefont,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.0.hp,
                    ),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: 7.00.hp,
                              width: 40.00.wp,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                 color:   teal1.withOpacity(0.1),
                                border: Border.all(
                                  color: const Color(0xFFECE9E9),
                                  width: MediaQuery.of(context).size.height *
                                      0.001,
                                ),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: currency,
                                  style: GoogleFonts.jost(
                                      textStyle: TextStyle(
                                          fontSize: 10.00.sp,
                                          color: forminputcolor,
                                          fontWeight: FontWeight.w500)),
                                  hint: Text('',
                                      style: GoogleFonts.jost(
                                          textStyle: TextStyle(
                                              fontSize: 10.00.sp,
                                              color: formhintcolor,
                                              fontWeight: FontWeight.w500))),
                                  onChanged: (newValue) {
                                    setState(() {
                                      if (newValue != null) {
                                        setState(() {
                                          currency = newValue.toString();
                                          print('newwvalue');
                                          print(newValue.toString());
                                        });
                                      }
                                    });
                                  },
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    size: 20,
                                    color: const Color(0xFF737070),
                                  ),
                                  items: proposalCurrencyController
                                          .getproposalCurrency[0].data.isEmpty
                                      ? []
                                      : proposalCurrencyController
                                          .getproposalCurrency[0].data
                                          .map<DropdownMenuItem<String>>(
                                              (value) {
                                          return DropdownMenuItem<String>(
                                            value: value.id.toString(),
                                            child: Container(
                                                margin: const EdgeInsets.only(
                                                    left: 0, right: 4),
                                                child: Text(
                                                    '${value.symbol.toString()}${value.name.toString()}',
                                                    style: GoogleFonts.jost(
                                                        textStyle: TextStyle(
                                                            fontSize: 10.00.sp,
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
                       Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: 7.00.hp,
                              width: 40.00.wp,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                 color:teal1.withOpacity(0.1),
                                border: Border.all(
                                  color: const Color(0xFFECE9E9),
                                  width: MediaQuery.of(context).size.height *
                                      0.001,
                                ),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: discount,
                                  style: GoogleFonts.jost(
                                      textStyle: TextStyle(
                                          fontSize: 10.00.sp,
                                          color: forminputcolor,
                                          fontWeight: FontWeight.w500)),
                                  hint: Text('discount type',
                                      style: GoogleFonts.jost(
                                          textStyle: TextStyle(
                                              fontSize: 10.00.sp,
                                              color: formhintcolor,
                                              fontWeight: FontWeight.w500))),
                                  onChanged: (newValue) {
                                    setState(() {
                                      if (newValue != null) {
                                        setState(() {
                                          discount = newValue.toString();
                                          print('newwvalue');
                                          print(newValue.toString());
                                        });
                                      }
                                    });
                                  },
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    size: 20,
                                    color: const Color(0xFF737070),
                                  ),
                                  items: proposalDiscountController
                                          .getproposalCurrency[0].data.isEmpty
                                      ? []
                                      : proposalDiscountController
                                          .getproposalCurrency[0].data
                                          .map<DropdownMenuItem<String>>(
                                              (value) {
                                          return DropdownMenuItem<String>(
                                            value: value.value.toString(),
                                            child: Container(
                                                margin: const EdgeInsets.only(
                                                    left: 0, right: 4),
                                                child: Text(
                                                    value.name.toString(),
                                                    style: GoogleFonts.jost(
                                                        textStyle: TextStyle(
                                                            fontSize: 10.00.sp,
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
                      height: 2.0.hp,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ButtonIconButton(
                        press: () async {
                          Get.to(ProposalNextPage(
                            id: widget.id.toString(),subjectname: getProposalRelatedController.subject.text,
                            opentillname: getProposalRelatedController.oepntill.text,
                            datename: getProposalRelatedController.date.text,
                            proposaltoname: getProposalRelatedController.toname.text,
                            countryname: getProposalRelatedController.country.text,
                            zipname: getProposalRelatedController.zip.text,
                            statename: getProposalRelatedController.state.text,
                            cityname: getProposalRelatedController.city.text,
                            addressname: getProposalRelatedController.address.text,
                            emailname: getProposalRelatedController.tomail.text,
                            phonename: getProposalRelatedController.phone.text,
                            status: status,currencyname: currency,

                          ));
                        },
                        bgcolor: appcolor,
                        bordercolor: appcolor,
                        text: 'NEXT',
                      ),
                    ),
                    SizedBox(
                      height: 5.0.hp,
                    )
                  ],
                ),
              ),
            );
          }
        }));
  }
}
