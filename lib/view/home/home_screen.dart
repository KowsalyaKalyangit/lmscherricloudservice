// import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:leadingmanagementsystem/view/menu/menu_screen.dart';
import 'package:location/location.dart';

import '../../allpackages.dart';
import '../../utils/bootom_nav.dart';

import '../assign/leadpage.dart';
import '../notification/notification_screen.dart';
import 'home_page.dart';
import 'package:geolocator/geolocator.dart';

// import 'package:background_location/background_location.dart' hide Location;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.now();
  bool modalShown = false;
  GoogleMapController? _mapController;
  Location _location = Location();
  LatLng _currentLocation = LatLng(0, 0);
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  String stAddress = '';
  String latitude = 'waiting...';
  String longitude = 'waiting...';
  String altitude = 'waiting...';
  String accuracy = 'waiting...';
  String bearing = 'waiting...';
  String speed = 'waiting...';
  String time = 'waiting...';

  var listdata = [];
  var listdata1 = [];
  List<double> currentLocation = [];
  List<double> currentLocationlon = [];
  late Position currentpositon;
  var merge = [];
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  int _currentIndex = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final List<Map<String, Widget>> _pages = [
    {
      'page': const HomePage(),
    },
    {
      'page': const LeadPage(),
    },
    // {
    //   'page': const DetailsPage(),
    // },
    {
      'page': const NotificationScreen(),
    },
    {
      'page': const MenuScreen(),
    },
  ];
  @override
  void initState() {
    _initLocationService();
    // _checkIfModalShouldBeShown();
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
      setState(() {
        _currentLocation =
            LatLng(locationData.latitude ?? 0.0, locationData.longitude ?? 0.0);
        _mapController?.animateCamera(CameraUpdate.newLatLng(_currentLocation));
      });
    });
  }

  _checkIfModalShouldBeShown() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool shouldShowModal = prefs.getBool('shouldShowModal') ?? true;

    if (shouldShowModal) {
      _showModal();
      prefs.setBool('shouldShowModal', false);
    }
  }

  _showModal() {
    // Show your modal here
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              insetPadding: EdgeInsets.only(top: 5),
              contentPadding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              actions: [
                Center(
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            print('click');
                            //fun();
                            Get.back();
                          });
                        },
                        child: Container(
                          height: 4.0.hp,
                          width: 40.0.wp,
                          decoration: BoxDecoration(
                              color: teal,
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Text('Track on'),
                          ),
                        )))
              ],
              content: StatefulBuilder(
                builder: (context, setState) {
                  // Get available height and width of the build area of this widget. Make a choice depending on the size.

                  return Container(
                    height: 90.0.hp,
                    width: 100.0.wp,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 2.0.hp),
                      child: GoogleMap(
                        markers: markers.values.toSet(),
                        mapType: MapType.normal,
                        initialCameraPosition: CameraPosition(
                          target: _currentLocation,
                          zoom: 15.0,
                        ),
                        onMapCreated: (GoogleMapController controller) {
                          setState(() {
                            _mapController = controller;
                          });
                        },
                        myLocationEnabled: true,
                        myLocationButtonEnabled: true,
                      ),
                    ),
                  );
                },
              ),
            ));
  }

//   fun() async{

//  await BackgroundLocation.setAndroidNotification(
//                       title: 'Background service is running',
//                       message: 'Background location in progress',
//                       icon: '@mipmap/ic_launcher',
//                     );

//                     //await BackgroundLocation.setAndroidConfiguration(1000);
//                     await BackgroundLocation.startLocationService(
//                         distanceFilter: 20);
//                     BackgroundLocation.getLocationUpdates((_location) {
//                       setState(() async{

//                         latitude = _location.latitude.toString();
//                         longitude = _location.longitude.toString();
//                         accuracy = _location.accuracy.toString();
//                         altitude = _location.altitude.toString();
//                         bearing = _location.bearing.toString();
//                         speed = _location.speed.toString();
//                         time = DateTime.fromMillisecondsSinceEpoch(
//                                 _location.time!.toInt())
//                             .toString();

//                       });
//                       print('''\n
//                         Latitude:  $latitude
//                         Longitude: $longitude
//                         Altitude: $altitude
//                         Accuracy: $accuracy
//                         Bearing:  $bearing
//                         Speed: $speed
//                         Time: $time

//                       ''');
//                     });
//                      Position position=await Geolocator.getCurrentPosition();
//     currentpositon=position;
//     LatLng latLngPosition=LatLng(position.latitude,position.longitude);
//     CameraPosition cameraPosition=new CameraPosition(target: latLngPosition,zoom: 14);
//     _mapController!.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
//       final coordinates = new Coordinates(position.latitude, position.longitude);
// debugPrint('coordinates is: $coordinates');

// var addresses =
//     await Geocoder.local.findAddressesFromCoordinates(coordinates);
// var first = addresses.first;

// listdata.add(coordinates);
// listdata1.add(addresses.first);
// print('ccccccccccc');
// print('fffff');
// print(position.speed);
// var newgfgList = [listdata, listdata1].expand((x) => x).toList();

//   // Printing combined list
//   print(newgfgList);
//   if(position.speed==0||position.speed<=10){
//   print('positionnnn');

// }
// else{

//   Timer.periodic(Duration(seconds:5 ), (timer) {
//      print('timmerrrr');
//     // getLocation();
//  // mapTrackcontroller.mapTrackController(latitude: latitude.toString(),longitude: longitude.toString(),time:time,flag: "fast");
//   });
// }

