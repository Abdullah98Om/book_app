class BookModel {
  final String id;
  final String title;
  final String author;
  final double price;
  final String category;
  final String image;
  final String? description;

  BookModel({
    required this.id,
    required this.title,
    required this.author,
    required this.price,
    required this.category,
    required this.image,
    this.description,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id'],
      title: json['title'],
      author: json['author'],
      price: double.tryParse(json['price'].toString()) ?? 0.0,
      category: json['category'],
      image: json['image'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "author": author,
        "price": price,
        "category": category,
        "image": image,
        "description": description,
      };
}
