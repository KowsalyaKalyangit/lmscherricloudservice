import 'package:flutter/material.dart';
import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/utils/colors.dart';
import 'package:leadingmanagementsystem/utils/textstyles.dart';
import 'package:leadingmanagementsystem/view/assign/leadprofile.dart';
import 'package:leadingmanagementsystem/view/assign/task/reminderpage.dart';
import 'package:leadingmanagementsystem/view/audio_record/get_note_details.dart';

import '../../controller/attachment_details_controller.dart';

import '../activit_screen.dart';
import '../proposal/get_proposal_page.dart';
import 'attachement_screen.dart';

import '../audio_record/note_page.dart';
import 'proposal_page.dart';
import 'task/get_task.dart';

class LeadsDetailsPage extends StatefulWidget {
  const LeadsDetailsPage({super.key, this.name, this.id});
  final String? name;
  final String? id;
  @override
  State<LeadsDetailsPage> createState() => _LeadsDetailsPageState();
}

class _LeadsDetailsPageState extends State<LeadsDetailsPage>
    with TickerProviderStateMixin {
  TabController? _tabController;
  AttchamentLeadsDetailsController attchamentLeadsDetailsController =
      AttchamentLeadsDetailsController();

  @override
  void initState() {
// TODO: implement initState
    super.initState();
    _tabController = new TabController(length: 7, vsync: this);
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  trackfunc() {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Alert Dialog Box"),
        content: const Text("You have raised a Alert Dialog Box"),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Container(
              color: Colors.green,
              padding: const EdgeInsets.all(14),
              child: const Text("okay"),
            ),
          ),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appcolor,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            color: screenbackground,
          ),
        ),
        title: Text(
          widget.name!,
          style: toptitleStyle,
        ),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.all(15.0),
        //     child: InkWell(
        //         onTap: (){
        //           trackfunc();
        //         },
        //         child: Icon(Icons.location_on_outlined,color: logocolor,)),
        //   )
        // ],
      ),
      body: Column(
        
        children: <Widget>[
        Container(
          height: 8.0.hp,
          width: 100.0.wp,
          child: TabBar(
         
            tabs: [
              Container(
                height: 5.0.hp,
                width: 13.0.wp,
                child: new Text(
                  'Profile',
                  style: listtitle,
                ),
              ),
              Container(
                height: 5.0.hp,
                width: 17.0.wp,
                child: new Text(
                  'Proposal',
                  style: listtitle,
                ),
              ),
              Container(
                height: 5.0.hp,
                width: 10.0.wp,
                child: new Text(
                  'Tasks',
                  style: listtitle,
                ),
              ),
              Container(
                height: 5.0.hp,
                width: 21.0.wp,
                child: new Text(
                  'Attachment',
                  style: listtitle,
                ),
              ),
              Container(
                height: 5.0.hp,
                width: 21.0.wp,
                child: new Text(
                  'Reminder',
                  style: listtitle,
                ),
              ),
              Container(
                height: 5.0.hp,
                width: 12.0.wp,
                child: new Text(
                  'Notes',
                  style: listtitle,
                ),
              ),
              Container(
                height: 5.0.hp,
                width: 25.0.wp,
                child: new Text(
                  'Activity Log',
                  style: listtitle,
                ),
              ),
            ],
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.blue,
            labelColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 2.0,
            indicatorPadding: EdgeInsets.all(10),
            isScrollable: true,
            controller: _tabController,
          ),
        ),
        Expanded(
          child: TabBarView(controller: _tabController, children: <Widget>[
            LeadProfilePage(id: widget.id.toString()),
            ProposalGetPage(id: widget.id.toString()),
            TaskPage(
              id: widget.id.toString(),
            ),
            AttachmentScreen(
              id: widget.id.toString(),
            ),
            ReminderScreen(id: widget.id.toString()),
            RecordingScreen(
              id: widget.id.toString(),
            ),
            ActivityScreen(id: widget.id.toString())
          ]),
        )
      ]),
    );
  }
}
