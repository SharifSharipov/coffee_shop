import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:coffee_shop/data/firebase/orderservice.dart';
import 'package:coffee_shop/data/models/order_model_firebase.dart';
import 'package:meta/meta.dart';

part 'remote_order_event.dart';

part 'remote_order_state.dart';

class RemoteOrderBloc extends Bloc<RemoteOrderEvent, RemoteOrderState> {
  OrderService orderService;

  RemoteOrderBloc(this.orderService) : super(OrderInitial()) {
    on<PlaceOrder>((event, emit) async {
      emit(OrderLoading());
      final response = await orderService.placeOrder(event.order);
      (response.isSuccess)
          ? emit(OrderPlacedSuccessfully())
          : emit(OrderPlaceFailed(error: response.errorMessage!));
    });
  }
}
