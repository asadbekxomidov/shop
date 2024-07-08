import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vazifalar/controllers/product_controller.dart';
import 'package:vazifalar/models/product.dart';
import 'package:vazifalar/views/screens/card_screen.dart';
import 'package:vazifalar/views/widgets/custom_drawer.dart';
import 'package:vazifalar/views/widgets/product_item.dart';
import 'package:vazifalar/views/widgets/product_widgets.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productsController = Provider.of<ProductsController>(context);

    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        centerTitle: true,
        title: const Text(
          "Products",
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) {
                    return CartScreen();
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.shopping_cart,
              size: 25,
              color: Colors.white,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.add,
              size: 25,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) {
                    return ProductEditScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
      drawer: HomeDrawer(),
      body: ListView.builder(
        itemCount: productsController.list.length,
        itemBuilder: (ctx, index) {
          final product = productsController.list[index];
          return ChangeNotifierProvider<Product>.value(
            value: product,
            builder: (context, child) {
              return Dismissible(
                key: ValueKey(product.id),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  productsController.removeProduct(product.id);
                },
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 20),
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) {
                          return ProductEditScreen(product: product);
                        },
                      ),
                    );
                  },
                  child: const ProductItem(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
