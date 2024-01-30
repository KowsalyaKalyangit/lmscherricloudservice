import 'dart:developer';

import 'package:leadingmanagementsystem/controller/add_leads_controller.dart';
import 'package:leadingmanagementsystem/utils/textstyles.dart';

import '../../allpackages.dart';
import '../../controller/lead_profile_controller.dart';
import '../../utils/signup_button.dart';

class LeadProfilePage extends StatefulWidget {
  const LeadProfilePage({super.key, this.id});
  final String? id;

  @override
  State<LeadProfilePage> createState() => _LeadProfilePageState();
}

class _LeadProfilePageState extends State<LeadProfilePage> {
  var status = ['Inprogress', 'Pending', 'Completed'];
  var type = ['Pet', 'Pet+', 'Hydraulic'];
  var specificationname = ['MS MTD', 'MS ACO', 'SS ACO'];
  var floors = ['G+2', 'G+3+', 'G+4', 'G+5'];
  var selectedindex = 1;
  var selectedindexfloor = 1;
  var selectedindexspecification = 2;
  AddAssignDetailsController addAssignDetailsController =
      Get.put(AddAssignDetailsController());
  LeadsprofileController leadProfileController =
      Get.put(LeadsprofileController());
  var dropdownvalue;
  String countryname= "India";
  @override
  void initState() {
    fetchdata();
    super.initState();
  }

  fetchdata() async {
    log('dkfnjdshfjksl');
   
    leadProfileController.leadprofileController();
    addAssignDetailsController.getCountry().then((value) {
      setState(() {
        countryname = addAssignDetailsController
            .getprofileUpdatecountry[0].data[0].countryId;
      });
    });
    addAssignDetailsController.getStatus().then((value) {
      statusname = addAssignDetailsController.getstatusLead[0].data[0].id;
    });
    addAssignDetailsController.getSourceLeads().then((value) {
      sourcename = addAssignDetailsController.getSourceLead[0].data[0].id;
    });
  }

