import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/controller/dashboard_controller.dart';
import 'package:leadingmanagementsystem/controller/notification_controller.dart';
import 'package:leadingmanagementsystem/utils/textstyles.dart';
import 'package:leadingmanagementsystem/view/home/dashboard/converted_leads.dart';
import 'package:leadingmanagementsystem/view/home/dashboard/not_converted.dart';
import 'package:leadingmanagementsystem/view/home/dashboard/pending_leads.dart';
import 'package:leadingmanagementsystem/view/home/dashboard/renewable.dart';
import 'package:leadingmanagementsystem/view/home/graph_page.dart';
import 'package:leadingmanagementsystem/view/home/map.dart';
import 'package:location/location.dart';

import '../assign/lead_assign.dart';
import 'dashboard/image_slider.dart';
import 'dashboard_leads.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var leads=['CONVERTED LEADS','NOT CONVERTED','PENDING','RENEWABLE'];
  var name;
   GoogleMapController? _mapController;
    Location _location = Location();
  LatLng _currentLocation = LatLng(0, 0); 
    Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  var menus=[
    ConvertedLeadsPage(),
    
    PendingLeadsPage(),
    RenewableLeadsPage()
    
    
  ];
  DashboardController dashboardController=Get.put(DashboardController());
  
  @override
  void initState() {
   dashboardController.dashboardController();
  // _initLocationService();
    super.initState();
  }
   Future<void> _initLocationService() async {
    final _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      final _serviceRequest = await _location.requestService();
      if (_serviceRequest != PermissionStatus.granted) {
        return;
      }
    }

    final _permissionStatus = await _location.hasPermission();
    if (_permissionStatus == PermissionStatus.denied) {
      final _permissionRequest = await _location.requestPermission();
      if (_permissionRequest != PermissionStatus.granted) {
        return;
      }
    }

    _location.onLocationChanged.listen((LocationData locationData) {
      
        _currentLocation = LatLng(locationData.latitude ?? 0.0, locationData.longitude ?? 0.0);
        _mapController?.animateCamera(CameraUpdate.newLatLng(_currentLocation));//setstate removed
      
    });
   
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      appBar: AppBar(
      automaticallyImplyLeading: false,
        backgroundColor: appcolor,
        toolbarHeight: 13.0.hp,
        leadingWidth: 20.0.wp,
        leading: Padding(
          padding: const EdgeInsets.only(left:13.0),
          child: Image.asset('assets/images/logowhite.png'),
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text('Professional Elevators',style:toptitleStyle,),
          Text('Pvt. Ltd',style:toptitleStyle,)],
        ),
        actions: [
          InkWell(
            onTap: () {
             
     
   
//     showDialog(
//   context: context,
//   builder: (_) => new AlertDialog(
//      insetPadding: EdgeInsets.only(top: 5),
//           contentPadding: EdgeInsets.zero,
//   shape: RoundedRectangleBorder(
//     borderRadius:
//       BorderRadius.all(
//         Radius.circular(10.0))),
//       actions: [
        
//          Center(child: InkWell(
//           onTap: () {
//             setState(() {
//               print('click');
//               Get.back();
//             });
//           },
//           child: Container(height: 10.0.hp,width: 40.0.wp,color:Colors.tealAccent,)))],
//     content: StatefulBuilder(
//       builder: (context,setstate) {
//         // Get available height and width of the build area of this widget. Make a choice depending on the size.                              
        

//         return Container(
//           height:90.0.hp,
//           width: 100.0.wp,
//           child: Padding(
//               padding: EdgeInsets.only(bottom:2.0.hp),
//             child: GoogleMap(
//                    markers: markers.values.toSet(),
//                   mapType: MapType.normal,
//                   initialCameraPosition: CameraPosition(
//             target: _currentLocation,
//             zoom: 15.0,
//                   ),
//                   onMapCreated: (GoogleMapController controller) {
//             setState(() {
//               _mapController = controller;
//             });
                 
//                   },
//                   myLocationEnabled: true,
//                   myLocationButtonEnabled: true,
                  
//                 ),
//           ),
//         );
//       },
//     ),
//   )
// );
Get.to(MovingPage());
//Get.to(MapScreen());

  
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.location_on,size: 30,),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Obx((){
          if(dashboardController.isDashboardLoad.value){
            return Center(child: CircularProgressIndicator(),);

          }
          else if(dashboardController.getdashboarddetails.isEmpty){
            return Center(child: Text('No data Found'),);
          }
          else{
         return Column(
          
            children: [
                     ImageSliderHome(),
              //Text('Leading Management Software',style: heading,),
            Text("No of Leads: ${dashboardController.getdashboarddetails[0].totalLeads.toString()}",style: toptitlelogoStyle,),
              SizedBox(height: 2.0.hp,),
            
              Padding(
                padding: const EdgeInsets.only(left:10,right: 10),
                child: Container(
                  height: 20.0.hp,
                  width: 100.0.wp,
                  decoration: BoxDecoration(
                    color: appcolor,
                    borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 1.0.hp,),
                        Container(
                          
                          height: 15.0.hp,width: 100.0.wp,child: GridView.builder(  
                          physics: NeverScrollableScrollPhysics(),
                    itemCount: dashboardController.getdashboarddetails[0].data.length,  
                               gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 900 / 3,
                            childAspectRatio: 9 / 2.90,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 5),
                    itemBuilder: (BuildContext context, int index){  
                      return InkWell(
                        onTap: () {
                         Get.to(ConvertedLeadsPage(
                          name:dashboardController.getdashboarddetails[0].data[index].name.toString(),
                          index:index,statusid:dashboardController.getdashboarddetails[0].data[index].id.toString()));
                          
                        },
                        child: Card(
                                         shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                                        ),
                          color: logocolor,
                          child: Center(child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(dashboardController.getdashboarddetails[0].data[index].name.toString(),style: subtitleStylecolor,),
                                Text(dashboardController.getdashboarddetails[0].data[index].total.toString(),style: subtitleStylecolor,),
                            ],
                          ),),
                        ),
                      );  
                    },  
                              )),  
                              SizedBox(height: 2.0.hp,),

                
                    ]
                    ),
                  ),
                
            )
            ),
                             
                             
