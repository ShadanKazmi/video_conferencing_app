import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:video_conferencing_app/Authentication/signup.dart';

import '../variables.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
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
                  SizedBox(height: 50),
                  Container(
                    width: MediaQuery.of(context).size.width/2,
                    child: TextField(
                      style: mystyle(18,Colors.black),
                      keyboardType: TextInputType.emailAddress,
                      controller: emailcontroller,
                      decoration: InputDecoration(
                        hintText: "Email",
                        prefixIcon: Icon(Icons.email),
                        hintStyle: mystyle(20,Colors.grey,FontWeight.w700)
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width/2,
                    child: TextField(
                      style: mystyle(18,Colors.black),
                      keyboardType: TextInputType.visiblePassword,
                      controller: passwordcontroller,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Password",
                          prefixIcon: Icon(Icons.lock),
                          hintStyle: mystyle(20,Colors.grey,FontWeight.w700)
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  InkWell(
                    onTap: (){
                      try{
                        int count = 0;
                        FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: emailcontroller.text,
                            password: passwordcontroller.text,
                        );
                        Navigator.popUntil(context, (route){
                          return count++ == 2;
                        });
                      }catch(e){
                        print(e);
                        var snackbar = SnackBar(content: Text(e.toString(), style: mystyle(20),));
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      }
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width/2,
                      height: 45,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: GradientColors.beautifulGreen,
                          ),
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Center(
                        child: Text(
                          "Sign-In",
                          style: mystyle(25, Colors.white),
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
