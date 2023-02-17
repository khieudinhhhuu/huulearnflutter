class ModelUser {
    final String uid;
    final String email;
    final String password;
    final String displayName;
    final String phoneNumber;
    final String address;
    final String photoURL;
    final int follow;
    final String status;
    final String createdUserAt;
    final String lastSignInAt;
    final bool emailVerified;

    ModelUser({
        required this.uid,
        required this.email,
        required this.password,
        required this.displayName,
        required this.phoneNumber,
        required this.address,
        required this.photoURL,
        required this.follow,
        required this.status,
        required this.createdUserAt,
        required this.lastSignInAt,
        required this.emailVerified,
    });

    factory ModelUser.fromJson(Map<String, dynamic> json) => ModelUser(
        uid: json["uid"],
        email: json["email"],
        password: json["password"],
        displayName: json["displayName"],
        phoneNumber: json["phoneNumber"],
        address: json["address"],
        photoURL: json["photoURL"],
        follow: json["follow"],
        status: json["status"],
        createdUserAt: json["createdUserAt"],
        lastSignInAt: json["lastSignInAt"],
        emailVerified: json["emailVerified"],
    );

    Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "password": password,
        "displayName": displayName,
        "phoneNumber": phoneNumber,
        "address": address,
        "photoURL": photoURL,
        "follow": follow,
        "status": status,
        "createdUserAt": createdUserAt,
        "lastSignInAt": lastSignInAt,
        "emailVerified": emailVerified,
    };
}