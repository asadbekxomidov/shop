import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vazifalar/controllers/card_controller.dart';
import 'package:vazifalar/controllers/order_controller.dart';
import 'package:vazifalar/models/product.dart';
import 'package:vazifalar/views/widgets/custom_drawer.dart';
import 'package:vazifalar/views/widgets/product_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Provider.of<CartController>(context);

    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        centerTitle: true,
        title: const Text(
          "Shopping cart",
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      drawer: HomeDrawer(),
      body: cartController.cart.products.isEmpty
          ? const Center(
              child: Text("Cart is empty, add products"),
            )
          : ListView.builder(
              itemCount: cartController.cart.products.length,
              itemBuilder: (ctx, index) {
                final product = cartController.cart.products.values
                    .toList()[index]['product'];
                return ChangeNotifierProvider<Product>.value(
                  value: product,
                  builder: (context, child) {
                    return const ProductItem();
                  },
                );
              },
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        shape: const RoundedRectangleBorder(),
        onPressed: () {
          Provider.of<OrderController>(context, listen: false)
              .addOrder(cartController.cart);
          cartController.clearCart();
        },
        label: Text(
          "\$${cartController.cart.totalPrice}",
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
