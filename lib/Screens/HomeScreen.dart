import 'package:eva_icons_flutter/eva_icons_flutter.dart';
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
  void onTap(int page) {
    setState(() {
      currentIndex = page;
    });
    pageController.jumpToPage(page);
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
        selectedFontSize: 15.0,
        unselectedFontSize: 12.0,
        currentIndex: currentIndex,
        unselectedIconTheme: IconThemeData(color: Colors.white),
        unselectedLabelStyle: TextStyle(color: Colors.white),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.star_border), label: "Featured"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.play_circle_fill), label: "MyCourses"),
          BottomNavigationBarItem(
              icon: Icon(EvaIcons.heartOutline), label: "Whishlist"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_sharp), label: "Account"),
        ],
      ),
    );
  }
}
