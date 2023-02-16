import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfileScreen extends StatefulWidget {
    ProfileScreen({super.key, required Object user});

    dynamic user;

    @override
    State<ProfileScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ProfileScreen> {
    dynamic user;
    Object dataUser = {};

    @override
    void initState() {
        super.initState();
        getProfile();
    }

    void getProfile () {
        final FirebaseAuth _auth = FirebaseAuth.instance;
        User user = _auth.currentUser!;

        FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get()
            .then((DocumentSnapshot documentSnapshot) {
            if (documentSnapshot.exists) {
                print('Document data: ${documentSnapshot.data()}');
                setState(() {
                    dataUser = documentSnapshot.data()!;
                });
            }
        });
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
                body: Stack(
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
                                            const Text(
                                                'Khieu Dinh Hue Huu',
                                                // ignore: prefer_const_constructors
                                                style: TextStyle(
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
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                            'dataUser.photoUrl',
                                            fit: BoxFit.cover,
                                            width: MediaQuery.of(context).size.width,
                                            height: 200,
                                        ),
                                    ),
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
                                    child: const Text(
                                        'Đã làm việc tcom',
                                        // ignore: prefer_const_constructors
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                        ),
                                    ),
                                ),
                                Container(
                                    alignment: Alignment.centerLeft,
                                    child: const Text(
                                        'Sống tại TP. Sài Gọn',
                                        // ignore: prefer_const_constructors
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                        ),
                                    ),
                                ),
                                Container(
                                    alignment: Alignment.centerLeft,
                                    child: const Text(
                                        'Có 1.000.000.000',
                                        // ignore: prefer_const_constructors
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                        ),
                                    ),
                                ),
                            ],
                        ),
                        Positioned(
                            top: 180,
                            left: MediaQuery.of(context).size.width/3.1,
                            child: Container(
                                padding: const EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(60),
                                    color: Colors.white,
                                ),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(60),
                                    child: Image.network(
                                        'https://images.mubicdn.net/images/film/155526/cache-156771-1639429610/image-w1280.jpg?size=800x',
                                        fit: BoxFit.cover,
                                        width: 120,
                                        height: 120,
                                    ),
                                ),
                            ),
                        ),
                    ],
                )
            ),
        );
    }
}
