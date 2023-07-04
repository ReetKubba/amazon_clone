import 'package:amazonclone/widgets/results_widget.dart';
import 'package:amazonclone/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';

import '../models/product_model.dart';

class ResultScreen extends StatelessWidget {
  final String query;
  const ResultScreen({Key? key, required this.query}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBarWidget(isReadyOnly: false, hasBackButton: true),
      body: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: RichText(
                  text: TextSpan(children: [
                const TextSpan(
                  text: "Showing results for ",
                  style: TextStyle(fontSize: 17),
                ),
                TextSpan(
                  text: query,
                  style: const TextStyle(
                    fontSize: 17,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ])),
            ),
          ),
          Expanded(
            child: GridView.builder(
                itemCount: 9,
                gridDelegate:
                  const  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,childAspectRatio: 2/3),
                itemBuilder: ((context, index) {
                  return ResultsWidget(
                      product: ProductModel(
                          url:
                              "https://m.media-amazon.com/images/I/51QISbJp5-L._SX3000_.jpg",
                          productName: "Oneplus 10 pro",
                          cost: 1000,
                          discount: 0,
                          uid: "eebhvgc1",
                          sellerName: "Amazon",
                          sellerUid: "evgcxd1",
                          rating: 4,
                          noOfRating: 1));
                })),
          )
        ],
      ),
    );
  }
}
