
import 'package:coffee_shop/business_logic/cubit/tab_box_cubit/tab_box_cubit.dart';
import 'package:coffee_shop/screens/tab_box/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'screens/coffee_list_screen.dart';
import 'screens/order_screen.dart';

List<Widget> pages = [const CoffeeListScreen(), const OrderScreen(), const ProfileScreen()];

class TabBoxScreen extends StatelessWidget {
  const TabBoxScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: context.watch<TabBoxCubit>().state, children: pages),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.mugSaucer),
            label: 'Coffee',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.cartShopping),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.user),
            label: 'Profile',
          )
        ],
        currentIndex: context.watch<TabBoxCubit>().state,
        onTap: context.read<TabBoxCubit>().changeTab,
      ),
    );
  }
}
