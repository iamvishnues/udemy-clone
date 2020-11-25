import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:page_transition/page_transition.dart';
import 'SigninOptions/signin.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MaterialButton(
              child: Text(
                "Browse",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {},
            ),
            MaterialButton(
              child: Text("Signin", style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        child: SignIn(), type: PageTransitionType.bottomToTop));
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 90,
          ),
          Center(
            child: SizedBox(
                height: 280,
                width: 400,
                // child: Image.asset(
                //   "images/landingPageBg.png",
                //   fit: BoxFit.fitHeight,
                //   colorBlendMode: BlendMode.darken,
                //   color: Colors.black45,
                // ),
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(38.0),
                      child: Container(
                        height: 150,
                        width: 350,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            image: DecorationImage(
                                image: AssetImage("images/swipe${index}.jpg"),
                                fit: BoxFit.cover)),
                      ),
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  autoplay: true,
                  itemHeight: 800,
                  itemWidth: 400,
                  pagination:
                      SwiperPagination(alignment: Alignment.bottomCenter),
                  viewportFraction: 0.8,
                  scale: 0.4,
                )),
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            "Take Video Courses",
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.w800),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Text(
                  "From cooking to coding ",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  "and everything in between",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
