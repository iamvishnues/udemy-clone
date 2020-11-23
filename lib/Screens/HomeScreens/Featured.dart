import 'package:flutter/material.dart';

class Featured extends StatefulWidget {
  @override
  _FeaturedState createState() => _FeaturedState();
}

class _FeaturedState extends State<Featured> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Featured"),
        actions: [
          IconButton(icon: Icon(Icons.add_shopping_cart), onPressed: () {}),
        ],
      ),
    );
  }
}
