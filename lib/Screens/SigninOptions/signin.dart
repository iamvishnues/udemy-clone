import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:udemyclone/Screens/HomeScreen.dart';
import 'package:udemyclone/Services/Authentication.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:udemyclone/Screens/SigninOptions/signup.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  Authentication authentication = Authentication();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 50,
                    bottom: 50,
                  ),
                  child: Text("Sign in",
                      style: TextStyle(color: Colors.white, fontSize: 25)),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: FlatButton.icon(
                    onPressed: () {},
                    color: Colors.white,
                    minWidth: 270,
                    height: 50,
                    icon: Icon(Icons.mail_outline),
                    label: Text(
                      "Signin with email",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 28.0, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 120,
                        child: Divider(
                          thickness: 1,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child:
                            Text("or", style: TextStyle(color: Colors.white)),
                      ),
                      SizedBox(
                        width: 120,
                        child: Divider(
                          thickness: 1,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: FlatButton.icon(
                      minWidth: 270,
                      height: 50,
                      color: Colors.white,
                      onPressed: () async {
                        await authentication.googleSignIn().whenComplete(() {
                          Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  child: HomeScreen(),
                                  type:
                                      PageTransitionType.rightToLeftWithFade));
                        });
                      },
                      icon: Icon(EvaIcons.google),
                      label: Text("Signin with Google")),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: FlatButton.icon(
                      minWidth: 270,
                      height: 50,
                      color: Colors.white,
                      onPressed: () {},
                      icon: Icon(EvaIcons.facebook),
                      label: Text("Signin with Facebook")),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: FlatButton.icon(
                      minWidth: 270,
                      height: 50,
                      color: Colors.white,
                      onPressed: () {},
                      icon: Icon(FontAwesomeIcons.apple),
                      label: Text("Signin with Apple")),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("New here ?", style: TextStyle(color: Colors.white)),
                    MaterialButton(
                        child: Text("Signup",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400)),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  child: SignUp(),
                                  type: PageTransitionType.bottomToTop));
                        }),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: 28.0,
                    right: 28.0,
                  ),
                  child: Text(
                    "By using our services you are agreeing to our terms & ",
                    style: TextStyle(color: Colors.white, fontSize: 11),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 28.0,
                    right: 28.0,
                  ),
                  child: Text(
                    " conditions and privacy statement",
                    style: TextStyle(color: Colors.white, fontSize: 11),
                  ),
                )
              ],
            ),
          ),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomLeft,
                  colors: [Color(0xFF791E57), Color(0xFFE0495A)]),
              image: DecorationImage(
                image: AssetImage(
                  "images/udemy.png",
                ),
                fit: BoxFit.fitHeight,
                // colorFilter:
                //     ColorFilter.mode(Colors.black54, BlendMode.darken)
              )),
        ),
      ),
    );
  }
}
