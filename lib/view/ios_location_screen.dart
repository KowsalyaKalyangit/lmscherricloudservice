import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';
import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/service/map_service.dart';
import 'package:leadingmanagementsystem/utils/colors.dart';
import 'package:leadingmanagementsystem/utils/textstyles.dart';
 
import 'package:permission_handler/permission_handler.dart';
import 'package:carp_background_location/carp_background_location.dart';
import 'package:intl/intl.dart';

import '../controller/map_start_stoop_controller.dart';
import 'map/map_page.dart';
 

class IosLocationScreen extends StatefulWidget {
  @override
  _IosLocationScreenState createState() => _IosLocationScreenState();
}

enum LocationStatus { UNKNOWN, INITIALIZED, RUNNING, STOPPED }

class _IosLocationScreenState extends State<IosLocationScreen> {
  String logStr = '';
  LocationDto? _lastLocation;
  StreamSubscription<LocationDto>? locationSubscription;
  LocationStatus _status = LocationStatus.UNKNOWN;
  MapStartStopController mapStartStopController =
      Get.put(MapStartStopController());
        final GlobalKey<AnalogClockState> _analogClockKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    mapStartStopController.mapStartStopController();

    LocationManager().interval = 1;
    LocationManager().distanceFilter = 0;
    LocationManager().notificationTitle = 'CARP Location Example';
    LocationManager().notificationMsg = 'CARP is tracking your location';

    _status = LocationStatus.INITIALIZED;
  }

  void getCurrentLocation() async =>
      onData(await LocationManager().getCurrentLocation());

  onData(LocationDto location) {
    print('>> $location');
     String convertedDateTimestop =
                            "${now.year.toString()}:${now.month.toString().padLeft(2, '0')}:${now.day.toString().padLeft(2, '0')} ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}";
    MapTrackService().mapTrackService(
        latitude: location.latitude.toString(),
        longitude: location.longitude.toString(),
        time: convertedDateTimestop.toString(),
        flag: 'address',
        logout: 'start');
    setState(() {
      _lastLocation = location;
    });
  }

  /// Is "location always" permission granted?
  Future<bool> isLocationAlwaysGranted() async =>
      await Permission.locationAlways.isGranted;

  /// Tries to ask for "location always" permissions from the user.
  /// Returns `true` if successful, `false` otherwise.
  Future<bool> askForLocationAlwaysPermission() async {
    bool granted = await Permission.locationAlways.isGranted;

    if (!granted) {
      granted =
          await Permission.locationAlways.request() == PermissionStatus.granted;
    }

    return granted;
  }

  /// Start listening to location events.
  void start() async {
    // ask for location permissions, if not already granted
    if (!await isLocationAlwaysGranted())
      await askForLocationAlwaysPermission();

    locationSubscription?.cancel();
    locationSubscription = LocationManager().locationStream.listen(onData);
    await LocationManager().start();
     mapStartStopController.getmapstartstop[0].data[0].trackstatus ='0';
    setState(() {
      _status = LocationStatus.RUNNING;
    });
  }

  void stop() async{
    locationSubscription?.cancel();
    LocationManager().stop();
    
                      SharedPreferences sharedPreferences =
                          await SharedPreferences.getInstance();
                            var userLocation = await location.getLocation();
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
    setState(() {
      _status = LocationStatus.STOPPED;
    });
  }

  Widget stopButton() => SizedBox(
        
        child: InkWell(
          
          child: Container(
             height: 5.0.hp,
                        width: 30.0.wp,
                        decoration: BoxDecoration(
                            color: logocolor,
                            borderRadius: BorderRadius.circular(5)),
            child: Center(child:   Text('STOP',  style: toptitleStyle,))),
          onTap: (){
            stop();
            setState(() {
                    mapStartStopController.getmapstartstop[0].data[0].trackstatus = '1';
                      });
          },
        ),
      );

  Widget startButton() => SizedBox(
        
        child: InkWell(
         
          child: Container(
             height: 5.0.hp,
                        width: 30.0.wp,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(5)),
            
            child:   Center(child: Text('START',  style: toptitleStyle,))),
          onTap: (){
            start();
          setState(() {
              mapStartStopController.getmapstartstop[0].data[0].trackstatus ='0';
          });
          },
        ),
      );

  Widget statusText() => Text("Status: ${_status.toString().split('.').last}");

  Widget currentLocationButton() => SizedBox(
        width: double.maxFinite,
        child: ElevatedButton(
          child: const Text('CURRENT LOCATION'),
          onPressed: getCurrentLocation,
        ),
      );

  Widget locationWidget() {
    if (_lastLocation == null)
      return Text("No location yet");
    else
      return Column(
        children: <Widget>[
          Text(
            '${_lastLocation!.latitude}, ${_lastLocation!.longitude}',
          ),
          Text(
            '@',
          ),
          Text(
              '${DateTime.fromMillisecondsSinceEpoch(_lastLocation!.time ~/ 1)}')
        ],
      );
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) {
    return   Obx(() {
          if (mapStartStopController.isMaptStartStopLoad.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (mapStartStopController.getmapstartstop.isEmpty) {
            return Center(
              child: Text('No data Found'),
            );
          } else {
            return Container(
              width: double.maxFinite,
              padding: const EdgeInsets.all(22),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  
                  children: <Widget>[
                     SizedBox(height: 30.0.hp,),
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
        SizedBox(height: 5.0.hp,),
                 mapStartStopController.getmapstartstop[0].data[0].trackstatus == "1"?     startButton():
                  
                    stopButton(),
                    //currentLocationButton(),
                    // Divider(),
                    // statusText(),
                    //Divider(),
                    // locationWidget(),
                  ],
                ),
              ),
            );
          }
        });
  }
}
