import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hello_world/login/signup_screen.dart';
import 'package:hello_world/tab/tabnavigator.dart';

class SigninScreen extends StatefulWidget {
    const SigninScreen({super.key});

    @override
    State<SigninScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SigninScreen> {

    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

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
                    body: 
                        SingleChildScrollView(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                                children: [
                                    Container(
                                        alignment: Alignment.center,
                                        margin: const EdgeInsets.only(top: 50),
                                        child: const Text(
                                        'Khiếu Đình Huế Hữu',
                                        style: TextStyle(
                                            color: Colors.pink,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 30,
                                            
                                        ),
                                    )),
                                    Container(
                                        alignment: Alignment.center,
                                        margin: const EdgeInsets.only(top: 50, bottom: 30),
                                        child: const Text(
                                        'Sign in',
                                        style: TextStyle(
                                            fontSize: 25,
                                            color: Colors.yellow,
                                        ),
                                    )),
                                    // Container(
                                    //     margin: const EdgeInsets.only(top: 20),
                                    //     height: 90,
                                    //     child: TextField(
                                    //         controller: nameController,
                                    //         decoration: const InputDecoration(
                                    //             border: OutlineInputBorder(),
                                    //             labelText: 'User Name',
                                    //         ),
                                    //     ),
                                    // ),
                                    // Container(
                                    //     height: 90,
                                    //     child: TextField(
                                    //         obscureText: true,
                                    //         controller: passwordController,
                                    //         decoration: const InputDecoration(
                                    //         border: OutlineInputBorder(),
                                    //         labelText: 'Password',
                                    //         ),
                                    //     ),
                                    // ),

                                    TextFormField(
                                        autovalidateMode: AutovalidateMode.onUserInteraction,
                                        controller: nameController,
                                        keyboardType: TextInputType.emailAddress,
                                        maxLength: 13,
                                        decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(left: 12),
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
                                        keyboardType: TextInputType.phone,
                                        maxLength: 13,
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
                                    Container(
                                        alignment: Alignment.centerLeft,
                                        child: TextButton(
                                            onPressed: () {
                                                //forgot password screen
                                            },
                                            child: const Text('Quên mật khẩu?',),
                                        ),
                                    ),
                                    Center(
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                
                                            ),
                                            child: const Text('Đăng nhập'),
                                            onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => const TabNavigator()),
                                                );
                                            },
                                        ),
                                    ),
                                    Row(
                                        // ignore: sort_child_properties_last
                                        children: [
                                            const Text('Bạn chưa có tài khoản?'),
                                            TextButton(
                                                child: const Text(
                                                    'Đăng ký',
                                                    style: TextStyle(fontSize: 14),
                                                ),
                                                onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(builder: (context) => const SignupScreen()),
                                                    );
                                                },
                                            )
                                        ],
                                        mainAxisAlignment: MainAxisAlignment.center,
                                    ),
                                ],
                            ),
                        ),
                    )
                );
    }
}