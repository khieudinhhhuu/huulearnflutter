import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hello_world/tab/tabnavigator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupScreen extends StatefulWidget {
    const SignupScreen({super.key});

    @override
    State<SignupScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SignupScreen> {

    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController repasswordController = TextEditingController();

    void Confirm () async {
        if (nameController.text == '') {
            print('vui long nhap email');
        } 
        else if (passwordController.text == '') {
            print('vui long nhap mk');
        }
        else if (passwordController.text.length < 6) {
            print('mk tu 6 ky tu tro len');
        }
        else if (repasswordController.text == '') {
            print('nhap lai mat khau');
        }
        else if (passwordController.text != repasswordController.text) {
            print('mk va mk phai trung nhau');
        }
        else {
            print('dang ky firebase');
            try {
                final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: nameController.text,
                    password: passwordController.text,
                );
            } on FirebaseAuthException catch (e) {
                if (e.code == 'weak-password') {
                    print('The password provided is too weak.');
                } else if (e.code == 'email-already-in-use') {
                    print('The account already exists for that email.');
                }
            } catch (e) {
                print(e);
            }
        }
    }

    static Future<User?> loginWithGoogle (context) async {
        FirebaseAuth _auth = FirebaseAuth.instance;
        try {
            UserCredential userCredential;

            if (kIsWeb) {
                var googleProvider = GoogleAuthProvider();
                userCredential = await _auth.signInWithPopup(googleProvider);
            } else {
                final GoogleSignInAccount googleUser = (await GoogleSignIn().signIn())!;
                final GoogleSignInAuthentication googleAuth =
                    await googleUser.authentication;
                final googleAuthCredential = GoogleAuthProvider.credential(
                    accessToken: googleAuth.accessToken,
                    idToken: googleAuth.idToken,
                );
                userCredential = await _auth.signInWithCredential(googleAuthCredential);
            }

            final user = userCredential.user;
            print('ket qua: ${userCredential.credential!.accessToken}');
            if (userCredential.credential!.accessToken != null) {

                final prefs = await SharedPreferences.getInstance();
                await prefs.setInt('TOKEN', userCredential.credential!.accessToken as int);

                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const TabNavigator()),
                );
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (BuildContext context) => const TabNavigator(),
                // ))
                // .then((_) => _formKeyScreen1.currentState?.reset());
            }
            //return user;
        } catch (e) {
            print(e);
        }
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
        return 
            SafeArea(
                child: Scaffold(
                    body: Column(
                        children: [
                            Container(
                                alignment: Alignment.centerLeft,
                                //width: MediaQuery.of(context).size.width,
                                width: double.infinity,
                                height: 50,
                                margin: const EdgeInsets.only(bottom: 50),
                                padding: const EdgeInsets.only(left: 20),
                                color: const Color.fromARGB(255, 71, 169, 239),
                                // child: Image.asset('assets/images/ic_back.png'),
                                child: Row(
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                        //const Icon(Icons.arrow_back),
                                        IconButton(
                                            icon: const Icon(Icons.arrow_back),
                                            tooltip: 'back screen signin',
                                            onPressed: () {
                                                Navigator.pop(context);
                                            },
                                        ),
                                        SizedBox(width: MediaQuery.of(context).size.width/4,),
                                        // ignore: prefer_const_constructors
                                        Text('Đăng Ký', 
                                            // ignore: prefer_const_constructors
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20,
                                            ),
                                        ),
                                    ],
                                ),
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                      children: [
                                          TextFormField(
                                              autovalidateMode: AutovalidateMode.onUserInteraction,
                                              controller: nameController,
                                              keyboardType: TextInputType.emailAddress,
                                              decoration: InputDecoration(
                                                  contentPadding: const EdgeInsets.only(left: 12),
                                                  counterText: '',
                                                  labelText: 'Email',
                                                  border: const OutlineInputBorder(),
                                                  enabledBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(5),
                                                  ),
                                              ),
                                          ),
                                          const SizedBox( height: 20,),
                                          TextFormField(
                                              autovalidateMode: AutovalidateMode.onUserInteraction,
                                              controller: passwordController,
                                              keyboardType: TextInputType.visiblePassword,
                                              maxLength: 16,
                                              obscureText: true,
                                              decoration: InputDecoration(
                                                  contentPadding: const EdgeInsets.only(left: 12),
                                                  counterText: '',
                                                  labelText: 'Mật Khẩu',
                                                  border: const OutlineInputBorder(),
                                                  enabledBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(5),
                                                  ),
                                              ),
                                          ),
                                          const SizedBox( height: 20,),
                                          TextFormField(
                                              autovalidateMode: AutovalidateMode.onUserInteraction,
                                              controller: repasswordController,
                                              keyboardType: TextInputType.visiblePassword,
                                              maxLength: 16,
                                              obscureText: true,
                                              decoration: InputDecoration(
                                                  contentPadding: const EdgeInsets.only(left: 12),
                                                  counterText: '',
                                                  labelText: 'Nhập Lại Mật Khẩu',
                                                  border: const OutlineInputBorder(),
                                                  enabledBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(5),
                                                  ),
                                              ),
                                          ),
                                          const SizedBox( height: 40),
                                          ElevatedButton(
                                              onPressed: () {
                                                  Confirm();
                                              },
                                              child: const Text('Xác Nhận'),
                                          ),
                                          const SizedBox( height: 40),
                                          IconButton(
                                              onPressed: () {
                                                  loginWithGoogle(context);
                                              },
                                              icon: const Icon(Icons.facebook),
                                          ),
                                      ],
                                  )
                              ),
                            ),
                        ],
                    )
                ),
            );
    }
}
