import 'package:amazonclone/Utils/constants.dart';
import 'package:amazonclone/Utils/utils.dart';
import 'package:amazonclone/main.dart';
import 'package:amazonclone/widgets/account_screen_appbar.dart';
import 'package:amazonclone/widgets/custom_main_bottom.dart';
import 'package:amazonclone/widgets/products_showcase_list_view.dart';
import 'package:flutter/material.dart';

import '../Utils/colortheme.dart';

class AccountScreenState extends StatefulWidget {
  const AccountScreenState({Key? key}) : super(key: key);

  @override
  State<AccountScreenState> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<AccountScreenState> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AccountScreenApBar(),
        body: SingleChildScrollView(
          child: SizedBox(
            height: screenSize.height,
            width: screenSize.width,
            child: Column(children: [
              IntroductionWidgetAccountScreen(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomMainButton(
                    child: const Text(
                      "Sign-In",
                      style: TextStyle(color: Colors.black),
                    ),
                    color: Colors.orange,
                    isLoading: false,
                    onPressed: () {}),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomMainButton(
                    child: const Text(
                      "Sell",
                      style: TextStyle(color: Colors.black),
                    ),
                    color: yellowColor,
                    isLoading: false,
                    onPressed: () {}),
              ),
              ProductShowcaseListView(
                  title: "Your Orders", children: testChildren),
              const Padding(
                padding: const EdgeInsets.all(15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Order Requests",
                  style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                ),
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: ((context, index) {
                        return ListTile(title:const Text("Order: Black Shoe",style: TextStyle(fontWeight: FontWeight.w500),),subtitle:const Text("Trinity Halls"),trailing: IconButton(onPressed: (){}, icon:Icon(Icons.check)),);
                      })))
            ]),
          ),
        ));
  }
}

class IntroductionWidgetAccountScreen extends StatelessWidget {
  const IntroductionWidgetAccountScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kAppBarHeight / 2,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: backgroundGradient,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight),
      ),
      child: Container(
        height: kAppBarHeight / 2,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.white,
            Colors.white.withOpacity(0.000000000001),
          ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Hello, ",
                    style: TextStyle(color: Colors.grey[800], fontSize: 26)),
                TextSpan(
                    text: "Reet",
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 26,
                        fontWeight: FontWeight.bold)),
              ])),
            ),
            const Padding(
              padding: const EdgeInsets.only(right: 20),
              child: const CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://m.media-amazon.com/images/I/116KbsvwCRL._SX90_SY90_.png"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
