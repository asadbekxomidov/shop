import 'package:flutter/material.dart';
import 'package:vazifalar/views/screens/order_screen.dart';
import 'package:vazifalar/views/screens/product_screen.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey.shade900,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue.shade900,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.manage_accounts,
              size: 25,
              color: Colors.white,
            ),
            title: const Text(
              'Manage Products',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) {
                    return ProductsScreen();
                  },
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.view_list,
              size: 25,
              color: Colors.white,
            ),
            title: const Text(
              'View Orders',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) {
                    return OrdersScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
