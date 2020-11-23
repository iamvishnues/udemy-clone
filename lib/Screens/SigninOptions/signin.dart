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
      body: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Sign in"),
              FlatButton.icon(
                onPressed: () {},
                color: Colors.white,
                icon: Icon(EvaIcons.email),
                label: Text("Signin with email"),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 180,
                    child: Divider(
                      thickness: 1,
                      color: Colors.white,
                    ),
                  ),
                  Text("or"),
                  SizedBox(
                    width: 180,
                    child: Divider(
                      thickness: 1,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: FlatButton.icon(
                    color: Colors.white,
                    onPressed: () async {
                      await authentication.googleSignIn().whenComplete(() {
                        Navigator.pushReplacement(
                            context,
                            PageTransition(
                                child: HomeScreen(),
                                type: PageTransitionType.rightToLeftWithFade));
                      });
                    },
                    icon: Icon(EvaIcons.google),
                    label: Text("Signin with Google")),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: FlatButton.icon(
                    color: Colors.white,
                    onPressed: () {},
                    icon: Icon(EvaIcons.facebook),
                    label: Text("Signin with Facebook")),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: FlatButton.icon(
                    color: Colors.white,
                    onPressed: () {},
                    icon: Icon(FontAwesomeIcons.apple),
                    label: Text("Signin with Apple")),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("New here ?"),
                  MaterialButton(
                      child: Text("SignUp"),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            PageTransition(
                                child: SignUp(),
                                type: PageTransitionType.bottomToTop));
                      })
                ],
              )
            ],
          ),
        ),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/landingPageBg.png"),
                fit: BoxFit.fitHeight,
                colorFilter:
                    ColorFilter.mode(Colors.black54, BlendMode.darken))),
      ),
    );
  }
}
