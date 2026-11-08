import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ApiService {
  // Ganti port sesuai mapping port web server PHP Anda di Docker
  static const String baseUrl = 'http://10.0.2.2/api/products.php';

  // 1. READ (Fetch All)
  static Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Gagal memuat produk');
    }
  }

  // 2. CREATE (Add New Product)
  static Future<bool> addProduct(Map<String, dynamic> productData) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(productData),
    );
    return response.statusCode == 200;
  }

  // 3. UPDATE (Edit Product)
  static Future<bool> updateProduct(Map<String, dynamic> productData) async {
    final response = await http.put(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(productData),
    );
    return response.statusCode == 200;
  }

  // 4. DELETE (Remove Product)
  static Future<bool> deleteProduct(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl?id=$id'));
    return response.statusCode == 200;
  }
  
  static Future<List<Product>> searchProducts(String query) async {
  // Jika menggunakan backend PHP MySQL lokal:
  final response = await http.get(Uri.parse('$baseUrl?q=$query'));
  
  if (response.statusCode == 200) {
    final List data = json.decode(response.body);
    return data.map((json) => Product.fromJson(json)).toList();
  } else {
    throw Exception('Gagal mencari produk');
  }
}
}
