import 'package:amazonclone/Utils/colortheme.dart';
import 'package:amazonclone/Utils/constants.dart';
import 'package:amazonclone/main.dart';
import 'package:flutter/material.dart';

import '../Utils/utils.dart';

class BannerAddWidget extends StatefulWidget {
  const BannerAddWidget({Key? key}) : super(key: key);

  @override
  State<BannerAddWidget> createState() => _BannerAddWidgetState();
}

class _BannerAddWidgetState extends State<BannerAddWidget> {
  int currentAd = 0;
  Size screenSize = Utils().getScreenSize();

  @override
  Widget build(BuildContext context) {
    double smallAdheight = screenSize.width / 5; //after this
    return GestureDetector(
      onHorizontalDragEnd: (_) {
        if (currentAd == (largeAds.length - 1)) {
          currentAd = -1;
        }
        setState(() {
          currentAd++;
        });
      },
      child: Column(
        children: [
          Stack(
            children: [
              Image.network(
                largeAds[currentAd],
                width: double.infinity,
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: screenSize.width,
                  height: 120,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                        backgroundColor,
                        backgroundColor.withOpacity(0)
                      ])),
                ),
              )
            ],
          ),
          Container(
            color: backgroundColor,
            width: screenSize.width,
            height: smallAdheight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                getSmallAdsFromIndex(0, smallAdheight),
                getSmallAdsFromIndex(1, smallAdheight),
                getSmallAdsFromIndex(2, smallAdheight),
                getSmallAdsFromIndex(3, smallAdheight)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getSmallAdsFromIndex(int index, double height) {
    return Container(
        height: height,
        width: height,
        decoration: ShapeDecoration(
            color: Colors.white,
            shadows: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(smallAds[index]),
              const SizedBox(
                height: 5,
              ),
              Text(adItemNames[index])
            ],
          ),
        ));
  }
}
