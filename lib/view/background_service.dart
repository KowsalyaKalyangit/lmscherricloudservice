import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';

import 'package:leadingmanagementsystem/service/map_service.dart';

import 'dart:async';
import 'dart:developer';
import 'dart:ui';

Future<void> initializeService() async {
  final service = FlutterBackgroundService();

  await service.configure(
    androidConfiguration: AndroidConfiguration(
      // this will be executed when app is in foreground or background in separated isolate
      onStart: onStart,
      // auto start service
      autoStart: false,
      isForegroundMode: true,
    ),
    iosConfiguration: IosConfiguration(
      // auto start service
      autoStart: true,

      // this will be executed when app is in foreground in separated isolate
      onForeground: onStart,

      // you have to enable background fetch capability on xcode project
    ),
  );
}

@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
  // Only available for flutter 3.0.0 and later
  DartPluginRegistrant.ensureInitialized();

  if (service is AndroidServiceInstance) {
    service.on('setAsForeground').listen((event) {
      log("foreground listen--->$event");
      service.setAsForegroundService();
    });

    service.on('setAsBackground').listen((event) {
      log("background listen--->$event");
      service.setAsBackgroundService();
    });
  }

  service.on('stopService').listen((event) {
    log("stopservice listen--->$event");
    service.stopSelf();
  });
  //bring to foreground
  Timer.periodic(const Duration(seconds: 5), (timer) async {
    Position? currentPosition;
    DateTime now = DateTime.now();
    var convertedDateTimestop =
        "${now.year.toString()}:${now.month.toString().padLeft(2, '0')}:${now.day.toString().padLeft(2, '0')} ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}";

    if (service is AndroidServiceInstance) {
      if (await service.isForegroundService()) {
        final hasPermission = await handleLocationPermission();
        if (hasPermission) {
          await Geolocator.getCurrentPosition().then((Position position) {
            currentPosition = position;
          }).catchError((e) {
            log(e);
          });
        }
      }
    }
    if (currentPosition != null) {
      /// you can see this log in logcat
      log('FLUTTER BACKGROUND SERVICE: ${DateTime.now()}');
      service.invoke(
        'update',
        {
          "current_date":
              '${DateTime.now().day} ${DateTime.now().hour}${DateTime.now().second}',
          "device": currentPosition != null
              ? currentPosition?.latitude.toString()
              : currentPosition != null
                  ? currentPosition?.longitude.toString()
                  : currentPosition != null
                      ? convertedDateTimestop.toString()
                      : "not get",
        },
      );
      //await SharedPreferencesHelper.init();
      // var pref = await SharedPreferences.getInstance();
      // var bookingId = pref.getString(Constants.bookingId);
      // await StepperService.locationService(
      //     bookingId: bookingId!, location: currentPosition!);

      await MapTrackService().mapTrackService(
          latitude: currentPosition!.latitude.toString(),
          longitude: currentPosition!.longitude.toString(),
          time: convertedDateTimestop.toString(),
          flag: 'address',
          logout: 'start');
    }
  });
}

Future<bool> handleLocationPermission() async {
  bool serviceEnabled;
  LocationPermission permission;
  try {
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Fluttertoast.showToast(
          msg: 'Location services are disabled. Please enable the services');

      return false;
    }
    permission = await Geolocator.checkPermission();

    log("permission--->$serviceEnabled/$permission");
    if (permission == LocationPermission.denied) {
      Fluttertoast.showToast(msg: 'Location permissions are denied');
      return false;
    }
    if (permission == LocationPermission.deniedForever) {
       serviceEnabled = await Geolocator.isLocationServiceEnabled(); //kowsi
      Fluttertoast.showToast(
          msg:
              'Location permissions are permanently denied, we cannot request permissions.');
      return false;
    }
    return true;
  } catch (e) {
    log("geo_err--->${e.toString()}");
    Fluttertoast.showToast(msg: e.toString());
    return false;
  }
}

Future<bool> verifyLocationPermission() async {
  bool serviceEnabled;
  LocationPermission permission;
  try {
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      log('Location services are disabled. Please enable the services');
      Fluttertoast.showToast(
          msg: 'Location services are disabled. Please enable the services');

      return false;
    }
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      log('Location permissions are denied');
      Fluttertoast.showToast(msg: 'Location permissions are denied');

      await Geolocator.openAppSettings();
      await Geolocator.openLocationSettings();
      return false;
    }
    if (permission == LocationPermission.deniedForever) {
      log('Location permissions are permanently denied, we cannot request permissions');
      Fluttertoast.showToast(
          msg:
              'Location permissions are permanently denied, we cannot request permissions.');
      return false;
    }
    return true;
  } catch (e) {
    log("geo_err--->${e.toString()}");
    Fluttertoast.showToast(msg: e.toString());
    return false;
  }
}
