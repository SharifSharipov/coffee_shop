import 'package:hive/hive.dart';

part 'coffee_model.g.dart';

@HiveType(typeId: 0)
class Coffee {
  @HiveField(0)
  final String? id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final String imagePath;

  @HiveField(4)
  final String category;

  @HiveField(5)
  final int price;

  @HiveField(6)
  final String size;

  Coffee({
    this.id,
    required this.name,
    required this.description,
    required this.imagePath,
    required this.category,
    required this.price,
    this.size = 'M', // Set 'M' as the default value for 'size'
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imagePath': imagePath,
      'category': category,
      'price': price,
      'size': size,
    };
  }

  factory Coffee.fromJson(Map<String, dynamic> map) {
    return Coffee(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      imagePath: map['imagePath'] as String,
      category: map['category'] as String,
      price: map['price'] as int,
      size: map['size'] as String,
    );
  }

  Coffee copyWith({
    String? id,
    String? name,
    String? description,
    String? imagePath,
    String? category,
    int? price,
    String? size,
  }) {
    return Coffee(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      imagePath: imagePath ?? this.imagePath,
      category: category ?? this.category,
      price: price ?? this.price,
      size: size ?? this.size,
    );
  }
}
