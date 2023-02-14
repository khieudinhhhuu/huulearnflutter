import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

        FirebaseAuth auth = FirebaseAuth.instance;
            UserCredential userCredential = await auth.createUserWithEmailAndPassword(
                email: nameController.text,
                password: passwordController.text,
            );
            var user = userCredential.user;
            await user!.updateProfile(displayName: nameController.text);
            await user.reload();
            user = auth.currentUser;
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
                            SingleChildScrollView(
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
                                    ],
                                )
                            ),
                        ],
                    )
                ),
            );
    }
}
