import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:video_conferencing_app/Authentication/navigateauth.dart';
import 'package:video_conferencing_app/variables.dart';
class IntroAuthScreen extends StatelessWidget {
  const IntroAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Welcome",
          body: "Welcome To APP, your own video conferencing app",
          decoration: PageDecoration(
            bodyTextStyle: mystyle(20, Colors.black),
            titleTextStyle: mystyle(20, Colors.black),
          ),
          // image: Center(
          //   child: Image.asset(),
          // )
        ),

        PageViewModel(
          title: "Join or create new meeting",
          body: "Easy-to-use Interface",
          decoration: PageDecoration(
            bodyTextStyle: mystyle(20, Colors.black),
            titleTextStyle: mystyle(20, Colors.black),
          ),
          // image: Center(
          //   child: Image.asset(),
          // )
        ),
        PageViewModel(
          title: "Security",
          body: "Secured meetings",
          decoration: PageDecoration(
            bodyTextStyle: mystyle(20, Colors.black),
            titleTextStyle: mystyle(20, Colors.black),
          ),
          // image: Center(
          //   child: Image.asset(),
          // )
        ),
      ],
      onDone: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context)=>NavigateAuth())
        );
      },
      onSkip: (){},
      showSkipButton: true,
      skip: const Icon(Icons.skip_next),
      next: const Icon(Icons.arrow_forward),
      done: Text(
          "Done",
          style: mystyle(20,Colors.black)
      ),
    );
  }
}
