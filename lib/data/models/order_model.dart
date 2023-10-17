
import 'package:coffee_shop/data/models/coffee_model.dart';
import 'package:hive/hive.dart';

part 'order_model.g.dart';

@HiveType(typeId: 1)
class Order {
  @HiveField(0)
  int quantity;

  @HiveField(1)
  final Coffee coffee;

  Order({
    this.quantity = 1,
    required this.coffee,
  });

  Order copyWith({
    int? quantity,
    Coffee? coffee,
  }) {
    return Order(
      quantity: quantity ?? this.quantity,
      coffee: coffee ?? this.coffee,
    );
  }

  toJson() {
    return {
      'quantity': quantity,
      'coffee': coffee.toJson(),
    };
  }
}
