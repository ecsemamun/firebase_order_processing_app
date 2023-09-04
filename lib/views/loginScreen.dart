import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_order_processing_app/utils/constant.dart';
import 'package:firebase_order_processing_app/views/Forgot_Password.dart';
import 'package:firebase_order_processing_app/views/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

import 'HomeScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  bool obscureText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppContant.appName),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Get.changeTheme(
                    Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
              },
              icon: Icon(Icons.dark_mode)),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                width: 500.0,
                height: 350.0,
                child: Lottie.network(
                    'https://lottie.host/a13ed014-d17c-4ceb-a740-1991abf4acbe/ORjfacKcFK.json',
                    fit: BoxFit.cover),
              ),
              FadeInLeft(
                duration: Duration(milliseconds: 1800),
                child: TextFormField(
                  controller: loginEmailController,
                  decoration: InputDecoration(
                      hintText: "Email",
                      labelText: "Email",
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              FadeInRight(
                duration: Duration(milliseconds: 1800),
                child: TextFormField(
                  controller: loginPasswordController,
                  obscureText: obscureText,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                      hintText: "Password",
                      labelText: "Password",
                      prefixIcon: Icon(Icons.password),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                        child: obscureText
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => Forgot_Password());
                },
                child: Container(
                    alignment: Alignment.topRight,
                    child: Text(
                      "Forgot Password",
                      style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    )),
              ),
              SizedBox(
                height: 15.0,
              ),
              FadeInUp(
                  duration: Duration(milliseconds: 1800),
                  child: ElevatedButton(
                      onPressed: () async {
                        var loginEmail = loginEmailController.text.trim();
                        var loginPassword = loginPasswordController.text.trim();

                        try {
                          final User? firebaseUser = (await FirebaseAuth
                                  .instance
                                  .signInWithEmailAndPassword(
                                      email: loginEmail,
                                      password: loginPassword))
                              .user;
                          if (firebaseUser != null) {
                            Get.to(() => HomeScreen());
                          } else {
                            print("Check Email & Password");
                          }
                        } on FirebaseAuthException catch (e) {
                          print("Error $e");
                        }
                      },
                      child: Text('Login'))),
              SizedBox(
                height: 15.0,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => SignUp());
                },
                child: Container(
                    child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Don't have an account Signup"),
                  ),
                )),
              ),
              SizedBox(
                height: 15.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
