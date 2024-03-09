import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:video_conferencing_app/Screens/profile.dart';
import 'package:video_conferencing_app/Screens/videocall.dart';
import 'package:video_conferencing_app/variables.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int page = 0;
  List pageoptions = [
    VideoConference(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[250],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        selectedLabelStyle: mystyle(17,Colors.blue),
        unselectedItemColor: Colors.black,
        unselectedLabelStyle: mystyle(17,Colors.black),
        currentIndex: page,
        onTap: (index){
          setState(() {
            page = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.video_call_rounded,size: 32),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.person_2_sharp,size: 32),
          ),
        ],
      ),
      body: pageoptions[page],
    );
  }
}
