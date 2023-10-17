
import 'package:coffee_shop/data/models/order_model.dart';
import 'package:hive/hive.dart';

class OrderService {
  static const String _boxName = 'orders';
  late Box box;

  OrderService() {
    init();
  }

  init() async {
    box = await Hive.openBox<Order>(_boxName);
  }

  void addOrder(Order order) {
    print(order.coffee.id);
    if (box.values.toList().indexWhere((o) => o.coffee.id == order.coffee.id) == -1) {
      box.put(order.coffee.id, order);
    }
  }

  void clearOrders() {
    box.clear();
  }

  List<Order> getOrders() {
    return box.values.toList() as List<Order>;
  }

  void increaseOrderQuantity(Order order) {
    final Order? currentOrder = box.get(order.coffee.id);
    if (currentOrder != null) {
      final Order existingOrder = box.get(order.coffee.id)..existingOrder.quantity += 1;
      box.put(existingOrder.coffee.id, existingOrder);
    }
  }

  void decreaseOrderQuantity(Order order) {
    final Order? currentOrder = box.get(order.coffee.id);
    if (currentOrder != null) {
      final Order existingOrder = box.get(order.coffee.id)!;
      if (existingOrder.quantity > 1) {
        existingOrder.quantity -= 1;
        box.put(existingOrder.coffee.id, existingOrder);
      } else {
        // If quantity is 1 or less, remove the order from the list
        box.delete(existingOrder.coffee.id);
      }
    }
  }
}
