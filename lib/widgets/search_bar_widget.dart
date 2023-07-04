import 'package:amazonclone/Utils/colortheme.dart';
import 'package:amazonclone/Utils/constants.dart';
import 'package:amazonclone/screens/results_screen.dart';
import 'package:amazonclone/screens/search_screen.dart';
import 'package:flutter/material.dart';

import '../Utils/utils.dart';

class SearchBarWidget extends StatelessWidget with PreferredSizeWidget {
  final bool isReadyOnly;
  final bool hasBackButton;
  SearchBarWidget(
      {Key? key, required this.isReadyOnly, required this.hasBackButton})
      : preferredSize = const Size.fromHeight(kAppBarHeight),
        super(key: key);
  @override
  final Size preferredSize;
  OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(7),
      borderSide: BorderSide(color: Colors.grey, width: 1));
  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Container(
        //color: Colors.pink,
        height: kAppBarHeight,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: backgroundGradient,
                begin: Alignment.centerLeft,
                end: Alignment.centerRight)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            hasBackButton
                ? IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back))
                : Container(),
            SizedBox(
                width: screenSize.width * 0.7,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 0.8,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: TextField(
                    onSubmitted: (String query) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ResultScreen(query: query)));
                    },
                    readOnly: isReadyOnly,
                    onTap: () {
                      if (!isReadyOnly) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => SearchScreen())));
                      }
                    },
                    decoration: InputDecoration(
                        hintText: "Search for something in amazon",
                        fillColor: Colors.white,
                        filled: true,
                        border: border,
                        focusedBorder: border),
                  ),
                )),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.mic_none_outlined))
          ],
        ));
  }
}
