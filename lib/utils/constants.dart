

import 'package:coffee_shop/data/models/coffee_model.dart';
import 'package:coffee_shop/utils/uid.dart';


final List<String> coffeeCategories = [
  'Espresso',
  'Cappuccino',
  'Latte',
  'Americano',
  'Macchiato',
  'Mocha',
];
List<String> size = ['S', 'M', 'L'];
final List<Coffee> coffeeList = [
  Coffee(
    id: UidGenerator.generateUID(),
    name: 'Single Shot Espresso',
    description: 'Strong and concentrated single shot espresso.',
    imagePath: 'assets/images/1.png',
    category: coffeeCategories[0],
    price: 299, // Added price as an 'int'
  ),
  Coffee(
    id: UidGenerator.generateUID(),
    name: 'Double Shot Espresso',
    description: 'Strong and concentrated double shot espresso.',
    imagePath: 'assets/images/2.png',
    category: coffeeCategories[0],
    price: 399, // Added price as an 'int'
  ),
  Coffee(
    id: UidGenerator.generateUID(),
    name: 'Classic Cappuccino',
    description: 'Classic cappuccino with frothy milk.',
    imagePath: 'assets/images/3.png',
    category: coffeeCategories[1],
    price: 449, // Added price as an 'int'
  ),
  Coffee(
    id: UidGenerator.generateUID(),
    name: 'Vanilla Cappuccino',
    description: 'Cappuccino with a hint of vanilla.',
    imagePath: 'assets/images/4.png',
    category: coffeeCategories[1],
    price: 499, // Added price as an 'int'
  ),
  Coffee(
    id: UidGenerator.generateUID(),
    name: 'Regular Latte',
    description: 'A classic latte with steamed milk and espresso.',
    imagePath: 'assets/images/5.png',
    category: coffeeCategories[2],
    price: 549, // Added price as an 'int'
  ),
  Coffee(
    id: UidGenerator.generateUID(),
    name: 'Caramel Latte',
    description: 'Latte with a sweet caramel twist.',
    imagePath: 'assets/images/6.png',
    category: coffeeCategories[2],
    price: 599, // Added price as an 'int'
  ),
  Coffee(
    id: UidGenerator.generateUID(),
    name: 'Classic Americano',
    description: 'The traditional Americano with a bold flavor.',
    imagePath: 'assets/images/7.png',
    category: coffeeCategories[3],
    price: 449, // Added price as an 'int'
  ),
  Coffee(
    id: UidGenerator.generateUID(),
    name: 'Mocha Americano',
    description: 'Americano with a rich chocolatey mocha taste.',
    imagePath: 'assets/images/8.png',
    category: coffeeCategories[3],
    price: 499, // Added price as an 'int'
  ),
  Coffee(
    id: UidGenerator.generateUID(),
    name: 'Classic Macchiato',
    description: 'Espresso with a dollop of foamed milk.',
    imagePath: 'assets/images/9.png',
    category: coffeeCategories[4],
    price: 399, // Added price as an 'int'
  ),
  Coffee(
    id: UidGenerator.generateUID(),
    name: 'Caramel Macchiato',
    description: 'Macchiato with sweet caramel and foamed milk.',
    imagePath: 'assets/images/10.png',
    category: coffeeCategories[4],
    price: 449, // Added price as an 'int'
  ),
  Coffee(
    id: UidGenerator.generateUID(),
    name: 'Classic Mocha',
    description: 'Mocha with rich chocolate and espresso.',
    imagePath: 'assets/images/11.png',
    category: coffeeCategories[5],
    price: 499, // Added price as an 'int'
  ),
  Coffee(
    id: UidGenerator.generateUID(),
    name: 'White Chocolate Mocha',
    description: 'Mocha with a delightful white chocolate flavor.',
    imagePath: 'assets/images/12.png',
    category: coffeeCategories[5],
    price: 549, // Added price as an 'int'
  ),
];
/*
class FirebaseCollections {
  static const String  = "addresses";
  static const String orders = "orders";
  static const String drivers = "drivers";
  static const String users = "clients";
  static const String requestDriver = 'requestDriver';
  static const String requestClient = 'requestClient';
  static const String yandexApiKeys = 'yandex_api_keys';
}*/
class FirebaseCollections {
  static const String coffees = "coffees";
}