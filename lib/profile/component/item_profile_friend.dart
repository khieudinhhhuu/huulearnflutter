import 'package:flutter/material.dart';

class ItemProfileFriend extends StatelessWidget {

    ItemProfileFriend({Key? key, required this.item});

    dynamic item;

    @override
    Widget build(BuildContext context) {
        return 
            GestureDetector(
                onTap: (){
                    
                },
                child: Container(
                    margin: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: const Color.fromARGB(255, 207, 213, 216),
                    ),
                    child: Column(
                        children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                    item.imageUrl,
                                    fit: BoxFit.cover,
                                    height: 110,
                                ),
                            ),
                            Container(
                                margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                    item.title,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: Colors.black,
                                    ),
                                    maxLines: 1,
                                ),
                            ),
                        ]
                    ),
                ),
            );
    }
}
