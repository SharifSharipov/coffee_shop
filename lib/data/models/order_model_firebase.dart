


import 'package:coffee_shop/data/models/order_model.dart';

class OrderModelFirabase {
  final String location;
  final String phoneNumber;
  final List<Order> orderItems;

  OrderModelFirabase({
    required this.location,
    required this.phoneNumber,
    required this.orderItems,
  });

  toJson() {
    return {
      'location': location,
      'phoneNumber': phoneNumber,
      'orderItems': orderItems.map((item) => item.toJson()).toList(),
    };
  }
}
