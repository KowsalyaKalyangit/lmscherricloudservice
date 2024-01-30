import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/controller/activity_log_controller.dart';
import 'package:intl/intl.dart';
import 'package:leadingmanagementsystem/utils/textstyles.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key,this.id});
final String ? id;

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  ActivityController activityController = Get.put(ActivityController());
  int currentStep = 0;
  @override
  void initState() {
    activityController.notificationController(leadid:widget.id.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (activityController.isactivityLoad.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (activityController.getnotification[0].data.isEmpty) {
          return Center(
            child: Text('No data Found'),
          );
        } else {
          return ListView.builder(
            itemCount: activityController.getnotification[0].data.length,
            itemBuilder: (BuildContext context, int index) {
              var item = activityController.getnotification[0].data[index];
              var date = DateFormat('yyyy-MM-dd').format(item.date);
              //DateTime myDate = DateTime.now().subtract(Duration(days: date.));
              var demo = item.date;
              return Stepper(
                steps: [
                  Step(
                    title: Text(
                      date.toString(),
                      style: listtitlefont,
                    ),
                    content: Row(
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: appcolor,
                          child: Icon(
                            Icons.person,
                            color: screenbackground,
                          ),
                        ),
                        SizedBox(
                          width: 3.0.wp,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.staff.toString(),
                              style: listtitlefont,
                            ),
                            Container(
                                width: 60.0.wp,
                                child: Text(
                                  item.description.toString(),
                                  style: formhintstyle,
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
                controlsBuilder: (context, controller) {
                  return SizedBox.shrink();
                },
              );
            },
          );
        }
      }),
    );
  }
}
