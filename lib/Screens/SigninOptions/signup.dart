import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:udemyclone/Screens/SigninOptions/signin.dart';
import 'package:udemyclone/Services/Authentication.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Authentication authentication = Authentication();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(48.0),
                child: Text("Sign up",
                    style: TextStyle(color: Colors.white, fontSize: 25)),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: FlatButton.icon(
                    color: Colors.white,
                    onPressed: () async {
                      await authentication.googleSignIn();
                    },
                    minWidth: 270,
                    height: 50,
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
                  Text("Already have an account ?",
                      style: TextStyle(color: Colors.white)),
                  MaterialButton(
                      minWidth: 10,
                      child:
                          Text("Signin", style: TextStyle(color: Colors.white)),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            PageTransition(
                                child: SignIn(),
                                type: PageTransitionType.bottomToTop));
                      })
                ],
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
    );
  }
}
