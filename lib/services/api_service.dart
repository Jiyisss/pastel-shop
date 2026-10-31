import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ApiService {
  static const String baseUrl = 'https://dummyjson.com/products';

  // Fetch semua produk
  static Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List productsJson = data['products'];
      return productsJson.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Gagal memuat produk');
    }
  }

  // Search produk berdasarkan keyword
  static Future<List<Product>> searchProducts(String query) async {
    final response = await http.get(Uri.parse('$baseUrl/search?q=$query'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List productsJson = data['products'];
      return productsJson.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Gagal mencari produk');
    }
  }
}