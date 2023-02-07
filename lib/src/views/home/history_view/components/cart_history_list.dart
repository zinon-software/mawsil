import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mawsil/routes.dart';

import '../../../../controllers/cart_controller.dart';
import '../../../../models/cart_model.dart';
import '../../../../utilities/app_colors.dart';
import '../../../../utilities/dimensions.dart';
import '../../../../widgets/text/big_text_widget.dart';
import '../../../../widgets/text/small_text_widget.dart';

class CartHistoryList extends StatelessWidget {
  const CartHistoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // dart code
    List<CartModel> getCartHistoryList =
        Get.find<CartController>().getCartHistoryList().reversed.toList();

    Map<String, int> cartItemsPerOrder = {};

    for (var item in getCartHistoryList) {
      if (cartItemsPerOrder.containsKey(item.time.toString())) {
        cartItemsPerOrder.update(item.time.toString(), (value) => ++value);
      } else {
        cartItemsPerOrder.putIfAbsent(item.time.toString(), () => 1);
      }
    }

    List<int> cartItemsPerOrderToList() {
      return cartItemsPerOrder.entries.map((e) => e.value).toList();
    }

    List<int> itemsPerOrder = cartItemsPerOrderToList();

    List<String> cartOrderTimeToList() {
      return cartItemsPerOrder.entries.map((e) => e.key).toList();
    }

    int listCounter = 0;

    timeWidget(int index) {
      var outputDate = DateTime.now().toString();
      if (index < getCartHistoryList.length) {
        DateTime parseDate = DateFormat("yyyy-MM-dd HH:mm:ss")
            .parse(getCartHistoryList[listCounter].time!.toString());
        DateTime inputDate = DateTime.parse(parseDate.toString());
        var outputFormat = DateFormat("MM/dd/yyyy HH:mm a");
        outputDate = outputFormat.format(inputDate);
      }

      return BigText(
        text: outputDate.toString(),
      );
    }

    return Container(
      margin: EdgeInsets.only(
        top: Dimensions.heightDynamic(20),
        left: Dimensions.heightDynamic(20),
        right: Dimensions.heightDynamic(20),
      ),
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
          children: [
            for (int i = 0; i < itemsPerOrder.length; i++)
              Container(
                height: Dimensions.heightDynamic(140),
                margin: EdgeInsets.only(bottom: Dimensions.heightDynamic(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    timeWidget(listCounter),
                    SizedBox(
                      height: Dimensions.heightDynamic(10),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Wrap(
                          direction: Axis.horizontal,
                          children: List.generate(
                            itemsPerOrder[i],
                            (index) {
                              if (listCounter < getCartHistoryList.length) {
                                listCounter++;
                              }
                              return (index <= 2)
                                  ? Container(
                                      height: Dimensions.heightDynamic(80),
                                      width: Dimensions.heightDynamic(80),
                                      margin: EdgeInsets.only(
                                          right:
                                              Dimensions.heightDynamic(10) / 2),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.heightDynamic(
                                                    Dimensions.heightDynamic(
                                                        15)) /
                                                2),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            getCartHistoryList[listCounter - 1]
                                                .img!,
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    )
                                  : const SizedBox();
                            },
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.heightDynamic(80),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SmallText(text: "Total"),
                              BigText(
                                  text: "${itemsPerOrder[i].toString()} items"),
                              GestureDetector(
                                onTap: () {
                                  var orderTime = cartOrderTimeToList();
                                  Map<int, CartModel> moreOrder = {};

                                  for (var element in getCartHistoryList) {
                                    if (orderTime[i].toString() ==
                                        element.time.toString()) {
                                      moreOrder.putIfAbsent(
                                          element.id!,
                                          () => CartModel.fromJson(
                                              jsonDecode(jsonEncode(element))));
                                    }
                                  }

                                  Get.find<CartController>().setItems =
                                      moreOrder;
                                  Get.find<CartController>().addToCartList();
                                  Get.toNamed(RouteHelper.getCartPage);
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: Dimensions.heightDynamic(10),
                                    vertical: Dimensions.heightDynamic(10) / 2,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.heightDynamic(15) / 3),
                                    border: Border.all(
                                        width: 1, color: AppColors.mainColor),
                                  ),
                                  child: Center(
                                    child: SmallText(
                                      text: "one more",
                                      color: AppColors.mainColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