  var statusname;
  var sourcename;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (leadProfileController.isLeadsProfileLoad.value ||
            addAssignDetailsController.isCountryLoading.value ||
            addAssignDetailsController.isStatusLoading.value ||
            addAssignDetailsController.isSourceLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (leadProfileController.getleadprofile.isEmpty ||
            addAssignDetailsController.getprofileUpdatecountry.isEmpty ||
            addAssignDetailsController.getstatusLead.isEmpty ||
            addAssignDetailsController.getstatusLead.isEmpty) {
          return Center(
            child: Text('No data found'),
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
                  SizedBox(
                    height: 1.0.hp,
                  ),
                  Text(
                    'Name',
                    style: listtitle,
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
                      controller: leadProfileController.name,
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
                                color: const Color(0xffC6C6C6).withOpacity(0.5),
                                width: 1),
                          ),
                          fillColor: const Color(0xffC6C6C6),
                          hintText: 'Enter your name ',
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
                    'Position',
                    style: listtitle,
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
                      controller: leadProfileController.position,
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
                                color: const Color(0xffC6C6C6).withOpacity(0.5),
                                width: 1),
                          ),
                          fillColor: const Color(0xffC6C6C6),
                          hintText: 'Enter your position',
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
                  Text(
                    'Email',
                    style: listtitle,
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
                      controller: leadProfileController.email,
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
                                color: const Color(0xffC6C6C6).withOpacity(0.5),
                                width: 1),
                          ),
                          fillColor: const Color(0xffC6C6C6),
                          hintText: 'Enter your email',
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
                    'Mobile Number',
                    style: listtitle,
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
                      controller: leadProfileController.phonenumber,
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
                                color: const Color(0xffC6C6C6).withOpacity(0.5),
                                width: 1),
                          ),
                          fillColor: const Color(0xffC6C6C6),
                          hintText: 'Enter your Mobile Number',
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
                    'Leads value',
                    style: listtitle,
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
                      controller: leadProfileController.leadsvalue,
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
                                color: const Color(0xffC6C6C6).withOpacity(0.5),
                                width: 1),
                          ),
                          fillColor: const Color(0xffC6C6C6),
                          hintText: 'Enter leads value',
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
                  Text(
                    'Company name',
                    style: listtitle,
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
                      controller: leadProfileController.companyName,
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
                                color: const Color(0xffC6C6C6).withOpacity(0.5),
                                width: 1),
                          ),
                          fillColor: const Color(0xffC6C6C6),
                          hintText: 'Enter your Company name',
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
                    'Description',
                    style: listtitle,
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
                      controller: leadProfileController.des,
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
                                color: const Color(0xffC6C6C6).withOpacity(0.5),
                                width: 1),
                          ),
                          fillColor: const Color(0xffC6C6C6),
                          hintText: 'description',
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
                    'Address',
                    style: listtitle,
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
                      controller: leadProfileController.address,
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
                                color: const Color(0xffC6C6C6).withOpacity(0.5),
                                width: 1),
                          ),
                          fillColor: const Color(0xffC6C6C6),
                          hintText: 'Enter your address',
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
                    'City',
                    style: listtitle,
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
                      controller: leadProfileController.city,
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
                                color: const Color(0xffC6C6C6).withOpacity(0.5),
                                width: 1),
                          ),
                          fillColor: const Color(0xffC6C6C6),
                          hintText: 'Enter your city',
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
                    'State',
                    style: listtitle,
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
                      controller: leadProfileController.state,
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
                                color: const Color(0xffC6C6C6).withOpacity(0.5),
                                width: 1),
                          ),
                          fillColor: const Color(0xffC6C6C6),
                          hintText: 'Enter your state',
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
                    'Country',
                    style: listtitle,
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
                              value: countryname,
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
                              onChanged: (newValue) {
                                setState(() {
                                  if (newValue != null) {
                                   countryname =
                                        newValue.toString();
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
                                              value.countryName
                                                    ,
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
                    ],
                  ),
                  SizedBox(
                    height: 1.0.hp,
                  ),
                  Text(
                    'Zip Code',
                    style: listtitle,
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
                      controller: leadProfileController.zip,
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
                                color: const Color(0xffC6C6C6).withOpacity(0.5),
                                width: 1),
                          ),
                          fillColor: const Color(0xffC6C6C6),
                          hintText: 'Enter your zipcode',
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
                    'Status',
                    style: listtitle,
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
                              value: statusname,
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
                                    statusname = newValue.toString();
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
                              items: addAssignDetailsController
                                      .getstatusLead[0].data.isEmpty
                                  ? []
                                  : addAssignDetailsController
                                      .getstatusLead[0].data
                                      .map<DropdownMenuItem<String>>((value) {
                                      return DropdownMenuItem<String>(
                                        value: value.id.toString(),
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
                    ],
                  ),
                  SizedBox(
                    height: 1.0.hp,
                  ),
                  SizedBox(
                    height: 1.0.hp,
                  ),
                  Text(
                    'Source',
                    style: listtitle,
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
                              value: sourcename,
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
                                    sourcename = newValue.toString();
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
                              items: addAssignDetailsController
                                      .getstatusLead[0].data.isEmpty
                                  ? []
                                  : addAssignDetailsController
                                      .getSourceLead[0].data
                                      .map<DropdownMenuItem<String>>((value) {
                                      return DropdownMenuItem<String>(
                                        value: value.id.toString(),
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
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ButtonIconButton(
                      press: () async {
                        //  if(addAssignDetailsController.name.text.isEmpty){
                        //   Fluttertoast.showToast(msg: 'please enter all fields');

                        //  }
                        //  else{
                        //  }
                      },
                      bgcolor: appcolor,
                      bordercolor: appcolor,
                      text: 'Update',
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
      }),
    );
  }
}
