import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:udemyclone/Screens/HomeScreens/Account.dart';
import 'package:udemyclone/Screens/HomeScreens/Featured.dart';
import 'package:udemyclone/Screens/HomeScreens/MyCourses.dart';
import 'package:udemyclone/Screens/HomeScreens/Search.dart';
import 'package:udemyclone/Screens/HomeScreens/Whishlist.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController = PageController();
  int currentIndex = 0;
  FirebaseMessaging _firebaseMessaging;
  String _message = "Genrate";
  void onTap(int page) {
    setState(() {
      currentIndex = page;
    });
    pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      _firebaseMessaging.configure(
          onLaunch: (Map<String, dynamic> message) async {
        setState(() {
          _message = message['title'];
        });
      }, onResume: (Map<String, dynamic> message) async {
        setState(() {
          _message = message['title'];
        });
      }, onMessage: (Map<String, dynamic> message) async {
        setState(() {
          _message = message['title'];
        });
      });
      _firebaseMessaging.getToken().then((value) {
        print(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        controller: pageController,
        children: [Featured(), Search(), MyCourses(), Wishlist(), Account()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        backgroundColor: Colors.grey.shade900,
        selectedIconTheme: IconThemeData(color: Colors.redAccent),
        iconSize: 26.0,
        selectedFontSize: 12.0,
        unselectedFontSize: 10.0,
        unselectedItemColor: Colors.white,
        currentIndex: currentIndex,
        unselectedIconTheme: IconThemeData(color: Colors.white),
        unselectedLabelStyle: TextStyle(color: Colors.white12),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.star_border), label: "Featured"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.play_circle_fill), label: "My courses"),
          BottomNavigationBarItem(
              icon: Icon(EvaIcons.heartOutline), label: "Whishlist"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_sharp), label: "Account"),
        ],
      ),
    );
  }
}
