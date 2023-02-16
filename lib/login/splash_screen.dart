import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hello_world/login/signin_screen.dart';
import 'package:hello_world/tab/tabnavigator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
    const SplashScreen({super.key});

    @override
    State<SplashScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SplashScreen> {

    @override
    void initState() {
        super.initState();

        checkToken();
    }

    void checkToken () async {
        final prefs = await SharedPreferences.getInstance();
        final String? token = prefs.getString('TOKEN');

        if (token != null) {
            var future = new Future.delayed(const Duration(milliseconds: 3000), () => {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const TabNavigator()),
                ),
            });
        } else {
            var future = new Future.delayed(const Duration(milliseconds: 3000), () => {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const SigninScreen()),
                ),
            });
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
                    body: 
                       ClipRRect(
                            child: Image.network(
                                'https://images.mubicdn.net/images/film/155526/cache-156771-1639429610/image-w1280.jpg?size=800x',
                                fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                            ),
                        ),
                ),
            );
    }
}