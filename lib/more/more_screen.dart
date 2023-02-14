import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hello_world/home/home_detail.dart';
import 'package:hello_world/more/profile_screen.dart';

class MoreScreen extends StatefulWidget {
    const MoreScreen({super.key});

    @override
    State<MoreScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MoreScreen> {

    final menu = [
        'Thong bao',
        'Cai dat',
        'Tro giup',
        'Dang xuat',
    ];

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
                                    MaterialPageRoute(builder: (context) =>  const ProfileScreen()),
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
                                    itemBuilder: (context, index) {
                                        return 
                                            GestureDetector(
                                                onTap: (){
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(builder: (context) =>  Text('')),
                                                    );
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
