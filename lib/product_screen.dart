import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      {"name": "Shoes", "price": "₹1999"},
      {"name": "Watch", "price": "₹2999"},
      {"name": "Bag", "price": "₹1499"},
      {"name": "T-Shirt", "price": "₹999"},
      {"name": "Cap", "price": "₹499"},
      {"name": "Jacket", "price": "₹2499"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        backgroundColor: const Color.fromRGBO(20, 120, 200, 1),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.shopping_bag, size: 40),
                const SizedBox(height: 10),
                Text(products[index]["name"]!),
                Text(
                  products[index]["price"]!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
