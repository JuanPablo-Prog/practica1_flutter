import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/shop.dart';
import '../models/skin.dart';
import '../components/skin_tile.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  String searchQuery = '';

  void addSkinToCart(Skin skin) {
    Provider.of<Shop>(context, listen: false).addItemToCart(skin);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${skin.name} agregado al carrito!'),
        backgroundColor: const Color(0xFFFF4655),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) {
        // Filtrar skins según la búsqueda
        final filteredSkins = value.skinShop
            .where((skin) =>
                skin.name.toLowerCase().contains(searchQuery.toLowerCase()))
            .toList();

        return Column(
          children: [
            // Campo de búsqueda activo
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              margin: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                color: const Color(0xFF1F2326),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                style: const TextStyle(color: Color(0xFFECE8E1)),
                onChanged: (text) {
                  setState(() {
                    searchQuery = text;
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Buscar skin...',
                  hintStyle: TextStyle(color: Color(0xFF8B9B9E)),
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.search, color: Color(0xFF8B9B9E)),
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(vertical: 25.0),
              child: Text(
                'EL FUTURO ES AHORA // TIENDA OFICIAL',
                style: TextStyle(
                  color: Color(0xFFFF4655),
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Skins Destacados 🔥',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color(0xFFECE8E1),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // Catálogo Horizontal Filtrado
            Expanded(
              child: filteredSkins.isEmpty
                  ? const Center(
                      child: Text(
                        'No se encontraron skins.',
                        style: TextStyle(color: Color(0xFF8B9B9E)),
                      ),
                    )
                  : ListView.builder(
                      itemCount: filteredSkins.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        Skin skin = filteredSkins[index];
                        return SkinTile(
                          skin: skin,
                          onTap: () => addSkinToCart(skin),
                        );
                      },
                    ),
            ),

            const Padding(
              padding: EdgeInsets.only(top: 25.0, left: 25, right: 25),
              child: Divider(color: Color(0xFF1F2326)),
            ),
          ],
        );
      },
    );
  }
}