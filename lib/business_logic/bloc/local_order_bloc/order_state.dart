part of 'order_bloc.dart';

abstract class OrderState {
  const OrderState();
}

class LoadedOrdersState extends OrderState {
  final List<Order> orders;

  LoadedOrdersState(this.orders);
}
