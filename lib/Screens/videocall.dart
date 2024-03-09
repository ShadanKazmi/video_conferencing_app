import 'package:flutter/material.dart';
import 'package:video_conferencing_app/VideoCall/createmeet.dart';
import 'package:video_conferencing_app/VideoCall/joinmeet.dart';
import 'package:video_conferencing_app/variables.dart';

class VideoConference extends StatefulWidget {
  const VideoConference({super.key});

  @override
  State<VideoConference> createState() => _VideoConferenceState();
}

class _VideoConferenceState extends State<VideoConference> with SingleTickerProviderStateMixin{
  late TabController tabcontroller;
  buildTab(String name){
    return Container(
      width: 150,
      height: 50,
      child: Card(
        child: Center(
          child: Text(
            name,
            style: mystyle(15,Colors.black,FontWeight.w700),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabcontroller = TabController(length: 2, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
        title: Text(
          "App",
          style: mystyle(20,Colors.white,FontWeight.w700),
        ),
        bottom: TabBar(
          controller: tabcontroller,
          tabs: [
            buildTab("Join Meeting"),
            buildTab("Create Meeting"),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabcontroller,
        children: [
          JoinMeet(),
          CreateMeet(),
        ],
      ),
    );
  }
}
