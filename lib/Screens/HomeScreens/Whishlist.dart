import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemyclone/Screens/MyList.dart';
import 'package:udemyclone/Services/DataController.dart';

class Wishlist extends StatefulWidget {
  @override
  _WishlistState createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Wishlist",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.add_shopping_cart,
                  color: Colors.white,
                ),
                onPressed: () {
                  Get.to(MyList());
                })
          ],
        ),
        body: GetBuilder<DataController>(
          init: DataController(),
          builder: (value) {
            return FutureBuilder(
              future: value.getData('wishlist'),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.black,
                    ),
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext, int index) {
                        return Card(
                          color: Colors.white10,
                          child: Container(
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      height: 90,
                                      width: 130,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                snapshot.data[index]
                                                    .data()['image'],
                                              ),
                                              fit: BoxFit.cover),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 12),
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              constraints:
                                                  BoxConstraints(maxWidth: 180),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10.0),
                                                child: snapshot.data[index]
                                                            .data()['title']
                                                            .length <
                                                        47
                                                    ? Text(
                                                        snapshot.data[index]
                                                                .data()['title']
                                                                .substring(
                                                                    0, 40) +
                                                            "...",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      )
                                                    : Text(
                                                        snapshot.data[index]
                                                                .data()['title']
                                                                .substring(
                                                                    0, 42) +
                                                            "...",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                // Text(
                                                //     snapshot.data[index]
                                                //             .data()['title']
                                                //             .substring(0, 48) +
                                                //         "...",
                                                //     style:
                                                //         TextStyle(color: Colors.white),
                                                //   ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0, bottom: 8.0),
                                              child: Text(
                                                snapshot.data[index]
                                                    .data()['author'],
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 13),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  EvaIcons.star,
                                                  size: 16,
                                                  color: Colors.orangeAccent,
                                                ),
                                                Icon(
                                                  EvaIcons.star,
                                                  size: 16,
                                                  color: Colors.orangeAccent,
                                                ),
                                                Icon(
                                                  EvaIcons.star,
                                                  size: 16,
                                                  color: Colors.orangeAccent,
                                                ),
                                                Icon(
                                                  EvaIcons.star,
                                                  size: 16,
                                                  color: Colors.orangeAccent,
                                                ),
                                                Icon(
                                                  EvaIcons.star,
                                                  size: 16,
                                                  color: Colors.orangeAccent,
                                                ),
                                                Text(
                                                  snapshot.data[index]
                                                      .data()['ratings'],
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 13),
                                                ),
                                                Text(
                                                  ('(${snapshot.data[index].data()['enrolled']})'),
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 13),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  snapshot.data[index]
                                                      .data()['price'],
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Text(
                                                  snapshot.data[index]
                                                      .data()['notPrice'],
                                                  style: TextStyle(
                                                      color: Colors.white70,
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      });
                }
              },
            );
          },
        )
        // SingleChildScrollView(
        //   child: Container(
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         SizedBox(
        //           height: 280,
        //           width: 400,
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.center,
        //             // mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               Image.asset("images/wish.jpg"),
        //               Center(
        //                 child: Padding(
        //                   padding: const EdgeInsets.only(left: 28.0, right: 28.0),
        //                   child: Text(
        //                     "Want to save something for later?",
        //                     style: TextStyle(color: Colors.white, fontSize: 18),
        //                   ),
        //                 ),
        //               ),
        //               Padding(
        //                 padding: const EdgeInsets.only(top: 4.0),
        //                 child: Text(
        //                   "Your wishlist will go here",
        //                   style: TextStyle(color: Colors.grey, fontSize: 14),
        //                 ),
        //               )
        //             ],
        //           ),
        //         ),
        //         Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: Text(
        //             "Browse categories",
        //             style: TextStyle(color: Colors.white, fontSize: 15),
        //           ),
        //         ),
        //         ListTile(
        //           leading: Icon(
        //             Icons.account_balance_wallet,
        //             size: 20,
        //             color: Colors.white.withOpacity(0.6),
        //           ),
        //           title: Text(
        //             "Finance & Accounting",
        //             style: TextStyle(
        //                 color: Colors.white.withOpacity(0.6), fontSize: 12),
        //           ),
        //         ),
        //         ListTile(
        //           leading: Icon(
        //             EvaIcons.code,
        //             size: 20,
        //             color: Colors.white.withOpacity(0.6),
        //           ),
        //           title: Text(
        //             "Development",
        //             style: TextStyle(
        //                 color: Colors.white.withOpacity(0.6), fontSize: 12),
        //           ),
        //         ),
        //         ListTile(
        //           leading: Icon(
        //             Icons.business,
        //             color: Colors.white.withOpacity(0.6),
        //             size: 20,
        //           ),
        //           title: Text(
        //             "Business",
        //             style: TextStyle(
        //                 color: Colors.white.withOpacity(0.6), fontSize: 12),
        //           ),
        //         ),
        //         ListTile(
        //           leading: Icon(
        //             Icons.computer,
        //             color: Colors.white.withOpacity(0.6),
        //             size: 20,
        //           ),
        //           title: Text(
        //             "IT & Software",
        //             style: TextStyle(
        //                 color: Colors.white.withOpacity(0.6), fontSize: 12),
        //           ),
        //         ),
        //         ListTile(
        //           leading: Icon(
        //             Icons.sticky_note_2_rounded,
        //             color: Colors.white.withOpacity(0.6),
        //             size: 20,
        //           ),
        //           title: Text(
        //             "Office Productivity",
        //             style: TextStyle(
        //                 color: Colors.white.withOpacity(0.6), fontSize: 12),
        //           ),
        //         ),
        //         ListTile(
        //           leading: Icon(
        //             EvaIcons.people,
        //             color: Colors.white.withOpacity(0.6),
        //             size: 20,
        //           ),
        //           title: Text(
        //             "Personal Development",
        //             style: TextStyle(
        //                 color: Colors.white.withOpacity(0.6), fontSize: 12),
        //           ),
        //         ),
        //         ListTile(
        //           leading: Icon(
        //             Icons.design_services_sharp,
        //             color: Colors.white.withOpacity(0.6),
        //             size: 20,
        //           ),
        //           title: Text(
        //             "Design",
        //             style: TextStyle(
        //                 color: Colors.white.withOpacity(0.6), fontSize: 12),
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        // ),
        );
  }
}
