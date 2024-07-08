class Order {
  final String id;
  final Map<String, dynamic> products;
  final DateTime date;

  Order({
    required this.id,
    required this.products,
    required this.date,
  });

  get totalPrice => null;

}
// import 'dart:html';

// import 'package:flutter/material.dart';

// class Order {
//   final String id;
//   final Map<String, dynamic> products;
//   final DateTime date;
//   double totalPrice; // totalPrice qo'shiladi

//   Order({
//     required this.id,
//     required this.products,
//     required this.date,
//     required this.totalPrice
//   }) {
//     calculateTotalPrice();
//   }

//   void calculateTotalPrice() {
//     double total = 0;
//     products.forEach((key, value) {
//       total += value['quantity'] * value['product'].price;
//     });
//     totalPrice = total;
//   }
// }
