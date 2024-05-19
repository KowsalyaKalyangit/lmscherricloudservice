import 'package:flutter_analog_clock/flutter_analog_clock.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:leadingmanagementsystem/controller/map_start_stoop_controller.dart';
import 'package:leadingmanagementsystem/service/map_service.dart';
import 'package:leadingmanagementsystem/utils/textstyles.dart';
 
import 'package:intl/intl.dart';
import 'package:leadingmanagementsystem/view/map/map_page.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../allpackages.dart';
import '../../utils/common_variable.dart';
 

class TrackPageData extends StatefulWidget {
  const TrackPageData({super.key});

  @override
  State<TrackPageData> createState() => _TrackPageDataState();
}

class _TrackPageDataState extends State<TrackPageData> with WidgetsBindingObserver {
  
   final GlobalKey<AnalogClockState> _analogClockKey = GlobalKey();
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
   
    return  Obx((){
       if(mapStartStopController.isMaptStartStopLoad.value){
          return Center(child: CircularProgressIndicator(),);
        }
     else if(mapStartStopController.getmapstartstop.isEmpty){
      return Center(child: Text('No data Found'),);
     }
else{
      return Column(
         mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10.0.hp,),
        Center(
          child: Container(
            height: 25.0.hp,
        
            child: AnalogClock.dark(
              // markingColor: Colors.amber[800],
              // hourHandColor: logocolor,
              // minuteHandColor: logocolor,
              // centerPointColor: logocolor,
              secondHandColor: logocolor,
              key: _analogClockKey,
              
              dateTime:  DateTime.now(),
              isKeepTime: true,
            
            ),
          ),
        ),
        SizedBox(height: 4.0.hp,),
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
  }});
  }
}

