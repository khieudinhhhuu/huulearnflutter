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
import 'package:hello_world/model/model_post.dart';
import 'package:hello_world/profile/post_screen.dart';

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
    final posts = <ModelPost>[];

    void getAllData () {
        FirebaseFirestore.instance
            .collection("social_network")
            .get()
            .then((QuerySnapshot querySnapshot) {
                querySnapshot.docs.forEach((doc) {
                    print(doc["title"]);
                    final data = doc.data() as Map<String, dynamic>;
                    print('met que: $data');
                    //books.add(ModelBook.fromJson(data));
                    posts.add(ModelPost.fromMap(data));
                });
                return posts;
        });
    }
    
    String styleList = 'list';

    void changeStyleList() {
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
    Widget itemHearder () {
        return Container(
            padding: const EdgeInsets.all(10),
            color: Colors.white,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Row(
                        children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                    'https://cdn.iconscout.com/icon/free/png-256/avatar-370-456322.png',
                                    fit: BoxFit.cover,
                                    width: 40,
                                    height: 40,
                                ),
                            ),
                            const SizedBox( width: 10),
                            GestureDetector(
                                onTap: (){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) =>  const PostScreen()),
                                    );
                                },
                                child: const Text(
                                    'Bạn đang nghĩ gì?',
                                    // ignore: prefer_const_constructors
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                    ),
                                ),
                            ),
                        ],
                    ),
                    Image.network(
                        'https://images.freeimages.com/fic/images/icons/1168/simplexity_file/256/png.png',
                        fit: BoxFit.cover,
                        width: 25,
                        height: 25,
                    ),
                ],
            ),
        );
    }

    @override
    Widget build(BuildContext context) {

        SystemChrome.setSystemUIOverlayStyle(
            const SystemUiOverlayStyle(
                statusBarColor: Colors.white,
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
                            color: Colors.white,
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                    const Text(
                                        'Hello World',
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25,
                                        ),
                                    ),
                                    Row(
                                        children: [
                                            Container(
                                                padding: const EdgeInsets.all(3),
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(20),
                                                    color: const Color.fromARGB(255, 225, 227, 229),
                                                ),
                                                child: const Icon(Icons.search, size: 25,),
                                            ),
                                            GestureDetector(
                                                onTap: () {
                                                    changeStyleList();
                                                },
                                                child: Container(
                                                    padding: const EdgeInsets.all(3),
                                                    margin: const EdgeInsets.only(left: 15),
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(20),
                                                        color: const Color.fromARGB(255, 225, 227, 229),
                                                    ),
                                                    child: const Icon(Icons.list, size: 25,),
                                                ),
                                            ),
                                        ],
                                    ),
                                ],
                            ),
                        ),
                        itemHearder(),
                        Expanded(
                            child: Container(
                                color: const Color.fromARGB(255, 228, 227, 227),
                                child: styleList == 'grid' ? 
                                    GridView.builder(
                                        itemCount: posts.length ,
                                        itemBuilder: (context, index) {
                                            return ItemHomeGrid(item: posts[index]);
                                        },
                                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2, 
                                            crossAxisSpacing: 0,
                                            mainAxisExtent: 270,
                                        ),
                                    )
                                    :
                                    ListView.builder(
                                        //physics: const NeverScrollableScrollPhysics(),
                                        itemCount: posts.length,
                                        itemBuilder: (context, index) {
                                            // if (index == 0) {
                                            //     return itemHearder();
                                            // }
                                            return ItemHomeList(item: posts[index]);
                                        }
                                    ),
                            ),
                        ),
                    ],
                )
            ),
        );
    }
}
