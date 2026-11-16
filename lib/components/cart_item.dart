import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/skin.dart';
import '../models/shop.dart';

class CartItemTile extends StatelessWidget {
  final Skin skin;
  const CartItemTile({super.key, required this.skin});

  void removeItemFromCart(BuildContext context) {
    Provider.of<Shop>(context, listen: false).removeItemFromCart(skin);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${skin.name} eliminado del carrito'),
        backgroundColor: const Color(0xFFFF4655),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1F2326),
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Image.asset(
          skin.imagePath,
          width: 50,
          errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.shield, color: Color(0xFFFF4655)),
        ),
        title: Text(
          skin.name,
          style: const TextStyle(color: Color(0xFFECE8E1), fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          skin.price,
          style: const TextStyle(color: Color(0xFFFF4655)),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.grey),
          onPressed: () => removeItemFromCart(context),
        ),
      ),
    );
  }
}