// To parse this JSON data, do
//
//     final userFeed = userFeedFromJson(jsonString);

import 'dart:convert';

List<UserFeed> userFeedFromJson(String str) => List<UserFeed>.from(json.decode(str).map((x) => UserFeed.fromJson(x)));

String userFeedToJson(List<UserFeed> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserFeed {
    final String? id;
    final String? image;
    final int? likes;
    final List<String>? tags;
    final String? text;
    final DateTime? publishDate;
    final Owner? owner;

    UserFeed({
        this.id,
        this.image,
        this.likes,
        this.tags,
        this.text,
        this.publishDate,
        this.owner,
    });

    UserFeed copyWith({
        String? id,
        String? image,
        int? likes,
        List<String>? tags,
        String? text,
        DateTime? publishDate,
        Owner? owner,
    }) => 
        UserFeed(
            id: id ?? this.id,
            image: image ?? this.image,
            likes: likes ?? this.likes,
            tags: tags ?? this.tags,
            text: text ?? this.text,
            publishDate: publishDate ?? this.publishDate,
            owner: owner ?? this.owner,
        );

    factory UserFeed.fromJson(Map<String, dynamic> json) => UserFeed(
        id: json["id"],
        image: json["image"],
        likes: json["likes"],
        tags: json["tags"] == null ? [] : List<String>.from(json["tags"]!.map((x) => x)),
        text: json["text"],
        publishDate: json["publishDate"] == null ? null : DateTime.parse(json["publishDate"]),
        owner: json["owner"] == null ? null : Owner.fromJson(json["owner"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "likes": likes,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "text": text,
        "publishDate": publishDate?.toIso8601String(),
        "owner": owner?.toJson(),
    };
}

class Owner {
    final String? id;
    final String? title;
    final String? firstName;
    final String? lastName;
    final String? picture;

    Owner({
        this.id,
        this.title,
        this.firstName,
        this.lastName,
        this.picture,
    });

    Owner copyWith({
        String? id,
        String? title,
        String? firstName,
        String? lastName,
        String? picture,
    }) => 
        Owner(
            id: id ?? this.id,
            title: title ?? this.title,
            firstName: firstName ?? this.firstName,
            lastName: lastName ?? this.lastName,
            picture: picture ?? this.picture,
        );

    factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        id: json["id"],
        title: json["title"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        picture: json["picture"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "firstName": firstName,
        "lastName": lastName,
        "picture": picture,
    };
}
