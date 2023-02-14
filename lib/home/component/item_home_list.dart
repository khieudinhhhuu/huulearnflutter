import 'package:flutter/material.dart';
import 'package:hello_world/home/home_detail.dart';

class ItemHomeList extends StatelessWidget {

    ItemHomeList({Key? key, required this.item});

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
                    width: MediaQuery.of(context).size.width,
                    height: 105,
                    margin: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.green,
                    ),
                    child: Row(
                        children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                    item.imageUrl,
                                    fit: BoxFit.cover,
                                    width: MediaQuery.of(context).size.width * 0.25,
                                    height: 105,
                                ),
                            ),
                            Expanded(
                                child: Container(
                                    padding: const EdgeInsets.only(left: 10, top: 10),
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                            Text(
                                                item.title,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                    color: Colors.black,
                                                ),
                                                maxLines: 1,
                                            ),
                                            const SizedBox(height: 5),
                                            Text(
                                                item.description,
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                    overflow: TextOverflow.ellipsis
                                                ),
                                                maxLines: 2,
                                            ),
                                            const SizedBox(height: 5),
                                            Text(
                                                '${item.price} vnd',
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.red,
                                                ),
                                                maxLines: 1,
                                            ),
                                        ],
                                    ),
                                ),
                            ),
                        ],
                    )
                ),
            );
    }
}
