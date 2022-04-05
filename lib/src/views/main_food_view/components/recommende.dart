import 'package:flutter/material.dart';
import 'package:mawsil/src/utilities/dimensions.dart';
import 'package:mawsil/src/widgets/text/big_text_widget.dart';
import 'package:mawsil/src/widgets/text/small_text_widget.dart';

class RecommendedMainView extends StatelessWidget {
  const RecommendedMainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Dimensions.heightDynamic(15),bottom: Dimensions.heightDynamic(15),),
      padding: EdgeInsets.only(left: Dimensions.heightDynamic(30), right: Dimensions.heightDynamic(15)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          BigText(text: "Recommended"),
          SizedBox(width: Dimensions.heightDynamic(10),),
          Container(margin: EdgeInsets.only(bottom: Dimensions.heightDynamic(3)),
            child: BigText(text: ".", color: Colors.black26,)),
          SizedBox(width: Dimensions.heightDynamic(10),),
          Container(margin: EdgeInsets.only(bottom: Dimensions.heightDynamic(2)),child: SmallText(text: "Food pairing")),
        ],
      ),
    );
  }
}