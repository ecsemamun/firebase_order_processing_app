import 'package:animate_do/animate_do.dart';
import 'package:firebase_order_processing_app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'Create_New_Order.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppContant.appName),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(() =>Create_Order());
            },
            child: Container(
              margin: EdgeInsets.only(right: 10.0),
              child: CircleAvatar(
                radius: 15.0,
                child: Icon(Icons.add_business),
              ),
            ),
          ),
          IconButton(onPressed: () {
           Get.changeTheme(
             Get.isDarkMode ? ThemeData.light() : ThemeData.dark()
           );
          },
              icon: Icon(Icons.dark_mode))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(child: Text('MA'),),
                accountName: Text("Md Abdulla Al Mamun"),
                accountEmail: Text('mamunkazigp@gmail.com')),
            ListTile(
              title: Text('Home'),
              leading: Icon(Icons.home),
              trailing: Icon(Icons.arrow_circle_right),
            ),
            ListTile(
              title: Text('Add New Order'),
              leading: Icon(Icons.add_business),
              trailing: Icon(Icons.arrow_circle_right),
            ),
            ListTile(
              title: Text('Info'),
              leading: Icon(Icons.info),
              trailing: Icon(Icons.arrow_circle_right),
            ),
            Divider(
              height: 3.0,
              color: Colors.grey,
            ),
            ListTile(
              title: Text('Help'),
              leading: Icon(Icons.help),
              trailing: Icon(Icons.arrow_circle_right),
            ),
          ],
        ),
      ),
      body: Container(
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
            itemCount: 20,
            itemBuilder: (context, index) {
              return Card(
                child: FadeInLeft(
                  duration: Duration(milliseconds: 2000),
                  child: ListTile(
                    title: Text("Order Number 01"),
                    subtitle: Text('Pending', style: TextStyle(color: Colors.green),),
                    leading: CircleAvatar(
                      child: Text(index.toString()),
                    ),
                    trailing: CircleAvatar(
                      child: Icon(
                        Icons.edit
                      ),
                    ),
                  ),
                ),
              );
            }
        )
      ),
    );
  }
}
