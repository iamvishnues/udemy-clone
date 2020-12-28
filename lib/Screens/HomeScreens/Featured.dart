import 'dart:ui';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:udemyclone/Screens/DetailSection/DetailScreen.dart';
import 'package:udemyclone/Screens/MyList.dart';
import 'package:udemyclone/Services/DataController.dart';

class Featured extends StatefulWidget {
  @override
  _FeaturedState createState() => _FeaturedState();
}

class _FeaturedState extends State<Featured> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(""),
        actions: [
          IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () {
                Get.to(MyList());
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Brighten your future",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        "Explore new interests",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
                height: 180,
                width: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage("images/banner.jpg"),
                      fit: BoxFit.cover),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Container(
                width: MediaQuery.of(context).size.width - 2,
                height: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomLeft,
                      colors: [Color(0xFF036589), Color(0xFF0D2B3C)]),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Courses now on sale",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                    Text(
                      "1 day left!",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 22, left: 10.0, bottom: 12),
              child: Text(
                "Featured",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w800),
              ),
            ),
            SizedBox(
              height: 290,
              width: 400,
              child: GetBuilder<DataController>(
                init: DataController(),
                builder: (value) {
                  return FutureBuilder(
                    future: value.getData('featured'),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.black,
                          ),
                        );
                      } else {
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(DetailedScreen(),
                                      transition:
                                          Transition.leftToRightWithFade,
                                      arguments: snapshot.data[index]);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 12),
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 100,
                                          width: 180,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.contain,
                                                  image: NetworkImage(snapshot
                                                      .data[index]
                                                      .data()['image']))),
                                        ),
                                        Container(
                                          constraints:
                                              BoxConstraints(maxWidth: 180),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0),
                                            child: snapshot.data[index]
                                                        .data()['title']
                                                        .length <
                                                    47
                                                ? Text(
                                                    snapshot.data[index]
                                                            .data()['title']
                                                            .substring(0, 40) +
                                                        "...",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )
                                                : Text(
                                                    snapshot.data[index]
                                                            .data()['title']
                                                            .substring(0, 42) +
                                                        "...",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                            // Text(
                                            //     snapshot.data[index]
                                            //             .data()['title']
                                            //             .substring(0, 48) +
                                            //         "...",
                                            //     style:
                                            //         TextStyle(color: Colors.white),
                                            //   ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8.0, bottom: 8.0),
                                          child: Text(
                                            snapshot.data[index]
                                                .data()['author'],
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 13),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              EvaIcons.star,
                                              size: 16,
                                              color: Colors.orangeAccent,
                                            ),
                                            Icon(
                                              EvaIcons.star,
                                              size: 16,
                                              color: Colors.orangeAccent,
                                            ),
                                            Icon(
                                              EvaIcons.star,
                                              size: 16,
                                              color: Colors.orangeAccent,
                                            ),
                                            Icon(
                                              EvaIcons.star,
                                              size: 16,
                                              color: Colors.orangeAccent,
                                            ),
                                            Icon(
                                              EvaIcons.star,
                                              size: 16,
                                              color: Colors.orangeAccent,
                                            ),
                                            Text(
                                              snapshot.data[index]
                                                  .data()['ratings'],
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 13),
                                            ),
                                            Text(
                                              ('(${snapshot.data[index].data()['enrolled']})'),
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 13),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              snapshot.data[index]
                                                  .data()['price'],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Text(
                                              snapshot.data[index]
                                                  .data()['notPrice'],
                                              style: TextStyle(
                                                  color: Colors.white70,
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  fontSize: 12),
                                            ),
                                          ],
                                        ),
                                        snapshot.data[index].data()['tag'] ==
                                                "Bestseller"
                                            ? Container(
                                                height: 25,
                                                width: 80,
                                                decoration: BoxDecoration(
                                                    color: Colors
                                                        .orangeAccent.shade100,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 3.0,
                                                          left: 3.0,
                                                          right: 3.0),
                                                  child: Text(
                                                    snapshot.data[index]
                                                        .data()['tag'],
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15),
                                                  ),
                                                ),
                                              )
                                            : Container(
                                                height: 25,
                                                width: 110,
                                                decoration: BoxDecoration(
                                                    color: Colors
                                                        .deepOrange.shade300,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 3.0,
                                                          left: 3.0,
                                                          right: 3.0),
                                                  child: Text(
                                                    snapshot.data[index]
                                                        .data()['tag'],
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15),
                                                  ),
                                                ),
                                              )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      }
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0, left: 10.0, bottom: 15),
              child: Text(
                "Top courses in Development",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w800),
              ),
            ),
            SizedBox(
              height: 290,
              width: 400,
              child: GetBuilder<DataController>(
                init: DataController(),
                builder: (value) {
                  return FutureBuilder(
                    future: value.getData('top'),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.black,
                          ),
                        );
                      } else {
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 12),
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 100,
                                        width: 180,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.contain,
                                                image: NetworkImage(snapshot
                                                    .data[index]
                                                    .data()['image']))),
                                      ),
                                      Container(
                                        constraints:
                                            BoxConstraints(maxWidth: 180),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10.0),
                                          child: snapshot.data[index]
                                                      .data()['title']
                                                      .length <
                                                  47
                                              ? Text(
                                                  snapshot.data[index]
                                                          .data()['title']
                                                          .substring(0, 40) +
                                                      "...",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                )
                                              : Text(
                                                  snapshot.data[index]
                                                          .data()['title']
                                                          .substring(0, 42) +
                                                      "...",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                          // Text(
                                          //     snapshot.data[index]
                                          //             .data()['title']
                                          //             .substring(0, 48) +
                                          //         "...",
                                          //     style:
                                          //         TextStyle(color: Colors.white),
                                          //   ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, bottom: 8.0),
                                        child: Text(
                                          snapshot.data[index].data()['author'],
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 13),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            EvaIcons.star,
                                            size: 16,
                                            color: Colors.orangeAccent,
                                          ),
                                          Icon(
                                            EvaIcons.star,
                                            size: 16,
                                            color: Colors.orangeAccent,
                                          ),
                                          Icon(
                                            EvaIcons.star,
                                            size: 16,
                                            color: Colors.orangeAccent,
                                          ),
                                          Icon(
                                            EvaIcons.star,
                                            size: 16,
                                            color: Colors.orangeAccent,
                                          ),
                                          Icon(
                                            EvaIcons.star,
                                            size: 16,
                                            color: Colors.orangeAccent,
                                          ),
                                          Text(
                                            snapshot.data[index]
                                                .data()['ratings'],
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 13),
                                          ),
                                          Text(
                                            ('(${snapshot.data[index].data()['enrolled']})'),
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 13),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            snapshot.data[index]
                                                .data()['price'],
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                            snapshot.data[index]
                                                .data()['notPrice'],
                                            style: TextStyle(
                                                color: Colors.white70,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      snapshot.data[index].data()['tag'] ==
                                              "Bestseller"
                                          ? Container(
                                              height: 25,
                                              width: 80,
                                              decoration: BoxDecoration(
                                                  color: Colors
                                                      .orangeAccent.shade100,
                                                  borderRadius:
                                                      BorderRadius.circular(3)),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 3.0,
                                                    left: 3.0,
                                                    right: 3.0),
                                                child: Text(
                                                  snapshot.data[index]
                                                      .data()['tag'],
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15),
                                                ),
                                              ),
                                            )
                                          : Container(
                                              height: 25,
                                              width: 110,
                                              decoration: BoxDecoration(
                                                  color: Colors
                                                      .deepOrange.shade300,
                                                  borderRadius:
                                                      BorderRadius.circular(3)),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 3.0,
                                                    left: 3.0,
                                                    right: 3.0),
                                                child: Text(
                                                  snapshot.data[index]
                                                      .data()['tag'],
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15),
                                                ),
                                              ),
                                            )
                                    ],
                                  ),
                                ),
                              );
                            });
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
