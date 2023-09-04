import 'package:animate_do/animate_do.dart';
import 'package:firebase_order_processing_app/utils/constant.dart';
import 'package:flutter/material.dart';

class Create_Order extends StatefulWidget {
  const Create_Order({super.key});

  @override
  State<Create_Order> createState() => _Create_OrderState();
}

class _Create_OrderState extends State<Create_Order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppContant.appName),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SizedBox(
                height: 15.0,
              ),
              FadeInLeft(
                duration: Duration(milliseconds: 1800),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Product Name",
                      labelText: "Product Name",
                      prefixIcon: Icon(Icons.production_quantity_limits),
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
                  decoration: InputDecoration(
                      hintText: "Client Name",
                      labelText: "Client Name",
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
                  decoration: InputDecoration(
                      hintText: "Client Address",
                      labelText: "Client Address",
                      prefixIcon: Icon(Icons.add),
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
                  decoration: InputDecoration(
                      hintText: "Client Mobile Number",
                      labelText: "Client Mobile Number",
                      prefixIcon: Icon(Icons.mobile_friendly),
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
                  decoration: InputDecoration(
                      hintText: "Buy Price",
                      labelText: "Buy Price",
                      prefixIcon: Icon(Icons.price_change),
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
                  decoration: InputDecoration(
                      hintText: "Sale Price",
                      labelText: "Sale Price",
                      prefixIcon: Icon(Icons.price_change_rounded),
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
                  decoration: InputDecoration(
                      hintText: "Sale Date",
                      labelText: "Sale Date",
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
          ElevatedButton(
              onPressed: () {},
              child: Text('Create Order'))
            ],
          ),
        ),
      ),
    );
  }
}