// }
  @override
  Widget build(BuildContext context) {
    //Fluttertoast.showToast(msg: string);
    return WillPopScope(
      onWillPop: Helper.of(context).onWillPop,
      child: Scaffold(
          key: _scaffoldKey,
          //appBar: getappbar(),
          // drawer: Drawer(
          //   backgroundColor: screenbackground,
          //   child: Column(children: [
          //     UserAccountsDrawerHeader(
          //         decoration: BoxDecoration(color: appcolor),
          //         accountName: Text(
          //           'Tony Rajesh',
          //           style: TextStyle(fontSize: 18),
          //         ),
          //         accountEmail: Text(
          //           "tonyrajesh@gmail.com",
          //           style: TextStyle(
          //               color: screenbackground,
          //               decoration: TextDecoration.underline),
          //         ),
          //         //currentAccountPictureSize: Size.square(50),
          //         currentAccountPicture: CircleAvatar(
          //           backgroundImage: AssetImage(
          //             'assets/images/profile.jpg',
          //           ),
          //         )),
          //     ListTile(
          //       leading: const Icon(
          //         Icons.storefront_outlined,
          //         color: toptitlecolor,
          //       ),
          //       title: InkWell(
          //         focusColor: Colors.blue.withOpacity(0.4),
          //         onTap: () {
          //           Get.back();
          //           Get.to(StoreDetailsPage());
          //         },
          //         child: Container(
          //           width: 30.0.w,
          //           child: Text(
          //             'Store',
          //             style: TextStyle(color: Colors.black),
          //           ),
          //         ),
          //       ),
          //     ),
          //     // ListTile(
          //     //   leading: const Icon(
          //     //     Icons.login,
          //     //     color: toptitlecolor,
          //     //   ),
          //     //   title: InkWell(
          //     //     focusColor: Colors.blue.withOpacity(0.4),
          //     //     onTap: () {
          //     //       Get.back();
          //     //     },
          //     //     child: Container(
          //     //       width: 30.0.w,
          //     //       child: Text(
          //     //         'Login',
          //     //         style: TextStyle(color: toptitlecolor),
          //     //       ),
          //     //     ),
          //     //   ),
          //     // ),
          //     ListTile(
          //       leading: const Icon(
          //         Icons.logout_outlined,
          //         color: toptitlecolor,
          //       ),
          //       title: InkWell(
          //         focusColor: Colors.blue.withOpacity(0.4),
          //         onTap: () {
          //           loginController.logout();
          //         },
          //         child: Container(
          //           width: 30.0.w,
          //           child: Text(
          //             'Logout ',
          //             style: TextStyle(color: toptitlecolor),
          //           ),
          //         ),
          //       ),

          //       //UserAccountDrawerHeader
          //     )
          //   ]),
          // ),
          // backgroundColor: bgcolor,
          body: _pages[_currentIndex]['page'],
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(left: 3.0, right: 3, bottom: 5),
            child: BottomNavyBar(
              containerHeight: 70,
              selectedIndex: _currentIndex,
              showElevation: false,
              itemCornerRadius: 24,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              curve: Curves.easeIn,
              onItemSelected: (index) => setState(() => _currentIndex = index),
              items: <BottomNavyBarItem>[
                BottomNavyBarItem(
                  icon: const Icon(
                    Icons.home,
                    size: 20,
                  ),
                  title: Text('Home'),
                  activeColor: appcolor,
                  textAlign: TextAlign.center,
                ),
                BottomNavyBarItem(
                  icon: const Icon(
                    Icons.gamepad_outlined,
                    size: 20,
                  ),
                  title: Text("Leads"),
                  activeColor: appcolor,
                  textAlign: TextAlign.center,
                ),
                BottomNavyBarItem(
                  icon: const Icon(
                    Icons.report_outlined,
                    size: 20,
                  ),
                  title: Text('Notification'),
                  activeColor: appcolor,
                  textAlign: TextAlign.center,
                ),
                BottomNavyBarItem(
                  icon: const Icon(
                    Icons.person_outline,
                    size: 20,
                  ),
                  title: const Padding(
                    padding: EdgeInsets.only(left: 1.0),
                    child: Text('Profile'),
                  ),
                  activeColor: appcolor,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          )),
    );
  }
}

class AddtoCart extends StatefulWidget {
  const AddtoCart({super.key});

  @override
  State<AddtoCart> createState() => _AddtoCartState();
}

class _AddtoCartState extends State<AddtoCart> {
  @override
  Widget build(BuildContext context) {
    return Column();
  }
}

// class MyConnectivity {
//   MyConnectivity._();
//
//   static final _instance = MyConnectivity._();
//   static MyConnectivity get instance => _instance;
//   final _connectivity = Connectivity();
//   final _controller = StreamController.broadcast();
//   Stream get myStream => _controller.stream;
//
//   void initialise() async {
//     ConnectivityResult result = await _connectivity.checkConnectivity();
//     _checkStatus(result);
//     _connectivity.onConnectivityChanged.listen((result) {
//       _checkStatus(result);
//     });
//   }
//
//   void _checkStatus(ConnectivityResult result) async {
//     bool isOnline = false;
//     try {
//       final result = await InternetAddress.lookup('example.com');
//       isOnline = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
//     } on SocketException catch (_) {
//       isOnline = false;
//     }
//     _controller.sink.add({result: isOnline});
//   }
//
//   void disposeStream() => _controller.close();
// }
