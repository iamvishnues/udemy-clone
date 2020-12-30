import 'dart:ui';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:page_transition/page_transition.dart';
import 'package:udemyclone/Screens/landingPage.dart';
import 'package:udemyclone/Services/Authentication.dart';
import 'package:udemyclone/Services/Storage.dart';

String finalEmail = "useremail", finalName = "username";

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  Authentication authentication = Authentication();
  SecureStorage secureStorage = SecureStorage();
  @override
  void initState() {
    // TODO: implement initState
    secureStorage.readSecureData('email').then((value) {
      finalEmail = value;
      print(finalEmail);
    });
    secureStorage.readSecureData('name').then((value) {
      finalName = value;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Account"),
        actions: [
          IconButton(icon: Icon(Icons.add_shopping_cart), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300,
              width: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${finalName}",
                      style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w800,
                          color: Colors.white)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(EvaIcons.google),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "${finalEmail}",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      onPressed: () {},
                      child: Text("Become an Instructor",
                          style: TextStyle(color: Colors.lightBlue)),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Text(
                "video preferences",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            ListTile(
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.white,
              ),
              title: Text(
                "Download options",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.white,
              ),
              title: Text(
                "Video playback options",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Text(
                "Account settings",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            ListTile(
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.white,
              ),
              title: Text(
                "Account security",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.white,
              ),
              title: Text(
                "Email notification preferences",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.white,
              ),
              title: Row(
                children: [
                  Text(
                    "Learning reminders",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.new_releases,
                      color: Colors.teal,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Text(
                "Support",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            ListTile(
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.white,
              ),
              title: Text(
                "About Udemy",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.white,
              ),
              title: Text(
                "About Udemy for Business",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.white,
              ),
              title: Text(
                "Frequently asked questions",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.white,
              ),
              title: Text(
                "Share the Udemy app",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Text(
                "Diagnostics",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            ListTile(
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.white,
              ),
              title: Text(
                "Status",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Center(
              child: MaterialButton(
                onPressed: () async {
                  await authentication.googleSignout().whenComplete(() {
                    secureStorage.deleteSecureData('email');
                  }).whenComplete(() {
                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                            child: LandingPage(),
                            type: PageTransitionType.bottomToTop));
                  });
                },
                child: Text("Signout",
                    style: TextStyle(color: Colors.lightBlue, fontSize: 16)),
              ),
            ),
            Center(
                child: Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 10),
              child: Text("Udemy Clone v6.12.0",
                  style: TextStyle(color: Colors.grey, fontSize: 12)),
            ))
          ],
        ),
      ),
    );
  }
}
