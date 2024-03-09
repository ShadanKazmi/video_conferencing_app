import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:jitsi_meet_fix/feature_flag/feature_flag_enum.dart' as prefix;
import 'package:jitsi_meet_fix/jitsi_meet.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:video_conferencing_app/variables.dart';

class JoinMeet extends StatefulWidget {
  const JoinMeet({super.key});

  @override
  State<JoinMeet> createState() => _JoinMeetState();
}

class _JoinMeetState extends State<JoinMeet> {
  TextEditingController roomcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  bool isaudiomuted = true;
  bool isvideooff = true;
  String username = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getuserdata();
  }

  getuserdata() async{
    DocumentSnapshot userdoc = await usercollection.doc(FirebaseAuth.instance.currentUser?.uid).get();
    setState(() {
      Map<String, dynamic> userData = userdoc.data() as Map<String, dynamic>;
      // username = userdoc.data()!['username'];
      username = userData['username'];
    });
  }

  joinmeet() async{
    try{
      Map<FeatureFlagEnum,bool> featureflags = {
        FeatureFlagEnum.WELCOME_PAGE_ENABLED: false
      };
      if(Platform.isAndroid){
        featureflags[FeatureFlagEnum.CALL_INTEGRATION_ENABLED] = false;
      }else if(Platform.isIOS){
        featureflags[FeatureFlagEnum.PIP_ENABLED] = false;
      }
      // var options = JitsiMeetingOptions(
      //   room: roomcontroller.text,
      // );
      var options = JitsiMeetingOptions(room: roomcontroller.text)
      ..userDisplayName = namecontroller.text == '' ? username : namecontroller.text
      ..audioMuted = isaudiomuted
      ..videoMuted = isvideooff
      ..featureFlags.addAll(featureflags);

      await JitsiMeet.joinMeeting(options);
    } catch(e){
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 24),
              Text(
                "Room code",
                style: mystyle(20),
              ),
              SizedBox(height: 20),
              PinCodeTextField(
                  length: 6,
                 autoDisposeControllers: false,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.underline,
                ),
                animationDuration: Duration(milliseconds: 300),
                onChanged: (value){},
                appContext: context,
              ),
              SizedBox(height: 10),
              TextField(
                controller: namecontroller,
                style: mystyle(20),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Name (leave blank if you want your username)",
                  labelStyle: mystyle(15),
                ),
              ),
              SizedBox(height: 16),
              CheckboxListTile(
                  value: isvideooff,
                  onChanged: (value){
                    setState(() {
                      isvideooff = value!;
                    });
                  },
                  title: Text(
                    "Video Off",
                    style: mystyle(18,Colors.black),
                  ),
              ),
              SizedBox(height: 16),
              CheckboxListTile(
                value: isaudiomuted,
                onChanged: (value){
                  setState(() {
                    isaudiomuted = value!;
                  });
                },
                title: Text(
                  "Audio Muted",
                  style: mystyle(18,Colors.black),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Customise settings",
                style: mystyle(15),
                textAlign: TextAlign.center,
              ),
              Divider(
                height: 48,
                thickness: 2.0,
              ),
              InkWell(
                onTap: ()=> joinmeet(),
                child: Container(
                  width: double.maxFinite,
                  height: 64,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: GradientColors.facebookMessenger,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Join Meeting",
                      style: mystyle(20,Colors.white),

                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
