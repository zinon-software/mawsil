import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/cart_controller.dart';
import '../../../utilities/functions.dart';
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
          Expanded(child: GetBuilder<CartController>(
            builder: (_controller) {
              if (_controller.getItems.isEmpty) {
                            return errorWidget(onClick: (){}, noData: true,
                    butMsg: 'تحديث',
                    msg: 'سلتك فارغة',
                    showBut: true);
                          } else {
                return const CartHistoryList();
              }
            }
          )),
        ],
      ),
    );
  }
}

