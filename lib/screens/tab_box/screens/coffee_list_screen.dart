import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:coffee_shop/business_logic/bloc/local_order_bloc/order_bloc.dart';
import 'package:coffee_shop/business_logic/cubit/category_cubit/category_cubit.dart';
import 'package:coffee_shop/config/routs_location/routs_location.dart';
import 'package:coffee_shop/data/models/coffee_model.dart';
import 'package:coffee_shop/data/models/order_model.dart';
import 'package:coffee_shop/utils/colors.dart';
import 'package:coffee_shop/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CoffeeListScreen extends StatelessWidget {
  const CoffeeListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          _buildCategoryList(context),
          Expanded(
            child: _buildCoffeeGrid(context),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('Coffee Menu'),
      actions: [
        IconButton(
          onPressed: () {
            // Handle the action when the heart icon is pressed
          },
          icon: const FaIcon(FontAwesomeIcons.heart),
        ),
      ],
    );
  }

  Widget _buildCategoryList(BuildContext context) {
    return SizedBox(
      height: 64,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        itemCount: coffeeCategories.length + 1,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: 16),
        itemBuilder: _buildCategoryItem,
      ),
    );
  }

  Widget _buildCategoryItem(BuildContext context, int index) {
    final isAll = index == 0;
    final categoryIndex = isAll ? index : index - 1;
    final isSelected = context.watch<CategoryCubit>().state == index;

    return GestureDetector(
      onTap: () {
        context.read<CategoryCubit>().changeCategory(index);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? AppColor.white.withOpacity(0.1) : Colors.transparent,
          ),
        ),
        child: Text(
          isAll ? 'All' : coffeeCategories[categoryIndex],
          style: context.titleMedium?.copyWith(
            fontSize: 18,
            color: isSelected ? AppColor.white : AppColor.white.withOpacity(0.25),
          ),
        ),
      ),
    );
  }

  Widget _buildCoffeeGrid(BuildContext context) {
    return GridView.builder(
      itemCount: coffeeList.length,
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.6,
      ),
      itemBuilder: (context, index) {
        final coffee = coffeeList[index];

        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, RoutsLocation.detail, arguments: coffee);
            print('Tapped on ${coffee.name}');
          },
          child: _buildCoffeeItem(context, coffee),
        );
      },
    );
  }

  Widget _buildCoffeeItem(BuildContext context, Coffee coffee) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColor.white.withOpacity(0.05),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Hero(
                tag: 'coffee_${coffee.name}_${coffee.price}',
                child: Image.asset(coffee.imagePath),
              ),
            ),
          ),
          Text(
            coffee.category,
            style: context.headlineSmall,
          ),
          Text(
            coffee.name,
            maxLines: 1,
            style:
            context.titleMedium?.copyWith(fontSize: 15, color: AppColor.white.withOpacity(.5)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${coffee.price}',
                style: context.headlineSmall
                    ?.copyWith(fontWeight: FontWeight.w700, color: AppColor.cD17842),
              ),
              GestureDetector(
                onTap: () async {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text('Added to cart')));

                  context.read<LocalOrderBloc>().add(AddOrder(Order(coffee: coffee)));
                  await Future.delayed(const Duration(seconds: 1), () {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const ShapeDecoration(shape: CircleBorder(), color: AppColor.cD17842),
                  child: const Icon(
                    Icons.add,
                    color: AppColor.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
