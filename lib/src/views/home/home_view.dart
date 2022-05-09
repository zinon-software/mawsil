import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mawsil/src/views/home/history_view/cart_history_view.dart';
import '../../controllers/cart_controller.dart';
import 'cart/cart_view.dart';
import 'main_food_view/main_food_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  final List _pages = [
    const MainFoodView(),
    const CartHistoryView(),
    const CartView(),
    Container(child: const Center(child: Text("page 4"))),
  ];

  void onTapNav(int index) => setState(() => _selectedIndex = index);
  
  final List<int> _badgeCounts = List<int>.generate(4, (index) => index);

  final List<bool> _badgeShows = List<bool>.generate(4, (index) => true);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<CartController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        isFloating: false,
        iconSize: 30.0,
        selectedColor: const Color(0xff040307),
        strokeColor: const Color(0x30040307),
        unSelectedColor: const Color(0xffacacac),
        backgroundColor: Colors.white,
        items: [
          CustomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            // title: const Text("Home"),
            badgeCount: _badgeCounts[0],
          showBadge: _badgeShows[0],
          ),
          CustomNavigationBarItem(
            icon: const Icon(Icons.archive),
            // title: const Text("History"),
            badgeCount: _badgeCounts[1],
          showBadge: _badgeShows[1],
          ),
          CustomNavigationBarItem(
            icon: const Icon(Icons.shopping_cart),
            // title: const Text("Cart"),
            badgeCount: _badgeCounts[2],
          showBadge: _badgeShows[2],
          ),
          CustomNavigationBarItem(
            icon: const Icon(Icons.account_circle),
            // title: const Text("Me"),
            badgeCount: _badgeCounts[3],
          showBadge: _badgeShows[3],
          ),
        ],
      ),
    );
  }
}
