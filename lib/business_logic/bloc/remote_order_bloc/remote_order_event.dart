part of 'remote_order_bloc.dart';

@immutable
abstract class RemoteOrderEvent {}

class PlaceOrder extends RemoteOrderEvent {
  final OrderModelFirabase order;

  PlaceOrder(this.order);
}
