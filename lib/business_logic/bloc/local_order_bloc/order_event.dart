part of 'order_bloc.dart';

abstract class OrderEvent {
  const OrderEvent();
}

class AddOrder extends OrderEvent {
  final Order order;

  AddOrder(this.order);
}

class GetOrders extends OrderEvent {}

class IncreaseOrder extends OrderEvent {
  final Order order;

  IncreaseOrder(this.order);
}

class DecreaseOrder extends OrderEvent {
  final Order order;

  DecreaseOrder(this.order);
}

class ClearOrders extends OrderEvent {}
