import 'package:flutter/material.dart';
import 'components/cart_history_list.dart';
import 'components/history_appBar.dart';

class CartHistoryView extends StatelessWidget {
  const CartHistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const HistoryAppBar(),
          Expanded(child: CartHistoryList()),
        ],
      ),
    );
  }
}

