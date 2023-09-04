import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_order_processing_app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

import '../services/signup_services.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();
  User? currentUser = FirebaseAuth.instance.currentUser;

  final _formKey = GlobalKey<FormState>();


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
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 500.0,
                  height: 350.0,
                  child: Lottie.network(
                      'https://lottie.host/5ad74580-995e-41de-8f53-8cef4f08326b/sBieBpFBKC.json',
                      fit: BoxFit.cover),
                ),
                FadeInLeft(
                  duration: Duration(milliseconds: 1800),
                  child: TextFormField(
                    controller: userNameController,
                    textInputAction: TextInputAction.next,
                    style: TextStyle(color: Colors.black),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter your Name";
                      } else if (value!.length < 7) {
                        return "Name must be 7 Character";
                      }
                    },
                    decoration: InputDecoration(
                        hintText: "Username",
                        labelText: "Username",
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                FadeInLeft(
                  duration: Duration(milliseconds: 1800),
                  child: TextFormField(
                    controller: userEmailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter your Email Address";
                      } else if (!RegExp(
                          "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                          .hasMatch(value)) {
                        return 'Wrong Email Id Provide';
                      }
                    },
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
                    controller: userPasswordController,
                    obscureText: true,
                    obscuringCharacter: "*",
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter Your Password";
                      } else if (value!.length < 6) {
                        return "Password must be 6 Character";
                      }
                    },
                    decoration: InputDecoration(
                        hintText: "Password",
                        labelText: "Password",
                        prefixIcon: Icon(Icons.password),
                        suffixIcon: Icon(Icons.visibility),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                FadeInUp(
                    duration: Duration(milliseconds: 1800),
                    child: ElevatedButton(
                        onPressed: () async {
                          var userName = userNameController.text.trim();
                          var userEmail = userEmailController.text.trim();
                          var userPassword = userPasswordController.text.trim();

                          await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: userEmail, password: userPassword)
                              .then((value) => {
                                    log("User Created"),
                                    signUpUser(
                                      userName,
                                      userEmail,
                                      userPassword,
                                    ),
                                  });
                          Fluttertoast.showToast(msg: 'Signup Successfully');
                        },

                        child: Text('SignUp'))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
