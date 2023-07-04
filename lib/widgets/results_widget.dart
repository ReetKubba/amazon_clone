import 'package:amazonclone/Utils/colortheme.dart';
import 'package:amazonclone/widgets/cost_widget.dart';
import 'package:amazonclone/widgets/rating_star_widget.dart';
import 'package:flutter/material.dart';

import '../Utils/utils.dart';
import '../models/product_model.dart';

class ResultsWidget extends StatelessWidget {
  final ProductModel product;
  const ResultsWidget({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return GestureDetector(
      onTap: (){},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: screenSize.width/3,
              child: Image.network(product.url),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(product.productName,maxLines:3,overflow: TextOverflow.ellipsis,),
             
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Row(
                
                children: [
                  SizedBox(width:screenSize.width/5,child: FittedBox(child: RatingStarWidget(rating: product.rating))),
                  Padding(
                    padding: const EdgeInsets.only(left:10),
                    child: Text(product.noOfRating.toString(),
                    style:const TextStyle(
                      color: activeCyanColor,
                    ),),
                  ),
                ],
              ),
            ),
            SizedBox(height:20,
              child: FittedBox(child: CostWidget(color: Color.fromARGB(255, 118, 17, 10), cost: product.cost)))
          ],
        ),
      ),
    );
  }
}
