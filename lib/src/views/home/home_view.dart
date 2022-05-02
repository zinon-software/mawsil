import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mawsil/src/utilities/app_colors.dart';
import 'package:mawsil/src/views/cart/cart_view.dart';
import '../../controllers/cart_controller.dart';
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
    Container(child: const Center(child: Text("page 2"))),
    const CartView(),
    Container(child: const Center(child: Text("page 4"))),
  ];

  void onTapNav(int index)=> setState(() => _selectedIndex = index);

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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: onTapNav,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0.0,
        unselectedFontSize: 0.0,
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: Colors.amberAccent,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Main",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.archive),
            label: "history",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "me",
          ),
        ],
      ),
    );
  }
}
