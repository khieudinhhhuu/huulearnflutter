// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ModelLike {
    final String id;
    final String photoURL;
    final String displayName;
    final String comment;
    final int likeComment;
    final String createdDate;
    final String uid;

    ModelLike({
        required this.id,
        required this.photoURL,
        required this.displayName,
        required this.comment,
        required this.likeComment,
        required this.createdDate,
        required this.uid,
    });

    ModelLike copyWith({
        String? id,
        String? photoURL,
        String? displayName,
        String? comment,
        int? likeComment,
        String? createdDate,
        String? uid,
    }) {
        return ModelLike(
        id: id ?? this.id,
        photoURL: photoURL ?? this.photoURL,
        displayName: displayName ?? this.displayName,
        comment: comment ?? this.comment,
        likeComment: likeComment ?? this.likeComment,
        createdDate: createdDate ?? this.createdDate,
        uid: uid ?? this.uid,
        );
    }

    Map<String, dynamic> toMap() {
        return <String, dynamic>{
        'id': id,
        'photoURL': photoURL,
        'displayName': displayName,
        'comment': comment,
        'likeComment': likeComment,
        'createdDate': createdDate,
        'uid': uid,
        };
    }

    factory ModelLike.fromMap(Map<String, dynamic> map) {
        return ModelLike(
        id: map['id'] as String,
        photoURL: map['photoURL'] as String,
        displayName: map['displayName'] as String,
        comment: map['comment'] as String,
        likeComment: map['likeComment'] as int,
        createdDate: map['createdDate'] as String,
        uid: map['uid'] as String,
        );
    }

    String toJson() => json.encode(toMap());

    factory ModelLike.fromJson(String source) => ModelLike.fromMap(json.decode(source) as Map<String, dynamic>);

    @override
    String toString() {
        return 'ModelLike(id: $id, photoURL: $photoURL, displayName: $displayName, comment: $comment, likeComment: $likeComment, createdDate: $createdDate, uid: $uid)';
    }

    @override
    bool operator ==(covariant ModelLike other) {
        if (identical(this, other)) return true;
    
        return 
        other.id == id &&
        other.photoURL == photoURL &&
        other.displayName == displayName &&
        other.comment == comment &&
        other.likeComment == likeComment &&
        other.createdDate == createdDate &&
        other.uid == uid;
    }

    @override
    int get hashCode {
        return id.hashCode ^
        photoURL.hashCode ^
        displayName.hashCode ^
        comment.hashCode ^
        likeComment.hashCode ^
        createdDate.hashCode ^
        uid.hashCode;
    }
}
