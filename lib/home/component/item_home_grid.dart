import 'package:flutter/material.dart';
import 'package:hello_world/home/home_detail.dart';

class ItemHomeGrid extends StatelessWidget {

    ItemHomeGrid({Key? key, required this.item});

    dynamic item;

    @override
    Widget build(BuildContext context) {
        return 
            GestureDetector(
                onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  HomeDetail(text: 'heollo', item: item)),
                    );
                },
                child: Container(
                    margin: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.green,
                    ),
                    child: Column(
                        children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                    item.imageUrl,
                                    fit: BoxFit.cover,
                                    height: 140,
                                ),
                            ),
                            Container(
                                margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                    item.title,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.black,
                                    ),
                                    maxLines: 1,
                                ),
                            ),
                            Container(
                                margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                    item.description,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        overflow: TextOverflow.ellipsis
                                    ),
                                    maxLines: 2,
                                ),
                            ),
                            Container(
                                margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                    '${item.price} vnd',
                                    style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.red,
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
