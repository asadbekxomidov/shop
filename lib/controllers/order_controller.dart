import 'package:flutter/material.dart';
import 'package:vazifalar/models/card.dart';
import 'package:vazifalar/models/order.dart';

class OrderController extends ChangeNotifier {
  final List<Order> _orders = [];

  List<Order> get orders {
    return [..._orders];
  }

  void addOrder(Cart cart) {
    _orders.insert(
      0,
      Order(
        id: UniqueKey().toString(),
        products: cart.products,
        date: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
