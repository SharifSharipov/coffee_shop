part of 'remote_order_bloc.dart';

@immutable
abstract class RemoteOrderState {}

class OrderInitial extends RemoteOrderState {}

class OrderLoading extends RemoteOrderState {}

class OrderPlacedSuccessfully extends RemoteOrderState {}

class OrderPlaceFailed extends RemoteOrderState {
  final String error;

  OrderPlaceFailed({required this.error});
}
