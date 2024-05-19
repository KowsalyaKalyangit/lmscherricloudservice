import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/controller/map_start_stoop_controller.dart';

import 'package:leadingmanagementsystem/service/map_service.dart';
import 'package:leadingmanagementsystem/utils/common_variable.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';

 
import '../../utils/textstyles.dart';

import 'package:flutter_background_service/flutter_background_service.dart';

 
import 'package:intl/intl.dart';
Location location = Location();
LocationData? currentLocation;

DateTime now = DateTime.now();

String stAddress = '';

class MovingPage extends StatefulWidget {
  const MovingPage({super.key});

  @override
  State<MovingPage> createState() => _MovingPageState();
}

class _MovingPageState extends State<MovingPage> with WidgetsBindingObserver{
  var button1;
  var button2;
  bool mapvalue = true;
MapStartStopController mapStartStopController=Get.put(MapStartStopController());
  @override
  void initState() {
     WidgetsBinding.instance.addObserver(this);
     mapStartStopController.mapStartStopController();
    super.initState();
  }

  @override
  void dispose() {
   WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
   // this will be loop after back from openAppSettings()
   // and when calling requestPermission();
    print('#didChangeApplifeCycleState $state');
    
    if (state == AppLifecycleState.detached) {
      setState(() {
         mapStartStopController.getmapstartstop[0].data[0].trackstatus = '0';
      });
      print('#didChangeApplifeCycleState state is resume');
       
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: appcolor,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back,color: screenbackground,)),
        title: Text('Tracking',style: toptitleStyle,),
      ),
      body: Obx((){
        if(mapStartStopController.isMaptStartStopLoad.value){
          return Center(child: CircularProgressIndicator(),);
        }
     else if(mapStartStopController.getmapstartstop.isEmpty){
      return Center(child: Text('No data Found'),);
     }
else{
      
      
       return Column(
          children: [
            //TrackPageData(),
            mapStartStopController.getmapstartstop[0].data[0].trackstatus == "1"
                ? InkWell(
                    onTap: () async {
                      if (await Permission.location.request().isGranted) {
          setState(() {
                       mapStartStopController.getmapstartstop[0].data[0].trackstatus = '0';
                      });
                      }
                    
        
                      final service = FlutterBackgroundService();
                      var isRunning = await service.isRunning();
        
                      service.startService();
        
                      setState(() {});
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Container(
                          height: 5.0.hp,
                          width: 30.0.wp,
                          decoration: BoxDecoration(
                              color: Colors.green[400],
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                              child: Text(
                            'START',
                            style: toptitleStyle,
                          ))),
                    ))
                : InkWell(
                    onTap: () async {
                      final service = FlutterBackgroundService();
                      var isRunning = await service.isRunning();
                      setState(() {
                    mapStartStopController.getmapstartstop[0].data[0].trackstatus = '1';
                      });
        
                      service.invoke("stopService");
        
                      var userLocation = await location.getLocation();
                      SharedPreferences sharedPreferences =
                          await SharedPreferences.getInstance();
                      var staffid =
                          sharedPreferences.getString(Constants.staffid);
         var now = new DateTime.now();
            var formatter =   DateFormat('yyyy-MM-dd');
            DateTime currentTime = new DateTime.now();
            String formattedDate = formatter.format(now);
            print(formattedDate); // 2016-01-25
                      setState(() {
                        String convertedDateTimestop =
                            "${now.year.toString()}:${now.month.toString().padLeft(2, '0')}:${now.day.toString().padLeft(2, '0')} ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}";
                        MapTrackService().mapTrackService(
                            latitude: userLocation.latitude,
                            longitude: userLocation.longitude,
                            time: '${currentTime}',
                            flag: 'stAddress',
                            logout: 'stop');
                      });
        
                      Fluttertoast.showToast(msg: 'TRACK OFF SUCCESSFULLY');
                      setState(() {});
                    },
                    child: Container(
                        height: 5.0.hp,
                        width: 30.0.wp,
                        decoration: BoxDecoration(
                            color: logocolor,
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                            child: Text(
                          'STOP',
                          style: toptitleStyle,
                        ))))
          ],
         );
  }})
    );
  }
}
