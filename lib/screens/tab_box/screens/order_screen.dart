import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:coffee_shop/business_logic/bloc/local_order_bloc/order_bloc.dart';
import 'package:coffee_shop/business_logic/bloc/remote_order_bloc/remote_order_bloc.dart';
import 'package:coffee_shop/data/models/order_model.dart';
import 'package:coffee_shop/screens/tab_box/location_phone_dialog.dart';
import 'package:coffee_shop/utils/colors.dart';
import 'package:coffee_shop/utils/mixin/divider_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order'),
        actions: [
          IconButton(
              onPressed: () {
                context.read<LocalOrderBloc>().add(ClearOrders());
              },
              icon: const FaIcon(FontAwesomeIcons.trashCan)),
        ],
      ),
      body: SafeArea(
        child: BlocListener<RemoteOrderBloc, RemoteOrderState>(
          listener: (context, state) {
            if (state is OrderLoading) {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return const Center(child: CircularProgressIndicator());
                  });
            }
            if (state is OrderPlacedSuccessfully) {
              context.read<LocalOrderBloc>().add(ClearOrders());
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Order placed successfully!'),
              ));
            }
            if (state is OrderPlaceFailed) {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.error),
              ));
            }
          },
          child: BlocBuilder<LocalOrderBloc, List<Order>>(
            builder: (context, state) {
              print('state: $state');
              return state.isEmpty
                  ? const Center(
                child: Text(
                  'Order is empty',
                ),
              )
                  : Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.all(24),
                      itemBuilder: (context, index) {
                        final order = state[index];
                        return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: AppColor.c362C36,
                            ),
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              children: [
                                Container(
                                  height: 70,
                                  width: 70,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Image.asset(
                                    order.coffee.imagePath,
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        order.coffee.name,
                                        style: context.bodyMedium,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                order.coffee.category,
                                                style: context.bodySmall,
                                              ),
                                              Text(
                                                '\$${order.coffee.price}',
                                                style: context.bodyLarge
                                                    ?.copyWith(fontWeight: FontWeight.w600),
                                              ),
                                            ].divide(const SizedBox(height: 8)),
                                          ),
                                          Row(
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  context
                                                      .read<LocalOrderBloc>()
                                                      .add(DecreaseOrder(order));
                                                },
                                                icon: const Icon(
                                                  Icons.remove,
                                                ),
                                              ),
                                              Text(
                                                order.quantity.toString(),
                                                style: context.bodyMedium
                                                    ?.copyWith(fontSize: 20),
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  context
                                                      .read<LocalOrderBloc>()
                                                      .add(IncreaseOrder(order));
                                                },
                                                icon: const Icon(
                                                  Icons.add,
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      )
                                    ].divide(const SizedBox(height: 8)),
                                  ),
                                ),
                              ],
                            ));
                      },
                      separatorBuilder: (context, index) => const SizedBox(height: 16),
                      itemCount: state.length,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total:',
                              style: context.bodyMedium?.copyWith(fontSize: 20),
                            ),
                            Text(
                              '\$${state.fold(0, (previousValue, element) => previousValue + element.coffee.price * element.quantity)}',
                              style: context.bodyLarge
                                  ?.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              showLocationPhoneNumberDialog(context);
                            },
                            style: ButtonStyle(
                              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                              padding: const MaterialStatePropertyAll(
                                  EdgeInsets.symmetric(vertical: 15)),
                              backgroundColor:
                              const MaterialStatePropertyAll(AppColor.cD17842),
                            ),
                            child: Text(
                              "Buy Now",
                              style: context.bodyLarge
                                  ?.copyWith(fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                          ),
                        )
                      ].divide(const SizedBox(height: 16)),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
