import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

const url = 'https://myshopapp-d2265-default-rtdb.firebaseio.com/';

class Product {
  String id, title, description, imgUrl;
  double price;
  bool isFav;

  Product({
    required this.id,
    required this.description,
    required this.imgUrl,
    required this.title,
    required this.price,
    required this.isFav,
  });
}

class Products with ChangeNotifier {
  List<Product> _allProducts = [];

  List<Product> get getProduct => [..._allProducts];

  Product findById(String id) {
    return _allProducts.firstWhere((element) => element.id == id);
  }

  List<Product> fav() {
    return _allProducts.where((element) => element.isFav == true).toList();
  }

  Future<void> change(String id, bool fav) async {
    String uri = '$url/products/$id.json';
    bool isFav = !fav;
    await patch(Uri.parse(uri), body: json.encode({'isFav': isFav}));

    _allProducts.firstWhere((element) => element.id == id).isFav = !fav;
    notifyListeners();
  }

  Future<void> addProduct({
    required String title,
    required double price,
    required String description,
    required String imgUrl,
    required bool isfav,
  }) async {
    String uri = '$url/products.json';
    var response = await post(Uri.parse(uri),
        body: json.encode({
          'title': title,
          'price': price,
          'description': description,
          'imgUrl': imgUrl,
          'isFav': isfav,
        }));

    print(response.body);
    _allProducts.add(
      Product(
          id: json.decode(response.body)['name'],
          description: description,
          imgUrl: imgUrl,
          title: title,
          price: price,
          isFav: isfav),
    );
    notifyListeners();
  }

  Future<void> getData() async {
    String uri = '$url/products.json';
    var response = await get(Uri.parse(uri));
    Map<String, dynamic> extractedData = json.decode(response.body);
    _allProducts = [];

    if (extractedData == null) {
      return;
    }

    extractedData.forEach((id, value) {
      _allProducts.add(
        Product(
          id: id,
          description: value['description'],
          imgUrl: value['imgUrl'],
          title: value['title'],
          price: value['price'],
          isFav: value['isFav'],
        ),
      );
    });
  }

  void updateProduct({
    required String id,
    required String title,
    required double price,
    required String description,
    required String imgUrl,
  }) {
    notifyListeners();
  }

  Future<void> removeProduct(String id) async {
    String uri = '$url/products/$id.json';
    await delete(Uri.parse(uri));
    notifyListeners();
  }
}
