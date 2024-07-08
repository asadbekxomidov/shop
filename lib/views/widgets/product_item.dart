import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vazifalar/controllers/card_controller.dart';
import 'package:vazifalar/models/product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: product.color,
      ),
      title: Text(
        product.title,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
      subtitle: Text(
        "\$${product.price}",
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      trailing: Consumer<CartController>(
        builder: (context, controller, child) {
          print(product.title);

          return controller.isInCart(product.id)
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.removeFromCart(product.id);
                      },
                      icon: const Icon(
                        Icons.remove_circle,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      controller.getProductAmount(product.id).toString(),
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        controller.addToCart(product);
                      },
                      icon: const Icon(
                        Icons.add_circle,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
              : IconButton(
                  onPressed: () {
                    controller.addToCart(product);
                  },
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                  ),
                );
        },
      ),
    );
  }
}
