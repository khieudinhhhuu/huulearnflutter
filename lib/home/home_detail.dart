import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeDetail extends StatelessWidget {
  HomeDetail({Key? key, required this.text, required this.item});

  String text;
  dynamic item;

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
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                const Text(
                  'Home Detail',
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
              child: Column(
                children: [
                //   ClipRRect(
                //     borderRadius: BorderRadius.circular(0),
                //     child: Image.network(
                //       'https://mtrend.vn/wp-content/uploads/2019/05/anh-bien-dep-3.jpg',
                //       fit: BoxFit.cover,
                //       width: MediaQuery.of(context).size.width,
                //       height: 300,
                //     ),
                //   ),
                  Center(
                    child: InteractiveViewer(
                      panEnabled: false, // Set it to false
                      boundaryMargin: EdgeInsets.all(100),
                      minScale: 0.5,
                      maxScale: 2,
                      child: Image.network(
                        item?.imageUrl,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                        height: 300,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    margin: const EdgeInsets.only(top: 20),
                    child: Text(
                      item?.title ?? 'Beginning Flutter With Dart',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      'Price: ${item?.price}',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      'Description: ${item?.description}',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
