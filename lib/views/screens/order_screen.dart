import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vazifalar/controllers/order_controller.dart';
import 'package:vazifalar/views/widgets/custom_drawer.dart';
import 'package:vazifalar/views/widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orderController = Provider.of<OrderController>(context);

    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        centerTitle: true,
        title: const Text(
          "Orders",
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      drawer: HomeDrawer(),
      body: ListView.builder(
        itemCount: orderController.orders.length,
        itemBuilder: (ctx, index) {
          final order = orderController.orders[index];
          return OrderItem(order: order);
        },
      ),
    );
  }
}
