import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vazifalar/models/order.dart';

class OrderItem extends StatelessWidget {
  final Order order;

  OrderItem({required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('\$${order.products['total']}'),
            subtitle: Text(
              DateFormat('dd/MM/yyyy hh:mm').format(order.date),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.expand_more),
              onPressed: () {},
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
            height: 150,
            child: ListView(
              children: order.products.keys
                  .map(
                    (key) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          key,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${order.products[key]['quantity']} x \$${order.products[key]['product'].price}',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
