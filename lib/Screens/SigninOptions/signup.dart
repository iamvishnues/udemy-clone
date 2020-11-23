import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
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
              Text("Sign Up"),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: FlatButton.icon(
                    color: Colors.white,
                    onPressed: () async {
                      await authentication.googleSignIn();
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
                  Text("Already have an account ?"),
                  MaterialButton(
                      child: Text("Signin"),
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
