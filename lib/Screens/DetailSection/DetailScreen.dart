import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:udemyclone/Services/PaymentGateway.dart';
import 'package:udemyclone/Services/Videos.dart';

class DetailedScreen extends StatefulWidget {
  @override
  _DetailedScreenState createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              icon: Icon(
                Icons.share,
                color: Colors.white,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.add_shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {})
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                Get.arguments['title'],
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                Get.arguments['Detaileddescription'],
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, left: 8.0, right: 8.0, bottom: 5.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(color: Colors.white54),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Icon(Icons.star,
                                    size: 14, color: Colors.white),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Text(
                                  Get.arguments['ratings'],
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 13,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(color: Colors.white54),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Icon(EvaIcons.people,
                                    size: 14, color: Colors.white),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Text(
                                  "${Get.arguments['enrolled']} Enrolled",
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 13,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(color: Colors.white54),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Icon(Icons.play_arrow_sharp,
                                    size: 14, color: Colors.white),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Text(
                                  " ${Get.arguments['hours']} total hours",
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 13,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10.0,
                      ),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(color: Colors.white54),
                            ),
                            child: Row(
                              children: [
                                // Padding(
                                //   padding: const EdgeInsets.all(3.0),
                                //   child: Icon(Icons.star,
                                //       size: 14, color: Colors.white),
                                // ),
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Text(
                                    "Created by ${Get.arguments['author']}",
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 13,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 13,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(color: Colors.white54),
                            ),
                            child: Row(
                              children: [
                                // Padding(
                                //   padding: const EdgeInsets.all(3.0),
                                //   child: Icon(Icons.star,
                                //       size: 14, color: Colors.white),
                                // ),
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Text(
                                    "Updated ${Get.arguments['updated_on']}",
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 13,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Get.dialog(Container(
                    child: VideoDisplay(
                      videoUrl: Get.arguments['trailer'],
                    ),
                  ));
                },
                child: SizedBox(
                  height: 220,
                  width: 400,
                  child: Stack(
                    children: [
                      Container(
                        height: 200,
                        width: 400,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(Get.arguments['image']),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                    Colors.black38, BlendMode.darken))),
                      ),
                      Positioned(
                        child: Icon(
                          Icons.play_arrow_sharp,
                          color: Colors.white,
                          size: 100,
                        ),
                        top: 50,
                        left: MediaQuery.of(context).size.width / 3,
                      ),
                      Positioned(
                        child: Text(
                          "Preview this course",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w800),
                        ),
                        top: 170,
                        left: MediaQuery.of(context).size.width / 3.6,
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0, bottom: 10),
                    child: Text(
                      "${Get.arguments['price']}.00",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 27,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width - 10,
                  decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(10)),
                  child: GetBuilder<PaymentGateway>(
                    init: PaymentGateway(),
                    builder: (value) {
                      return GestureDetector(
                        onTap: () {
                          value.dispatchPayment(2000, 'Vishnu ES', 9145687652,
                              'esvisoftech@gmail.com', 'GooglePay');
                        },
                        child: Center(
                          child: Text(
                            "Buy Now",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                    },
                  )),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 2.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white12),
                    child: Center(
                        child: Text(
                      "GO TO CART",
                      style: TextStyle(color: Colors.teal),
                    )),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await FirebaseFirestore.instance
                          .collection('wishlist')
                          .add({
                        'title': Get.arguments['title'],
                        'image': Get.arguments['image'],
                        'author': Get.arguments['author'],
                        'ratings': Get.arguments['ratings'],
                        'price': Get.arguments['price'],
                        'notPrice': Get.arguments['notPrice'],
                        'enrolled': Get.arguments['enrolled'],
                      }).whenComplete(() {
                        Get.snackbar('Hurray',
                            "${Get.arguments['title']} is added to your whishlist",
                            colorText: Colors.black,
                            snackPosition: SnackPosition.BOTTOM);
                      });
                    },
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 2.2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white12),
                      child: Center(
                          child: Text(
                        "ADD TO WISHLIST",
                        style: TextStyle(color: Colors.teal),
                      )),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
