import 'package:add_cart_app/screens/Cart/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:add_cart_app/models/products_model.dart';
import 'package:provider/provider.dart'; 

class ProductDetailPage extends StatelessWidget {
  final Products product; 

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title), 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                product.image1,
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              product.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '\$${product.price}',
              style: const TextStyle(
                fontSize: 22,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Description',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              product.description,
              style: const TextStyle(fontSize: 16),
            ),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: () {
      
                Provider.of<CartProvider>(context, listen: false).addToCart(product);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Product added to cart')),
                );
              },
              icon: const Icon(Icons.add_shopping_cart),
              label: const Text('Add to Cart'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50), 
              ),
            ),
          ],
        ),
      ),
    );
  }
}
