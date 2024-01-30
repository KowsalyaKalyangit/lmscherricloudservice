import 'package:flutter_analog_clock/flutter_analog_clock.dart';

import '../../../allpackages.dart';
import '../../../controller/map_track_time_controller.dart';

class TrackPageData extends StatefulWidget {
  const TrackPageData({super.key});

  @override
  State<TrackPageData> createState() => _TrackPageDataState();
}

class _TrackPageDataState extends State<TrackPageData> {
  MapTrackTimeController mapTrackTimeController=Get.put(MapTrackTimeController());
   final GlobalKey<AnalogClockState> _analogClockKey = GlobalKey();
  
  @override
  void initState() {
   mapTrackTimeController.mapTrackTimeController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   
    return  Column(
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
  //       Obx((){
          
  //         if(mapTrackTimeController.isMaptimeLoad.value){
  //           return Center(child: CircularProgressIndicator(),);
  //         }
  //         else if(mapTrackTimeController.getmaptimedetails[0].data.isEmpty){
  //           return Center(child: Text('No data Found'),);
  //         }
  //         else{
  //        return Container(
  //         height: 20.0.hp,

  //          child: ListView.builder(
  //           itemCount: 1,
  //            itemBuilder: (context,index) {
  //             var data=mapTrackTimeController.getmaptimedetails[0].data[index];
  //             var dateTime = DateTime.parse(data.starting.date.toString());
  //           var dateformat=DateFormat('EEEE, MMM d,yyyy').format(dateTime);
  //           var dateTime1 = DateTime.parse(data.destination.date.toString());
  //           var dateformat1=DateFormat('EEEE, MMM d,yyyy').format(dateTime1);
         
  //              return Column(
  //                 children: [
  //                   Container(
                  
  //                 height: 9.0.hp,
  //                 width: 90.0.wp,
  //                 child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   crossAxisAlignment: CrossAxisAlignment.center,
  //                   children: [
                  
  //                 Text(dateformat,style: listtitle,),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.center,
                    
  //                   children: [  Text('Track on: ',style:formhintstylesize,),  SizedBox(width: 1.0.wp,), Text(data.starting.time.toString(),style: formhintstylesize,),],)
                  
                  
  //                   ],
  //                 ),
  //               ),
  //                    // SizedBox(height: 2.0.hp,),
  //                    Container(
  //                 height: 8.0.hp,
  //                 width: 90.0.wp,
  //                 child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   crossAxisAlignment: CrossAxisAlignment.center,
  //                   children: [
  //                 Text(dateformat1,style: listtitle,),
  //                  // Text(dateTime.day.toString(),style: listtitle,),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.center,
                    
  //                   children: [Text('Track off: ',style: formhintstylesize,), SizedBox(width: 1.0.wp,), Text(mapTrackTimeController.getmaptimedetails[0].data[0].destination.time.toString(),style: formhintstylesize,)],)
                  
                  
  //                   ],
  //                 ),
  //               ),
  //                 ],
  //               );
  //            }
  //          ),
  //        );
  // }})
  //kowwssiiiiiiiiiiii
      ],
    );
  }
}

