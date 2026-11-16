import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/shop.dart';
import '../models/skin.dart';
import '../components/cart_item.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Mi Carrito',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Color(0xFFECE8E1),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: value.userCart.isEmpty
                  ? const Center(
                      child: Text(
                        'Tu carrito está vacío.',
                        style: TextStyle(color: Color(0xFF8B9B9E), fontSize: 16),
                      ),
                    )
                  : ListView.builder(
                      itemCount: value.userCart.length,
                      itemBuilder: (context, index) {
                        Skin individualSkin = value.userCart[index];
                        return CartItemTile(skin: individualSkin);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}