import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hello_world/login/signin_screen.dart';
import 'package:hello_world/more/profile_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoreScreen extends StatefulWidget {
    const MoreScreen({super.key});

    @override
    State<MoreScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MoreScreen> {

    final keyScreenMore = GlobalKey<FormState>();

    final menu = [
        'Thong bao',
        'Cai dat',
        'Tro giup',
        'Dang xuat',
    ];

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

    Future<void> menuAction (context, i) async {
        if (i == 0 || i == 1 || i == 2) {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen(user: dataUser) ),
            );
        }
        if (i == 3) {
            final GoogleSignIn googleSignIn = GoogleSignIn();
            try {
                if (!kIsWeb) {
                    await googleSignIn.signOut();
                }
                await FirebaseAuth.instance.signOut();

                final prefs = await SharedPreferences.getInstance();
                await prefs.remove('TOKEN');

                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const SigninScreen(),
                ))
                .then((_) => keyScreenMore.currentState?.reset());

            } catch (e) {
                print(e);
            }
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
                                        'More',
                                        // ignore: prefer_const_constructors
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20,
                                        ),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                            
                                        },
                                        icon: const Icon(Icons.list),
                                    ),
                                ],
                            ),
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                            onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>  ProfileScreen(user: dataUser)),
                                );
                            },
                            child: Container(
                                padding: const EdgeInsets.all(10),
                                color: Colors.green,
                                child: Row(
                                    children: [
                                        ClipRRect(
                                            borderRadius: BorderRadius.circular(30),
                                            child: Image.network(
                                                'https://images.mubicdn.net/images/film/155526/cache-156771-1639429610/image-w1280.jpg?size=800x',
                                                fit: BoxFit.cover,
                                                width: 60,
                                                height: 60,
                                            ),
                                        ),
                                        Expanded(
                                            child: Container(
                                                padding: const EdgeInsets.only(left: 10),
                                                child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                        Text(
                                                            'Khieu Dinh Hue Huu',
                                                            style: const TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: 18,
                                                                color: Colors.black,
                                                            ),
                                                            maxLines: 1,
                                                        ),
                                                        const SizedBox(height: 5),
                                                        Text(
                                                            'Trang ca nhan',
                                                            style: const TextStyle(
                                                                fontSize: 14,
                                                                color: Colors.black,
                                                                overflow: TextOverflow.ellipsis
                                                            ),
                                                            maxLines: 1,
                                                        ),
                                                    ],
                                                ),
                                            ),
                                        ),
                                    ],
                                ),
                            ),
                        ),
                        const SizedBox(height: 20),
                        Expanded(
                            child: Container(
                                child: ListView.builder(
                                    itemCount: menu.length,
                                    itemBuilder: (value, index) {
                                        return 
                                            GestureDetector(
                                                onTap: (){
                                                    menuAction(context, index);
                                                },
                                                child: Container(
                                                padding: const EdgeInsets.all(10),
                                                color: Colors.green,
                                                margin: const EdgeInsets.only(top: 10),
                                                   child: Text(menu[index]),
                                                )
                                            );
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
