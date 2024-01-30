import 'package:leadingmanagementsystem/allpackages.dart';

import 'package:leadingmanagementsystem/service/map_service.dart';
import 'package:leadingmanagementsystem/utils/common_variable.dart';
import 'package:location/location.dart';

import '../../utils/textstyles.dart';

import 'package:flutter_background_service/flutter_background_service.dart';

import 'dashboard/track_time.dart';

Location location = Location();
LocationData? currentLocation;

DateTime now = DateTime.now();

String stAddress = '';

class MovingPage extends StatefulWidget {
  const MovingPage({super.key});

  @override
  State<MovingPage> createState() => _MovingPageState();
}

class _MovingPageState extends State<MovingPage> {
  var button1;
  var button2;
  bool mapvalue = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
      body: Column(
        children: [
          TrackPageData(),
          commonVariable.mapdata == 0
              ? InkWell(
                  onTap: () async {
                    setState(() {
                      commonVariable.mapdata = 1;
                    });

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
                      commonVariable.mapdata = 0;
                    });

                    service.invoke("stopService");

                    var userLocation = await location.getLocation();
                    SharedPreferences sharedPreferences =
                        await SharedPreferences.getInstance();
                    var staffid =
                        sharedPreferences.getString(Constants.staffid);

                    setState(() {
                      String convertedDateTimestop =
                          "${now.year.toString()}:${now.month.toString().padLeft(2, '0')}:${now.day.toString().padLeft(2, '0')} ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}";
                      MapTrackService().mapTrackService(
                          latitude: userLocation.latitude,
                          longitude: userLocation.longitude,
                          time: convertedDateTimestop.toString(),
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
      ),
    );
  }
}
