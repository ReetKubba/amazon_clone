import 'package:amazonclone/Utils/colortheme.dart';
import 'package:amazonclone/Utils/constants.dart';
import 'package:amazonclone/main.dart';
import 'package:amazonclone/models/product_model.dart';
import 'package:amazonclone/models/user_details_model.dart';
import 'package:amazonclone/widgets/custom_main_bottom.dart';
import 'package:amazonclone/widgets/search_bar_widget.dart';
import 'package:amazonclone/widgets/users_detail_bar.dart';
import 'package:flutter/material.dart';

import '../widgets/cart_item_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SearchBarWidget(isReadyOnly: true, hasBackButton: false),
        body: Center(
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: kAppBarHeight/2,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomMainButton(
                        child: Text("Proceed to buy (n) items"),
                        color: yellowColor,
                        isLoading: false,
                        onPressed: () {}),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return CartItemWidget(product: 
                          ProductModel(url: "https://m.media-amazon.com/images/I/51QISbJp5-L._SX3000_.jpg", productName: "Oneplus 10 pro", cost:1000, discount: 0, uid: "eebhvgc1", sellerName: "Amazon", sellerUid: "evgcxd1", rating: 1, noOfRating: 1),);
                        }),
                  )
                ],
              ),
              
            ],
          ),
        ));
  }
}
