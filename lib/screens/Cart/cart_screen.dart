import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:add_cart_app/screens/Cart/cart_provider.dart'; 

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          if (cartProvider.cartItems.isEmpty) {
            return const Center(child: Text('No items in cart'));
          }
          return ListView.builder(
            itemCount: cartProvider.cartItems.length,
            itemBuilder: (context, index) {
               final product = cartProvider.cartItems.keys.elementAt(index);
              final quantity = cartProvider.cartItems[product]!;

              return ListTile(
                leading: Image.asset(product.image1, width: 50, height: 50),
                title: Text(product.title),
                subtitle: Text('\$${product.price} (x$quantity)'),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  color: Colors.red,
                  onPressed: () {
                    cartProvider.removeFromCart(product); 
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
