import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:hello_world/model/model_comment.dart';
import 'package:hello_world/model/model_like.dart';

class ModelPost {
    final String? id;
    final String? title;
    final String? images;
    final String createdDate;
    final List<ModelLike>? likes;
    final List<ModelComment>? comments;
    final int share;
    final String idUser;

    ModelPost({
        this.id,
        this.title,
        this.images,
        required this.createdDate,
        this.likes,
        this.comments,
        required this.share,
        required this.idUser,
    });


    ModelPost copyWith({
        String? id,
        String? title,
        String? images,
        String? createdDate,
        List<ModelLike>? likes,
        List<ModelComment>? comments,
        int? share,
        String? idUser,
    }) {
        return ModelPost(
            id: id ?? this.id,
            title: title ?? this.title,
            images: images ?? this.images,
            createdDate: createdDate ?? this.createdDate,
            likes: likes ?? this.likes,
            comments: comments ?? this.comments,
            share: share ?? this.share,
            idUser: idUser ?? this.idUser,
        );
    }

    Map<String, dynamic> toMap() {
        return <String, dynamic>{
            'id': id,
            'title': title,
            'images': images,
            'createdDate': createdDate,
            'likes': likes?.map((x) => x.toMap()).toList(),
            'comments': comments?.map((x) => x.toMap()).toList(),
            'share': share.toInt(),
            'idUser': idUser,
        };
    }

    factory ModelPost.fromMap(Map<String, dynamic> map) {
        return ModelPost(
            id: map['id'] != null ? map['id'] as String : null,
            title: map['title'] != null ? map['title'] as String : null,
            images: map['images'] != null ? map['images'] as String : null,
            createdDate: map['createdDate'].toString(),
            likes: map['likes'] != null ? List<ModelLike>.from((map['likes'] as List<int>).map<ModelLike?>((x) => ModelLike.fromMap(x as Map<String,dynamic>),),) : null,
            comments: map['comments'] != null ? List<ModelComment>.from((map['comments'] as List<int>).map<ModelComment?>((x) => ModelComment.fromMap(x as Map<String,dynamic>),),) : null,
            share: map['share'] as int,
            idUser: map['idUser'].toString(),
        );
    }

    String toJson() => json.encode(toMap());

  //  factory ModelPost.fromJson(Map<String, dynamic> data) => ModelPost.fromMap(json.decode() as Map<String, dynamic>);

    @override
    String toString() {
        return 'ModelPost(id: $id, title: $title, images: $images, createdDate: $createdDate, likes: $likes, comments: $comments, share: ${share.toString()}, idUser: $idUser)';
    }

    @override
    bool operator ==(covariant ModelPost other) {
        if (identical(this, other)) return true;
    
        return 
        other.id == id &&
        other.title == title &&
        other.images == images &&
        other.createdDate == createdDate &&
        listEquals(other.likes, likes) &&
        listEquals(other.comments, comments) &&
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




