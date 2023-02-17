class ModelBook {
    final String id;
    final String title;
    final String description;
    final double price;
    final String imageUrl;
    //bool isFavorite;

    ModelBook({
        required this.id,
        required this.title,
        required this.description,
        required this.price,
        required this.imageUrl,
        //this.isFavorite = false,
    });

    factory ModelBook.fromJson(Map<String, dynamic> json) => ModelBook(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        price: json["price"],
        imageUrl: json["imageUrl"],
        //isFavorite: json["isFavorite"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "price": price,
        "imageUrl": imageUrl,
        //"isFavorite": isFavorite,
    };
}