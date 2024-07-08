import 'package:flutter/material.dart';
import 'package:vazifalar/models/product.dart';

class ProductsController extends ChangeNotifier {
  final List<Product> _list = [
    Product(
      id: UniqueKey().toString(),
      title: "iPhone",
      color: Colors.teal,
      price: 340.5,
    ),
    Product(
      id: UniqueKey().toString(),
      title: "Macbook",
      color: Colors.grey,
      price: 1340.5,
    ),
    Product(
      id: UniqueKey().toString(),
      title: "AirPods",
      color: Colors.blue,
      price: 140.5,
    ),
  ];

  List<Product> get list {
    return [..._list];
  }

  void addProduct(Product product) {
    _list.add(product);
    notifyListeners();
  }

  void editProduct(Product newProduct) {
    final index = _list.indexWhere((product) => product.id == newProduct.id);
    if (index >= 0) {
      _list[index] = newProduct;
      notifyListeners();
    }
  }

  void removeProduct(String id) {
    _list.removeWhere((product) => product.id == id);
    notifyListeners();
  }
}
