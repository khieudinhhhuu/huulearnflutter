// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ModelLike {
    final String id;
    final String photoURL;
    final String displayName;
    final String uid;

    ModelLike({
        required this.id,
        required this.photoURL,
        required this.displayName,
        required this.uid,
    });

    ModelLike copyWith({
        String? id,
        String? photoURL,
        String? displayName,
        String? uid,
    }) {
        return ModelLike(
        id: id ?? this.id,
        photoURL: photoURL ?? this.photoURL,
        displayName: displayName ?? this.displayName,
        uid: uid ?? this.uid,
        );
    }

    Map<String, dynamic> toMap() {
        return <String, dynamic>{
            'id': id,
            'photoURL': photoURL,
            'displayName': displayName,
            'uid': uid,
        };
    }

    factory ModelLike.fromMap(Map<String, dynamic> map) {
        return ModelLike(
            id: map['id'] as String,
            photoURL: map['photoURL'] as String,
            displayName: map['displayName'] as String,
            uid: map['uid'] as String,
        );
    }

    String toJson() => json.encode(toMap());

    factory ModelLike.fromJson(String source) => ModelLike.fromMap(json.decode(source) as Map<String, dynamic>);

    @override
    String toString() {
        return 'ModelLike(id: $id, photoURL: $photoURL, displayName: $displayName, uid: $uid)';
    }

    @override
    bool operator ==(covariant ModelLike other) {
        if (identical(this, other)) return true;
    
        return 
        other.id == id &&
        other.photoURL == photoURL &&
        other.displayName == displayName &&
        other.uid == uid;
    }

    @override
    int get hashCode {
        return id.hashCode ^
        photoURL.hashCode ^
        displayName.hashCode ^
        uid.hashCode;
    }
}
