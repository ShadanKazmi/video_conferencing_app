import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:video_conferencing_app/Authentication/login.dart';
import 'package:video_conferencing_app/Authentication/signup.dart';
import 'package:video_conferencing_app/variables.dart';

class NavigateAuth extends StatefulWidget {
  const NavigateAuth({super.key});

  @override
  State<NavigateAuth> createState() => _NavigateAuthState();
}

class _NavigateAuthState extends State<NavigateAuth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[250],
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: GradientColors.blue,
              )
            ),
            child: Center(
              child: Image.asset(
                  '',
                  height: 100,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/1.6,
              margin: EdgeInsets.only(left: 30,right: 30),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  )
                ],
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20)
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => Login())),
                    child: Container(
                      width: MediaQuery.of(context).size.width/2,
                      height: 60,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: GradientColors.beautifulGreen,
                        ),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Center(
                        child: Text(
                          "Sign-In",
                          style: mystyle(30, Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  InkWell(
                    onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => Register())),
                    child: Container(
                      width: MediaQuery.of(context).size.width/2,
                      height: 60,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: GradientColors.pink,
                          ),
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Center(
                        child: Text(
                          "Register",
                          style: mystyle(30, Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
