import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hello_world/model/model_book.dart';
import 'package:hello_world/model/model_user.dart';
import 'package:hello_world/profile/component/item_profile_friend.dart';
import 'package:hello_world/profile/post_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    getProfile();
  }

  List<ModelUser> modelUser = [];
  var useer;

  void getProfile() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    User user = auth.currentUser!;

    FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists && documentSnapshot.data() != null) {
        print('Document data: ${documentSnapshot.data()}');
        var a = jsonEncode(documentSnapshot.data());

        print('111111${a}');

        setState(() {
            useer = a;
        });

       // return modelUser.add(documentSnapshot.data() as ModelUser);
      }
    });
  }

  final List<ModelBook> books = [
    ModelBook(
      id: 'p1',
      title: 'Beginning Flutter With Dart',
      description: 'You can learn Flutter as well Dart.',
      price: 1.99,
      imageUrl:
          'https://mtrend.vn/wp-content/uploads/2019/05/anh-bien-dep-31.jpg',
    ),
    ModelBook(
      id: 'p2',
      title: 'Flutter State Management',
      description: 'Everything you should know about Flutter State.',
      price: 2.99,
      imageUrl:
          'https://mtrend.vn/wp-content/uploads/2019/05/anh-bien-dep-28.jpg',
    ),
    ModelBook(
      id: 'p3',
      title: 'WordPress Coding',
      description:
          'WordPress coding is not difficult, in fact it is interesting.',
      price: 3.99,
      imageUrl:
          'https://mtrend.vn/wp-content/uploads/2019/05/anh-bien-dep-24.jpg',
    ),
    ModelBook(
      id: 'p4',
      title: 'PHP 8 Standard Library',
      description: 'PHP 8 Standard Library has made developers life easier.',
      price: 4.99,
      imageUrl:
          'https://mtrend.vn/wp-content/uploads/2019/05/anh-bien-dep-22.jpg',
    ),
    ModelBook(
      id: 'p5',
      title: 'Better Flutter',
      description:
          'Learn all the necessary concepts of building a Flutter App.',
      price: 5.99,
      imageUrl:
          'https://mtrend.vn/wp-content/uploads/2019/05/anh-bien-dep-34.jpg',
    ),
    ModelBook(
      id: 'p6',
      title: 'Discrete Mathematical Data Structures and Algorithm',
      description:
          'Discrete mathematical concepts are necessary to learn Data Structures and Algorithm.',
      price: 6.99,
      imageUrl: 'https://mtrend.vn/wp-content/uploads/2019/05/anh-bien-dep.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        //statusBarBrightness: Brightness.light,
      ),
    );
    print('tttttttttttttttt: $useer');

    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 50,
                  alignment: Alignment.center,
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        IconButton(
                            onPressed: () {
                            Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back),
                        ),
                        Text(
                            useer['displayName'].toString(),
                            style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            ),
                        ),
                        const SizedBox(width: 40),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 3, right: 3),
                  child: Stack(children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        'https://images.mubicdn.net/images/film/155526/cache-156771-1639429610/image-w1280.jpg?size=800x',
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                      ),
                    ),
                    Positioned(
                      top: 150,
                      right: 15,
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Colors.white,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSf_0v2yNR63VG6KrbxvgQkDIdsxie1ZpvzCw&usqp=CAU',
                            fit: BoxFit.cover,
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
                const SizedBox(height: 60),
                const Text(
                  'Khieu Dinh Hue Huu',
                  // ignore: prefer_const_constructors
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                const Text(
                  '🍀 Vạn sự tùy duyên 🍀🌺 Hoa rơi cửa Phật 🌺',
                  // ignore: prefer_const_constructors
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: Row(
                    children: [
                      Image.network(
                        'https://cdn.iconscout.com/icon/premium/png-256-thumb/handbag-2037423-1718947.png',
                        fit: BoxFit.cover,
                        width: 20,
                        height: 20,
                      ),
                      const Text(
                        'Đã làm việc tcom',
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: Row(
                    children: [
                      Image.network(
                        'https://cdn.iconscout.com/icon/free/png-256/house-1495589-1267760.png',
                        fit: BoxFit.cover,
                        width: 20,
                        height: 20,
                      ),
                      const Text(
                        'Sống tại TP. Sài Gọn',
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: Row(
                    children: [
                      Image.network(
                        'https://icon-library.com/images/icon-wifi/icon-wifi-11.jpg',
                        fit: BoxFit.cover,
                        width: 20,
                        height: 20,
                      ),
                      const Text(
                        'Có 1.000.000.000',
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color.fromARGB(255, 180, 224, 249),
                  ),
                  child: const Text(
                    'Chỉnh sửa chi tiết công khai',
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                      color: Color.fromARGB(255, 40, 184, 236),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            'Bạn bè',
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '3401 người bạn',
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: const Text(
                          'Tìm bạn bè',
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 2.3,
                  padding: const EdgeInsets.only(left: 13, right: 13),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: books.length,
                    itemBuilder: (context, index) {
                      return ItemProfileFriend(item: books[index]);
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 0,
                      mainAxisExtent: MediaQuery.of(context).size.width / 2.4,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color.fromARGB(255, 207, 213, 216),
                  ),
                  child: const Text(
                    'Xem tất cả bạn bè',
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: const Text(
                          'Bài viết của bạn',
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: const Text(
                          'Bộ lọc',
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
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
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const PostScreen()),
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
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color.fromARGB(255, 207, 213, 216),
                  ),
                  child: const Text(
                    'Quản lý bài viết',
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 180,
              left: MediaQuery.of(context).size.width / 3.1,
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  color: Colors.white,
                ),
                child: Stack(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: Image.network(
                      'https://images.mubicdn.net/images/film/155526/cache-156771-1639429610/image-w1280.jpg?size=800x',
                      fit: BoxFit.cover,
                      width: 120,
                      height: 120,
                    ),
                  ),
                  Positioned(
                    top: 90,
                    right: 5,
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSf_0v2yNR63VG6KrbxvgQkDIdsxie1ZpvzCw&usqp=CAU',
                          fit: BoxFit.cover,
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
