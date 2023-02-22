import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class PostScreen extends StatefulWidget {
    const PostScreen({super.key});

    @override
    State<PostScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<PostScreen> {

    TextEditingController titlePost = TextEditingController();
    File? imagePost;

    void addImage () async {
        // final ImagePicker _picker = ImagePicker();
        // final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
        // if (image != null) {
        //     setState(() {
        //         imagePost = File(image.path);
        //     });
        // }

        final metadata = SettableMetadata(contentType: "image/jpeg");
        final storageRef = FirebaseStorage.instance.ref();

        //Check Permissions
        await Permission.photos.request();

        var permissionStatus = await Permission.photos.status;

        if (permissionStatus.isGranted){
            final ImagePicker _picker = ImagePicker();
            final XFile? imageFile = await _picker.pickImage(source: ImageSource.gallery);
            if (imageFile != null) {
                var file = File(imageFile.path);
                //Upload to Firebase
                var snapshot = await storageRef.child('images/imageName').putFile(file, metadata);
                var downloadUrl = await snapshot.ref.getDownloadURL();
                print('ket qua day: ${downloadUrl}');
                // setState(() {
                //     imagePost = downloadUrl;
                // });
            } else {
                print('No Image Path Received');
            }
        } else {
            print('Permission not granted. Try Again with permission access');
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
        return SafeArea(
            child: Scaffold(
                body: Column(
                children: [
                    Container(
                        height: 50,
                        alignment: Alignment.center,
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                                IconButton(
                                    onPressed: () {
                                        Navigator.pop(context);
                                    },
                                    icon: const Icon(Icons.close),
                                ),
                                const Text(
                                    'Tạo bài viết',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                    ),
                                ),
                                Container(
                                    padding: const EdgeInsets.all(7),
                                    margin: const EdgeInsets.only(right: 15),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: const Color.fromARGB(255, 207, 213, 216),
                                    ),
                                    child: const Text(
                                        'Đăng',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                        ),
                                    ),
                                ),
                            ],
                        ),
                    ),
                    Expanded(
                        child: SingleChildScrollView(
                            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                            padding: const EdgeInsets.only(bottom: 30),
                            child: Column(
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
                                                            margin: const EdgeInsets.only(top: 5),
                                                            child: Row(
                                                                children: [
                                                                    Container(
                                                                        padding: const EdgeInsets.only(left: 5, right: 5),
                                                                        margin: const EdgeInsets.only(right: 10),
                                                                        decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(5),
                                                                            border: Border.all(color: const Color.fromARGB(255, 167, 167, 167))
                                                                        ),
                                                                        child: Row(
                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                            children: const [
                                                                                Icon(Icons.lock, size: 13),
                                                                                SizedBox( width: 3),
                                                                                Text(
                                                                                    'Công khai',
                                                                                    style: TextStyle(
                                                                                        color: Colors.black,
                                                                                        fontWeight: FontWeight.w400,
                                                                                        fontSize: 13,
                                                                                    ),
                                                                                ),
                                                                                Icon(Icons.arrow_drop_down),
                                                                            ],
                                                                        ),
                                                                    ),
                                                                    Container(
                                                                        padding: const EdgeInsets.only(left: 5, right: 5),
                                                                        margin: const EdgeInsets.only(right: 10),
                                                                        decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(5),
                                                                            border: Border.all(color: const Color.fromARGB(255, 167, 167, 167))
                                                                        ),
                                                                        child: Row(
                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                            children: const [
                                                                                Icon(Icons.add, size: 13),
                                                                                Text(
                                                                                    'Album',
                                                                                    style: TextStyle(
                                                                                        color: Colors.black,
                                                                                        fontWeight: FontWeight.w400,
                                                                                        fontSize: 13,
                                                                                    ),
                                                                                ),
                                                                                Icon(Icons.arrow_drop_down),
                                                                            ],
                                                                        ),
                                                                    ),
                                                                ],
                                                            ),
                                                        ),
                                                    ],
                                                ),
                                            ],
                                        ),
                                    ),
                                    TextFormField(
                                        autovalidateMode: AutovalidateMode.onUserInteraction,
                                        controller: titlePost,
                                        keyboardType: TextInputType.multiline,
                                        maxLines: null,
                                        textCapitalization: TextCapitalization.sentences,
                                        decoration: const InputDecoration(
                                            contentPadding: EdgeInsets.all(10),
                                            border: InputBorder.none,
                                            hintText: 'Bạn đang nghĩ gì?',
                                        ),
                                        style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                        ),
                                    ),
                                    Stack(
                                        children: [
                                            imagePost != null
                                            ? Image.file(
                                                imagePost!,
                                                fit: BoxFit.contain,
                                                //width: MediaQuery.of(context).size.width,
                                                //height: 220,
                                            )
                                            : const Text('Please select an image'),
                                            Positioned(
                                                top: 10,
                                                right: 13,
                                                child: Container(
                                                    padding: const EdgeInsets.all(1),
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(5),
                                                        color: Colors.black,
                                                    ),
                                                    child: const Icon(Icons.close, color: Colors.white),
                                                ),
                                            ),
                                        ] 
                                    ),
                                ],
                            ),
                        ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 10),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                            color: Colors.white,
                            boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 3,
                                    blurRadius: 3,
                                    offset: Offset(0, 3), // changes position of shadow
                                ),
                            ],
                        ),
                        child: GestureDetector(
                            onTap: () {
                                showModalBottomSheet<void>(
                                    backgroundColor: Colors.transparent,
                                    barrierColor: Colors.transparent,
                                    context: context,
                                    builder: (BuildContext context) {
                                    return Container(
                                        height: 250,
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                                            color: Colors.white,
                                            boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey,
                                                    spreadRadius: 3,
                                                    blurRadius: 3,
                                                    offset: Offset(0, 3),
                                                ),
                                            ],
                                        ),
                                        child: Container(
                                            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                                            child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                //crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                    GestureDetector(
                                                        onTap: (){
                                                            addImage();
                                                        },
                                                        child: Container(
                                                            alignment: Alignment.centerLeft,
                                                            margin: const EdgeInsets.only(top: 15),
                                                            child: Row(
                                                                children: const [
                                                                    Icon(Icons.image, color: Colors.green, size: 30),
                                                                    SizedBox( width: 10),
                                                                    Text(
                                                                        'Ảnh/video',
                                                                        style: TextStyle(
                                                                            color: Colors.black,
                                                                            fontSize: 15,
                                                                        ),
                                                                    ),
                                                                ],
                                                            ),
                                                        ),
                                                    ),
                                                    Container(
                                                        alignment: Alignment.centerLeft,
                                                        margin: const EdgeInsets.only(top: 15),
                                                        child: Row(
                                                            children: const [
                                                                Icon(Icons.person, color: Colors.blue, size: 30),
                                                                SizedBox( width: 10),
                                                                Text(
                                                                    'Gắn thẻ người khác',
                                                                    style: TextStyle(
                                                                        color: Colors.black,
                                                                        fontSize: 15,
                                                                    ),
                                                                ),
                                                            ],
                                                        ),
                                                    ),
                                                    Container(
                                                        alignment: Alignment.centerLeft,
                                                        margin: const EdgeInsets.only(top: 15),
                                                        child: Row(
                                                            children: const [
                                                                Icon(Icons.tag_faces, color: Colors.yellow, size: 30),
                                                                SizedBox( width: 10),
                                                                Text(
                                                                    'Cảm xúc/Hoạt động',
                                                                    style: TextStyle(
                                                                        color: Colors.black,
                                                                        fontSize: 15,
                                                                    ),
                                                                ),
                                                            ],
                                                        ),
                                                    ),
                                                    Container(
                                                        alignment: Alignment.centerLeft,
                                                        margin: const EdgeInsets.only(top: 15),
                                                        child: Row(
                                                            children: const [
                                                                Icon(Icons.location_disabled, color: Colors.red, size: 30),
                                                                SizedBox( width: 10),
                                                                Text(
                                                                    'Check in',
                                                                    style: TextStyle(
                                                                        color: Colors.black,
                                                                        fontSize: 15,
                                                                    ),
                                                                ),
                                                            ],
                                                        ),
                                                    ),
                                                ],
                                            ),
                                        ),
                                    );
                                    },
                                );
                            },
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                    Text(
                                        'Thêm vào bài viết của bạn',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 16,
                                        ),
                                    ),
                                    Icon(Icons.image, color: Colors.green, size: 30),
                                    Icon(Icons.person, color: Colors.blue, size: 30),
                                    Icon(Icons.tag_faces, color: Colors.yellow, size: 30),
                                    Icon(Icons.location_disabled, color: Colors.red, size: 30),
                                ],
                            ),
                        ),
                    ),
                ],
            )),
        );
    }
}