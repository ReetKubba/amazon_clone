import 'package:amazonclone/Utils/colortheme.dart';
import 'package:amazonclone/Utils/constants.dart';
import 'package:amazonclone/main.dart';
import 'package:amazonclone/models/review_model.dart';
import 'package:amazonclone/widgets/Custom_Simple_Rounded_Button.dart';
import 'package:amazonclone/widgets/cost_widget.dart';
import 'package:amazonclone/widgets/custom_main_bottom.dart';
import 'package:amazonclone/widgets/product_information_widget.dart';
import 'package:amazonclone/widgets/rating_star_widget.dart';
import 'package:amazonclone/widgets/review_dialog.dart';
import 'package:amazonclone/widgets/review_widget.dart';
import 'package:amazonclone/widgets/search_bar_widget.dart';
import 'package:amazonclone/widgets/users_detail_bar.dart';
import 'package:flutter/material.dart';

import '../Utils/utils.dart';
import '../models/product_model.dart';
import '../models/user_details_model.dart';

class ProductScreen extends StatefulWidget {
  final ProductModel productModel;
  const ProductScreen({Key? key, required this.productModel}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Expanded spaceThingy = Expanded(child: Container());

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return SafeArea(
        child: Scaffold(
      appBar: SearchBarWidget(isReadyOnly: true, hasBackButton: true),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(
                    height:
                        screenSize.height - (kAppBarHeight + kAppBarHeight / 2),
                    child: Column(
                      children: [
                        SizedBox(
                          height: kAppBarHeight / 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Text(
                                      widget.productModel.sellerName,
                                      style: const TextStyle(
                                          color: activeCyanColor, fontSize: 16),
                                    ),
                                  ),
                                  Text(widget.productModel.productName),
                                ],
                              ),
                              RatingStarWidget(
                                  rating: widget.productModel.rating),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Container(
                            height: screenSize.height / 3,
                            constraints: BoxConstraints(
                                maxHeight: screenSize.height / 3),
                            child: Image.network(widget.productModel.url),
                          ),
                        ),
                        spaceThingy,
                        CostWidget(
                            color: Colors.black,
                            cost: widget.productModel.cost),
                        spaceThingy,
                        CustomMainButton(
                            child: Text(
                              "Buy Now",
                              style: TextStyle(color: Colors.black),
                            ),
                            color: Colors.orange,
                            isLoading: false,
                            onPressed: () {}),
                        spaceThingy,
                        CustomMainButton(
                            child: Text(
                              "Add to Cart",
                              style: TextStyle(color: Colors.black),
                            ),
                            color: yellowColor,
                            isLoading: false,
                            onPressed: () {}),
                        spaceThingy,
                        CustomSimpleRoundedButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: ((context) => const ReviewDialog()));
                            },
                            text: "Add a review for this product"),
                      ],
                    ),
                  ),
                  // spaceThingy1,
                  SizedBox(
                    height: screenSize.height,
                    child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return ReviewWidget(
                              review: ReviewModel(
                                  senderName: "Rick",
                                  description: "Very good Product",
                                  rating: 2));
                        }),
                  )
                ],
              ),
            ),
          ),
          UserDetailBar(
            offset: 0,
           
          )
        ],
      ),
    ));
  }
}
