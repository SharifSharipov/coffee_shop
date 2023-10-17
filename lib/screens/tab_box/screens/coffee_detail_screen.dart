import 'dart:ui';

import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:coffee_shop/business_logic/bloc/local_order_bloc/order_bloc.dart';
import 'package:coffee_shop/business_logic/cubit/size_cubit/size_cubit.dart';
import 'package:coffee_shop/business_logic/cubit/tab_box_cubit/tab_box_cubit.dart';
import 'package:coffee_shop/data/models/coffee_model.dart';
import 'package:coffee_shop/data/models/order_model.dart';
import 'package:coffee_shop/utils/colors.dart';
import 'package:coffee_shop/utils/constants.dart';
import 'package:coffee_shop/utils/mixin/divider_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoffeeDetailScreen extends StatelessWidget {
  final Coffee coffee;

  const CoffeeDetailScreen({super.key, required this.coffee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildCoffeeImage(context),
                // buildPriceAndAddToCartButton(context),
                buildDescription(context),
                buildSizeSelection(context),
                buildBuyNowButton(context),
              ].divide(const SizedBox(height: 24)),
            ),
          ),
          buildExitButton(context),
        ],
      ),
    );
  }

  Widget buildCoffeeImage(context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(coffee.imagePath),
          ),
        ),
        child: Container(
          alignment: Alignment.bottomCenter,
          child: ClipRect(
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(width: 2, color: AppColor.white),
              ),
              child: Container(
                padding: const EdgeInsets.all(16),
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: AppColor.white,
                  ),
                  borderRadius: BorderRadius.circular(8),
                  color: AppColor.white.withOpacity(0.05),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                  child: buildCoffeeInfo(context),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCoffeeInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildCoffeeNameAndCategory(context),
        buildPriceAndAddToCartButton(context),
      ],
    );
  }

  Widget buildCoffeeNameAndCategory(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            coffee.category,
            style: context.headlineSmall?.copyWith(fontSize: 24),
          ),
          Text(
            coffee.name,
            style:
            context.titleMedium?.copyWith(fontSize: 15, color: AppColor.white.withOpacity(0.5)),
          ),
        ].divide(const SizedBox(height: 4)));
  }

  Widget buildPriceAndAddToCartButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "\$${coffee.price}",
          style: context.headlineSmall?.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: AppColor.cD17842,
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(AppColor.cD17842),
          ),
          child: Text(
            "Add to cart",
            style: context.titleMedium?.copyWith(fontSize: 18, fontWeight: FontWeight.w700),
          ),
        )
      ],
    );
  }

  Widget buildDescription(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Description",
            style: context.titleLarge?.copyWith(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          Text(
            coffee.description,
            style: context.titleMedium?.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: AppColor.white.withOpacity(0.25),
            ),
          ),
        ].divide(const SizedBox(height: 8)));
  }

  Widget buildSizeSelection(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Size",
            style: context.titleLarge?.copyWith(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          buildSizeButtons(context),
        ].divide(const SizedBox(height: 8)));
  }

  Widget buildSizeButtons(BuildContext context) {
    return Row(
      children: List.generate(
        size.length,
            (index) => Expanded(
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                context.watch<SizeCubit>().state == index
                    ? Colors.transparent
                    : AppColor.white.withOpacity(0.05),
              ),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(
                    color: context.read<SizeCubit>().state == index
                        ? AppColor.cD17842
                        : Colors.transparent,
                    width: context.watch<SizeCubit>().state == index ? 1 : 0,
                  ),
                ),
              ),
              padding: const MaterialStatePropertyAll(
                EdgeInsets.symmetric(vertical: 8),
              ),
            ),
            onPressed: () {
              context.read<SizeCubit>().changeSize(index);
            },
            child: Text(
              size[index],
              style: context.titleMedium?.copyWith(
                fontSize: 18,
                color:
                context.watch<SizeCubit>().state == index ? AppColor.cD17842 : AppColor.white,
              ),
            ),
          ),
        ),
      ).divide(const SizedBox(width: 16)),
    );
  }

  Widget buildBuyNowButton(BuildContext context) {
    return Container(
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ElevatedButton(
        onPressed: () {
          context.read<LocalOrderBloc>().add(AddOrder(
              Order(coffee: coffee.copyWith(size: size[context.read<SizeCubit>().state]))));
          Navigator.pop(context);
          context.read<TabBoxCubit>().changeTab(1);
        },
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(AppColor.cD17842),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            "Buy Now",
            style: context.titleLarge?.copyWith(fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }

  buildExitButton(BuildContext context) {
    return Positioned(
      top: 40,
      left: 20,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColor.white.withOpacity(0.05),
            border: Border.all(
              width: 2,
              color: AppColor.white,
            )),
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.close,
          ),
        ),
      ),
    );
  }
}
