// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vazifalar/controllers/product_controller.dart';
import 'package:vazifalar/models/product.dart';
import 'package:vazifalar/views/widgets/custom_drawer.dart';

class ProductEditScreen extends StatelessWidget {
  final Product? product;
  final TextEditingController titleController;
  final TextEditingController priceController;
  final TextEditingController colorController;

  ProductEditScreen({Key? key, this.product})
      : titleController = TextEditingController(text: product?.title ?? ''),
        priceController =
            TextEditingController(text: product?.price.toString() ?? ''),
        colorController = TextEditingController(
            text: product?.color.value.toRadixString(16) ?? ''),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade900,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text(
          product == null ? 'Add Product' : 'Edit Product',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.save,
              size: 25,
              color: Colors.white,
            ),
            onPressed: () {
              final newProduct = Product(
                id: product?.id ?? UniqueKey().toString(),
                title: titleController.text,
                price: double.parse(priceController.text),
                color: Color(int.parse('0xff' + colorController.text)),
              );

              if (product == null) {
                Provider.of<ProductsController>(context, listen: false)
                    .addProduct(newProduct);
              } else {
                Provider.of<ProductsController>(context, listen: false)
                    .editProduct(newProduct);
              }

              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      drawer: HomeDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              TextField(
                controller: priceController,
                decoration: InputDecoration(
                  labelText: 'Price',
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: colorController,
                decoration: InputDecoration(
                  labelText: 'Color (hex)',
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                '''
White: 0xFFFFFFFF
Black: 0xFF000000
Red: 0xFFFF0000
Green: 0xFF00FF00
Blue: 0xFF0000FF
Yellow: 0xFFFFFF00
Cyan: 0xFF00FFFF
Magenta: 0xFFFF00FF
Orange: 0xFFFFA500
Purple: 0xFF800080
Gray: 0xFF808080
Light Blue: 0xFFADD8E6
Light Green: 0xFF90EE90
Pink: 0xFFFFC0CB
Brown: 0xFFA52A2A''',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
