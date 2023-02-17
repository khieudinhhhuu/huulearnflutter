import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hello_world/home/component/item_home_grid.dart';
import 'package:hello_world/home/component/item_home_list.dart';
import 'package:hello_world/home/home_detail.dart';
import 'package:hello_world/model/model_book.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomeScreen> {

    // final List<ModelBook> books = [
    //     ModelBook(
    //         id: 'p1',
    //         title: 'Beginning Flutter With Dart',
    //         description: 'You can learn Flutter as well Dart.',
    //         price: 1.99,
    //         imageUrl: 'https://mtrend.vn/wp-content/uploads/2019/05/anh-bien-dep-31.jpg',
    //     ),
    //     ModelBook(
    //         id: 'p2',
    //         title: 'Flutter State Management',
    //         description: 'Everything you should know about Flutter State.',
    //         price: 2.99,
    //         imageUrl: 'https://mtrend.vn/wp-content/uploads/2019/05/anh-bien-dep-28.jpg',
    //     ),
    //     ModelBook(
    //         id: 'p3',
    //         title: 'WordPress Coding',
    //         description: 'WordPress coding is not difficult, in fact it is interesting.',
    //         price: 3.99,
    //         imageUrl: 'https://mtrend.vn/wp-content/uploads/2019/05/anh-bien-dep-24.jpg',
    //     ),
    //     ModelBook(
    //         id: 'p4',
    //         title: 'PHP 8 Standard Library',
    //         description: 'PHP 8 Standard Library has made developers life easier.',
    //         price: 4.99,
    //         imageUrl: 'https://mtrend.vn/wp-content/uploads/2019/05/anh-bien-dep-22.jpg',
    //     ),
    //     ModelBook(
    //         id: 'p5',
    //         title: 'Better Flutter',
    //         description: 'Learn all the necessary concepts of building a Flutter App.',
    //         price: 5.99,
    //         imageUrl: 'https://mtrend.vn/wp-content/uploads/2019/05/anh-bien-dep-34.jpg',
    //     ),
    //     ModelBook(
    //         id: 'p6',
    //         title: 'Discrete Mathematical Data Structures and Algorithm',
    //         description: 'Discrete mathematical concepts are necessary to learn Data Structures and Algorithm.',
    //         price: 6.99,
    //         imageUrl: 'https://mtrend.vn/wp-content/uploads/2019/05/anh-bien-dep.jpg',
    //     ),
    //     ModelBook(
    //         id: 'p7',
    //         title: 'Beginning Flutter With Dart',
    //         description: 'You can learn Flutter as well Dart.',
    //         price: 7.99,
    //         imageUrl: 'https://mtrend.vn/wp-content/uploads/2019/05/anh-bien-dep-3.jpg',
    //     ),
    //     ModelBook(
    //         id: 'p8',
    //         title: 'Flutter State Management',
    //         description: 'Everything you should know about Flutter State.',
    //         price: 8.99,
    //         imageUrl: 'https://mtrend.vn/wp-content/uploads/2019/05/anh-bien-dep-21.jpg',
    //     ),
    //     ModelBook(
    //         id: 'p9',
    //         title: 'WordPress Coding',
    //         description: 'WordPress coding is not difficult, in fact it is interesting.',
    //         price: 9.99,
    //         imageUrl: 'https://mtrend.vn/wp-content/uploads/2019/05/hinh-anh-bien-dep-806x440.jpg',
    //     ),
    //     ModelBook(
    //         id: 'p10',
    //         title: 'PHP 8 Standard Library',
    //         description: 'PHP 8 Standard Library has made developers life easier.',
    //         price: 10.99,
    //         imageUrl: 'https://mtrend.vn/wp-content/uploads/2019/05/anh-bien-dep-9.jpg',
    //     ),
    //     ModelBook(
    //         id: 'p11',
    //         title: 'Better Flutter',
    //         description: 'Learn all the necessary concepts of building a Flutter App.',
    //         price: 11.99,
    //         imageUrl: 'https://mtrend.vn/wp-content/uploads/2019/05/anh-bien-beach.jpg',
    //     ),
    //     ModelBook(
    //         id: 'p12',
    //         title: 'Discrete Mathematical Data Structures and Algorithm',
    //         description: 'Discrete mathematical concepts are necessary to learn Data Structures and Algorithm.',
    //         price: 12.99,
    //         imageUrl: 'https://mtrend.vn/wp-content/uploads/2019/05/anh-bien-hoang-hon-15.jpg',
    //     ),
    // ];


    @override
    void initState() {
        super.initState();
        getAllData();
    }

            final books = <ModelBook>[];

    Future<List<ModelBook>> getAllData () async {
        print("Active Users");
        var val = await FirebaseFirestore.instance
            .collection("social_network")
            .get();
        var documents = val.docs;
        print("Documents ${documents.length}");
        if (documents.length > 0) {
            try {
                print("Active ${documents.length}");
                return documents.map((document) {
                ModelBook bookingList = ModelBook.fromJson(Map<String, dynamic>.from(document.data()));
                
                return bookingList;
                }).toList();
            } catch (e) {
                print("Exception $e");
                return [];
            }
        }
        return [];
    }
    
    String styleList = 'list';

    void ChangeStyleList() {
        if (styleList == 'list') {
            setState(() {
                styleList = 'grid';
            });
        } else {
            setState(() {
                styleList = 'list';
            });
        }
    }

    @override
    Widget build(BuildContext context) {

        SystemChrome.setSystemUIOverlayStyle(
            const SystemUiOverlayStyle(
                statusBarColor: Colors.green,
                statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
                //statusBarBrightness: Brightness.light,
            ),
        );

        return SafeArea(
        child: Scaffold(
            body: Column(
                children: [
                Container(
                    height: 50,
                    alignment: Alignment.center,
                    color: Colors.green,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                            const SizedBox(width: 40),
                            const Text(
                                'Home',
                                // ignore: prefer_const_constructors
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                ),
                            ),
                            IconButton(
                                onPressed: () {
                                    ChangeStyleList();
                                },
                                icon: const Icon(Icons.list),
                            ),
                        ],
                    ),
                ),
                const SizedBox(height: 20),
                Expanded(
                    child: Container(
                        child: styleList == 'grid' ? 
                            GridView.builder(
                                itemCount: books.length ,
                                itemBuilder: (context, index) {
                                    return ItemHomeGrid(item: books[index]);
                                },
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, 
                                    crossAxisSpacing: 0,
                                    mainAxisExtent: 270,
                                ),
                            )
                            :
                            ListView.builder(
                                itemCount: books.length,
                                itemBuilder: (context, index) {
                                    return ItemHomeList(item: books[index]);
                                }
                            ),
                    ),
                ),
            ],
        )),
        );
    }
}
