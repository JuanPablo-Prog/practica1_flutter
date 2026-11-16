import 'package:flutter/material.dart';
import 'skin.dart';

class Shop extends ChangeNotifier {
  final List<Skin> _skinShop = [
    Skin(
      name: 'Vandal Reaver',
      price: '1,775 VP',
      imagePath: 'assets/valorant1.webp',
      description: 'Apariencia mística con rematador oscuro y animaciones de almas.',
    ),
    Skin(
      name: 'Phantom Prime 2.0',
      price: '1,775 VP',
      imagePath: 'assets/valorant2.webp',
      description: 'Estilo futurista de lujo con recarga de energía hiperión.',
    ),
    Skin(
      name: 'Operator Elderflame',
      price: '2,475 VP',
      imagePath: 'assets/valorant3.webp',
      description: 'Transforma tu francotirador en un dracónido viviente que escupe fuego.',
    ),
    Skin(
      name: 'Spectre Kuronami',
      price: '2,375 VP',
      imagePath: 'assets/valorant4.webp',
      description: 'Dominio de los elementos de agua y oscuridad ninja.',
    ),
  ];

  final List<Skin> _userCart = [];

  List<Skin> get skinShop => _skinShop;
  List<Skin> get userCart => _userCart;

  void addItemToCart(Skin skin) {
    _userCart.add(skin);
    notifyListeners();
  }

  void removeItemFromCart(Skin skin) {
    _userCart.remove(skin);
    notifyListeners();
  }
}