import 'package:flutter/material.dart';
import 'package:vazifalar/views/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        centerTitle: true,
        title: const Text(
          "Online Store",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      drawer: const HomeDrawer(),
      body: Center(
        child: Image.asset(
          'assets/images/online_shopimages.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
