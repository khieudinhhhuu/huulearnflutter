// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ModelPost {
    final String? id;
    final String? title;
    final String? images;
    final String createdDate;
    final List? likes;
    final List? comments;
    final int share;
    final String idUser;

    ModelPost(
        this.id,
        this.title,
        this.images,
        this.createdDate,
        this.likes,
        this.comments,
        this.share,
        this.idUser,
    );


    ModelPost copyWith({
        String? id,
        String? title,
        String? images,
        String? createdDate,
        List? likes,
        List? comments,
        int? share,
        String? idUser,
    }) {
        return ModelPost(
        id ?? this.id,
        title ?? this.title,
        images ?? this.images,
        createdDate ?? this.createdDate,
        likes ?? this.likes,
        comments ?? this.comments,
        share ?? this.share,
        idUser ?? this.idUser,
        );
    }

    Map<String, dynamic> toMap() {
        return <String, dynamic>{
            'id': id,
            'title': title,
            'images': images,
            'createdDate': createdDate,
            'likes': likes?.toMap(),
            'comments': comments?.toMap(),
            'share': share,
            'idUser': idUser,
        };
    }

    factory ModelPost.fromMap(Map<String, dynamic> map) {
        return ModelPost(
            map['id'] != null ? map['id'] as String : null,
            map['title'] != null ? map['title'] as String : null,
            map['images'] != null ? map['images'] as String : null,
            map['createdDate'] as String,
            map['likes'] != null ? List.fromMap(map['likes'] as Map<String,dynamic>) : null,
            map['comments'] != null ? List.fromMap(map['comments'] as Map<String,dynamic>) : null,
            (map['share'] != null ? map['share'] as String : null) as int,
            map['idUser'] as String,
        );
    }

    String toJson() => json.encode(toMap());

    factory ModelPost.fromJson(String source) => ModelPost.fromMap(json.decode(source) as Map<String, dynamic>);

    @override
    String toString() {
        return 'ModelPost(id: $id, title: $title, images: $images, createdDate: $createdDate, likes: $likes, comments: $comments, share: $share, idUser: $idUser)';
    }

    @override
    bool operator ==(covariant ModelPost other) {
        if (identical(this, other)) return true;
        return 
        other.id == id &&
        other.title == title &&
        other.images == images &&
        other.createdDate == createdDate &&
        other.likes == likes &&
        other.comments == comments &&
        other.share == share &&
        other.idUser == idUser;
    }

    @override
    int get hashCode {
        return id.hashCode ^
        title.hashCode ^
        images.hashCode ^
        createdDate.hashCode ^
        likes.hashCode ^
        comments.hashCode ^
        share.hashCode ^
        idUser.hashCode;
    }
}
