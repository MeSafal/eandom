// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';
// import 'dart:ffi';

List<Post> postFromJson(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
    Post({
        this.id ,
        this.name,
        this.description,
        this.price,
        this.stars,
        this.people,
        this.selectedPeople,
        this.img,
        this.location,
        // this.createdAt,
        // this.updatedAt,
    });

    int? id;
    String? name;
    String? description;
    int? price;
    int? stars;
    int? people;
    int? selectedPeople;
    String? img;
    String? location;
    // DateTime? createdAt;
    // DateTime? updatedAt;

    factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        stars: json["stars"],
        people: json["people"],
        selectedPeople: json["selected_people"],
        img: json["img"],
        location: json["location"],
        // createdAt: DateTime.parse(json["created_at"]),
        // updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "stars": stars,
        "people": people,
        "selected_people": selectedPeople,
        "img": img,
        "location": location,
        // "created_at": createdAt.toIso8601String(),
        // "updated_at": updatedAt.toIso8601String(),
    };
}
