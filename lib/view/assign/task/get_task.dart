 
import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/utils/textstyles.dart';

import '../../../controller/tasks_get_controller.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key,this.id});
  final String ?id;

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  var selectedindex;
   TasksGetController tasksGetController = Get.put(TasksGetController());

   @override
  void initState() {
     tasksGetController.tasksGetController(leadid: widget.id.toString());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Obx((){
      if(tasksGetController.isTasksGetLoad.value){
        return Center(child:CircularProgressIndicator(),);
      }
      else if(tasksGetController.getleadsdetails[0].data.isEmpty){
        return Center(child: Text('No data Found'),);
      }
  return Padding(
            padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 8),
            child: ListView.builder(
              itemCount: tasksGetController.getleadsdetails[0].data.length,
              itemBuilder: (context,index){
                var data=tasksGetController.getleadsdetails[0].data[index];
              return Stack(
                children: [
                  Container(
                    height: 20.0.hp,
                    width: 100.0.wp,
                     
                    child: Card(
                      color: appcolor,
                      shape: RoundedRectangleBorder(
                        
                        borderRadius: BorderRadius.circular(05)
                      ),
                      child: Row(children: [
                        
                         
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Row(
                              
                              children: [
                                Text("Name :",style: listtitlecolor,),  Text(data.name,style: listtitlecolor,),
                            ],),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Row(
                              
                              children: [
                                Text("Start Date : ",style: listtitlecolor,),  Text(data.startdate,style: listtitlecolor,),
                            ],),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Row(
                              
                              children: [
                                Text("Due Date : ",style: listtitlecolor,),   Text(data. duedate,style: listtitlecolor,),
                            ],),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Row(
                              
                              children: [
                                Text("Assigned to : ",style: listtitlecolor,),   Text(data.assignedby,style: listtitlecolor,),
                            ],),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Row(
                              
                              children: [
                                Text("Priorty : ",style: listtitlecolor,),   Text(data.priority,style: listtitlecolor,),
                            ],),
                          ),
    //                         CustomPaint(
    //   size: Size(355, 1), // Size of the line
    //   painter: DottedLinePainter(),
    // ),
                             
                             
                                
                          ],
                        )
                      ],),
                    )
                    
                    ),
                    Positioned(
                      right: 10,
                      top: 8,
                      child: Container(
                        height: 4.0.hp,
                        width: 25.0.wp,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: data.status=='Final Status'?Colors.green[900]:
                        data.status=='Proposal Submited'?Colors.amber[900]:
                        Colors.red.shade400),
                        child: Center(
                          child: Text(data.status
                            ,style: statusstyle,),
                        ),
                      ),
                    )
                ],
              );
            }),
          );
  });
   
  }
}
class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final dashWidth = 4;
    final dashSpace = 5;
    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}