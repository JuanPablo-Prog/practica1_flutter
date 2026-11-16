import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  final void Function(int)? onTabChange;
  const MyBottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: GNav(
        color: const Color(0xFF8B9B9E),
        activeColor: const Color(0xFFFF4655), // Rojo Valorant
        tabBackgroundColor: const Color(0xFF1F2326),
        mainAxisAlignment: MainAxisAlignment.center,
        tabBorderRadius: 16,
        gap: 8,
        onTabChange: (value) => onTabChange!(value),
        tabs: const [
          GButton(
            icon: Icons.storefront_outlined,
            text: 'Tienda',
          ),
          GButton(
            icon: Icons.shopping_bag_outlined,
            text: 'Carrito',
          ),
        ],
      ),
    );
  }
}