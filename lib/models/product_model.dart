class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final double rating;
  final String thumbnail;
  final List<String> images;
  final String category;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.thumbnail,
    required this.images,
    required this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
  return Product(
    // Gunakan int.parse jika data dari API berbentuk String ("1")
    id: json['id'] is int ? json['id'] : int.parse(json['id'].toString()),
    title: json['title'] ?? '',
    description: json['description'] ?? '',
    // Conversion aman untuk price (String / int / double)
    price: (json['price'] is num)
        ? (json['price'] as num).toDouble()
        : double.parse(json['price'].toString()),
    // Conversion aman untuk rating
    rating: json['rating'] != null
        ? (json['rating'] is num
            ? (json['rating'] as num).toDouble()
            : double.tryParse(json['rating'].toString()) ?? 0.0)
        : 0.0,
    thumbnail: json['thumbnail'] ?? '',
    images: json['images'] != null ? List<String>.from(json['images']) : [],
    category: json['category'] ?? '',
  );
}
}