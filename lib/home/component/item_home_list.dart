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
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(builder: (context) =>  HomeDetail(text: 'heollo', item: item)),
                    // );
                },
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(top: 7),
                    color: Colors.white,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Container(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        Container(
                                            margin: const EdgeInsets.only(right: 10),
                                            child: ClipRRect(
                                                borderRadius: BorderRadius.circular(20),
                                                child: Image.network(
                                                    'https://cdn.iconscout.com/icon/free/png-256/avatar-370-456322.png',
                                                    fit: BoxFit.cover,
                                                    width: 40,
                                                    height: 40,
                                                ),
                                            ),
                                        ),
                                        Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                                const Text(
                                                    'Khiếu Đình Huế Hữu',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.w600,
                                                        fontSize: 16,
                                                    ),
                                                ),
                                                Container(
                                                    margin: const EdgeInsets.only(top: 3),
                                                    child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: const [
                                                            Text(
                                                                '47 phút',
                                                                style: TextStyle(
                                                                    color: Colors.black,
                                                                    fontWeight: FontWeight.w400,
                                                                    fontSize: 13,
                                                                ),
                                                            ),
                                                            Text(
                                                                ' • ',
                                                                style: TextStyle(
                                                                    color: Colors.black,
                                                                    fontWeight: FontWeight.w400,
                                                                    fontSize: 13,
                                                                ),
                                                            ),
                                                            Icon(Icons.public, size: 13),
                                                        ],
                                                    ),
                                                ),
                                            ],
                                        ),
                                    ],
                                ),
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 7),
                                child: Text(
                                    item.title,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                    ),
                                    maxLines: 1,
                                ),
                            ),
                            ClipRRect(
                                borderRadius: BorderRadius.circular(0),
                                child: Image.network(
                                    item.images,
                                    fit: BoxFit.contain,
                                    width: MediaQuery.of(context).size.width,
                                ),
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                                decoration: const BoxDecoration(
                                    border: Border(
                                        top: BorderSide(color: Color.fromARGB(255, 172, 170, 170), width: 0.5),
                                    )
                                ),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                        Row(
                                            children: const [
                                                Icon(Icons.favorite, size: 20, color: Colors.red),
                                                Text(
                                                    '300',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.grey,
                                                    ),
                                                    maxLines: 1,
                                                ),
                                            ],
                                        ),
                                        Container(
                                            child: Text(
                                                '389 bình luận',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.grey,
                                                ),
                                                maxLines: 1,
                                            ),
                                        ),
                                        Container(
                                            child: Text(
                                                '34 lượt chia sẻ',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.grey,
                                                ),
                                                maxLines: 1,
                                            ),
                                        ),
                                    ],
                                ),
                            ),
                            Container(
                                padding: const EdgeInsets.all(10),
                                margin: const EdgeInsets.only(left: 10, right: 10),
                                decoration: const BoxDecoration(
                                    border: Border(
                                        top: BorderSide(color: Color.fromARGB(255, 172, 170, 170), width: 0.5),
                                    )
                                ),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                        Row(
                                            children: const [
                                                Icon(Icons.favorite_border, color: Colors.grey),
                                                SizedBox( width: 5),
                                                Text(
                                                    'Thích',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.grey,
                                                        fontWeight: FontWeight.w500,
                                                    ),
                                                    maxLines: 1,
                                                ),
                                            ],
                                        ),
                                        Row(
                                            children: const [
                                                Icon(Icons.mode_comment_outlined, size: 20, color: Colors.grey,),
                                                SizedBox( width: 5),
                                                Text(
                                                    'Bình luận',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.grey,
                                                        fontWeight: FontWeight.w500,
                                                    ),
                                                    maxLines: 1,
                                                ),
                                            ],
                                        ),
                                        Row(
                                            children: const [
                                                Icon(Icons.share_outlined, size: 20, color: Colors.grey),
                                                SizedBox( width: 5),
                                                Text(
                                                    'Chia sẻ',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.grey,
                                                        fontWeight: FontWeight.w500,
                                                    ),
                                                    maxLines: 1,
                                                ),
                                            ],
                                        ),
                                    ],
                                ),
                            ),
                        ],
                    )
                ),
            );
    }
}
