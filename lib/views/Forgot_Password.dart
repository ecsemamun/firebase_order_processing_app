import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_order_processing_app/utils/constant.dart';
import 'package:firebase_order_processing_app/views/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

import 'loginScreen.dart';

class Forgot_Password extends StatefulWidget {
  const Forgot_Password({super.key});

  @override
  State<Forgot_Password> createState() => _Forgot_PasswordState();
}

class _Forgot_PasswordState extends State<Forgot_Password> {
  TextEditingController forgetPasswordController = TextEditingController();

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
                height: 300.0,
                child: Lottie.network(
                    'https://assets6.lottiefiles.com/packages/lf20_bnofreve.json',
                    fit: BoxFit.cover),
              ),
              SizedBox(
                height: 15.0,
              ),
              FadeInLeft(
                duration: Duration(milliseconds: 1800),
                child: TextFormField(
                  controller: forgetPasswordController,
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
              FadeInUp(
                  duration: Duration(milliseconds: 1800),
                  child: ElevatedButton(
                      onPressed: () async {
                        var forgotEmail = forgetPasswordController.text.trim();
                        try {
                          await FirebaseAuth.instance
                              .sendPasswordResetEmail(email: forgotEmail)
                              .then((value) => {
                                    print("Email Sent!"),
                                    Fluttertoast.showToast(
                                        msg:
                                            'Please Check your mail inbox or spam folder'),
                                    Get.off(() => LoginScreen()),
                                  });
                        } on FirebaseAuthException catch (e) {
                          print("Error $e");
                        }
                      },
                      child: Text('Forgot Password'))),
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
