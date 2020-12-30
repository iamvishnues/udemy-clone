import 'package:flutter/material.dart';
import 'package:udemyclone/Services/DataController.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:udemyclone/Screens/DetailSection/DetailScreen.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController searchController = TextEditingController();
  QuerySnapshot snapshotData;
  @override
  bool isExecuted = false;
  @override
  Widget build(BuildContext context) {
    Widget searchData() {
      return ListView.builder(
          itemCount: snapshotData.docs.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Get.to(DetailedScreen(),
                    transition: Transition.downToUp,
                    arguments: snapshotData.docs[index]);
              },
              child: ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child:
                      Image.network(snapshotData.docs[index].data()['image']),
                ),
                title: Text(
                  snapshotData.docs[index].data()['title'],
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  snapshotData.docs[index].data()['author'],
                  style: TextStyle(
                      color: Colors.white54,
                      fontWeight: FontWeight.w600,
                      fontSize: 12),
                ),
              ),
            );
          });
    }

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.clear),
          onPressed: () {
            setState(() {
              isExecuted = false;
            });
          },
        ),
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: TextField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: "Search Courses",
              hintStyle: TextStyle(color: Colors.white),
            ),
            controller: searchController,
          ),
          actions: [
            GetBuilder<DataController>(
                init: DataController(),
                builder: (val) {
                  return IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      val.queryData(searchController.text).then((value) {
                        snapshotData = value;
                        setState(() {
                          isExecuted = true;
                        });
                      });
                    },
                  );
                })
          ],
        ),
        body: isExecuted
            ? searchData()
            : Center(
                child: Container(
                  child: Text(
                    "Search courses",
                    style: TextStyle(
                        color: Colors.white70, fontWeight: FontWeight.w600),
                  ),
                ),
              ));
  }
}
