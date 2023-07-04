import 'package:amazonclone/Utils/constants.dart';
import 'package:amazonclone/main.dart';
import 'package:amazonclone/models/user_details_model.dart';
import 'package:amazonclone/widgets/banner_add_widgets.dart';
import 'package:amazonclone/widgets/categories_horizontal_list_view.dart';
import 'package:amazonclone/widgets/products_showcase_list_view.dart';
import 'package:amazonclone/widgets/search_bar_widget.dart';
import 'package:amazonclone/widgets/simple_product_widget.dart';
import 'package:amazonclone/widgets/users_detail_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController controller = ScrollController();
  double offset=0;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        offset=controller.position.pixels;
      });  
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SearchBarWidget(
          isReadyOnly: true,
          hasBackButton: false,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              controller: controller,
              child: Column(
                children: [
                  SizedBox(height: kAppBarHeight/2,),
                  CategoriesHorizontalListView(),
                  BannerAddWidget(),
                  ProductShowcaseListView(
                      title: "Upto 70% off", children: testChildren),
                  ProductShowcaseListView(
                      title: "Upto 50% off", children: testChildren),
                  ProductShowcaseListView(
                      title: "Upto 60% off", children: testChildren),
                  ProductShowcaseListView(
                      title: "Explore", children: testChildren),
                ],
              ),
            ),
          ],
        ));
  }
}