SizedBox(height: 1.0.hp,),
                                          
      BarChartExample(),
           Padding(
      padding: const EdgeInsets.only(left:15,right: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         
Text('Leads List',style: listtitle,),
SizedBox(height: 1.0.hp,),
Container(height: 5.0.hp,width: 100.0.wp,decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: appcolor),child: Padding(
  padding: const EdgeInsets.only(left:15,right: 10),
  child:   Row(
    
    children: [
      Container(
        width: 27.0.wp,
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
      dashboardController.getdashboarddetails[0].leadslist.isEmpty?Center(child: Image.asset('assets/images/nodata.png',height: 15.0.hp,)):   Container(
            height: 13.0.hp,
            width: 100.0.wp,
            child: Card(
               shape: RoundedRectangleBorder(
                    
                    borderRadius: BorderRadius.circular(5.0),
                    ),
              child: ListView.builder(
                itemCount: dashboardController
                                                    .getdashboarddetails[0].leadslist.length <=
                                                3
                                            ? dashboardController
                                                .getdashboarddetails[0].leadslist.length
                                            : 3,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context,leadindex){
                  var leaddata=dashboardController.getdashboarddetails[0].leadslist[leadindex];
                  leadindex=leadindex+1;
                  
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
        child: Text(leadindex.toString(),style: listview,)),
      Container(
        width: 28.0.wp,
        child: Text(leaddata.name,style: listview,)),
         Container(
          width: 30.0.wp,
          child: Text(leaddata.status!,style: formhintstylecolor,)),
  
    ],
  ),
),
                );
              }),
            ),
          ),
        ],
      ),
    ),
    SizedBox(height: 1.0.hp,),
                                          
           
             
            ]);
  }}),
      ));
        
       
     
  }
}