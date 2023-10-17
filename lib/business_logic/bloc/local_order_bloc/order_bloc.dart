
import 'package:coffee_shop/data/local/cart_service.dart';
import 'package:coffee_shop/data/models/order_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'order_event.dart';

part 'order_state.dart';

class LocalOrderBloc extends Bloc<OrderEvent, List<Order>> {
  final OrderService _orderService = OrderService();

  LocalOrderBloc() : super([]) {
    on<AddOrder>((AddOrder event, Emitter emit) {
      _orderService.addOrder(event.order);
      emit(_orderService.getOrders());
    });
    on<GetOrders>((GetOrders event, Emitter emit) {
      emit(_orderService.getOrders());
    });
    on<IncreaseOrder>((event, emit) {
      _orderService.increaseOrderQuantity(event.order);
      emit(_orderService.getOrders());
    });

    on<DecreaseOrder>((event, emit) {
      _orderService.decreaseOrderQuantity(event.order);
      emit(_orderService.getOrders());
    });
    on<ClearOrders>((event, emit) {
      _orderService.clearOrders();
      emit(_orderService.getOrders());
    });
  }
}
