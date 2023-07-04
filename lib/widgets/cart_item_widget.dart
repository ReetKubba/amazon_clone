import 'package:amazonclone/Utils/colortheme.dart';
import 'package:amazonclone/Utils/utils.dart';
import 'package:amazonclone/models/product_model.dart';
import 'package:amazonclone/screens/product_screen.dart';
import 'package:amazonclone/widgets/custom_square_button.dart';
import 'package:amazonclone/widgets/product_information_widget.dart';
import 'package:flutter/material.dart';

import 'Custom_Simple_Rounded_Button.dart';

class CartItemWidget extends StatelessWidget {
  final ProductModel product;
  const CartItemWidget({Key? key,required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Container(
      padding: const EdgeInsets.all(25),
      height: screenSize.height / 2,
      width: screenSize.width,
      decoration: BoxDecoration(
          color: backgroundColor,
          border: Border(bottom: BorderSide(color: Colors.grey, width: 1))),
      child: Column(children: [
        Expanded(
          child: GestureDetector(
            onTap: (){
               Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>ProductScreen(productModel: product)
                    ));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: screenSize.width / 3,
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: Center(
                          child: Image.network(
                             product.url))),
                ),
                ProductInformationWidget(
                    productName:
                        product.productName,
                    cost: product.cost,
                    sellerName: product.sellerName)
              ],
            ),
          ),
          flex: 3,
        ),
        Expanded(
          child: Row(
            children: [
              CustomSquareButton(
                  child: const Icon(Icons.remove),
                  onPressed: () {},
                  color: backgroundColor,
                  dimension: 40),
              CustomSquareButton(
                  child: const Text(
                    "0",
                    style: TextStyle(color: activeCyanColor),
                  ),
                  onPressed: () {},
                  color: Colors.white,
                  dimension: 40),
              CustomSquareButton(
                  child: const Icon(Icons.add),
                  onPressed: () {},
                  color: backgroundColor,
                  dimension: 40),
            ],
          ),
          flex: 1,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    CustomSimpleRoundedButton(
                      onPressed: () {},
                      text: "Delete",
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    CustomSimpleRoundedButton(
                      onPressed: () {},
                      text: "Save for later",
                    ),
                  ],
                ),
                const Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "See more of this",
                        style: TextStyle(color: activeCyanColor),
                      )),
                ),
              ],
            ),
          ),
          flex: 1,
        ),
      ]),
    );
  }
}
