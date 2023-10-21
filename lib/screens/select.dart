import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';
import 'package:trivia/ad_helper.dart';
import 'package:trivia/colors/app_color.dart';
import 'package:trivia/data/box.dart';
import 'package:trivia/data/questions/anime.dart';
import 'package:trivia/data/questions/arts.dart';
import 'package:trivia/data/questions/books.dart';
import 'package:trivia/data/questions/discoveries.dart';
import 'package:trivia/data/questions/fruits_and_vegetables.dart';
import 'package:trivia/data/questions/geography.dart';
import 'package:trivia/data/questions/history.dart';
import 'package:trivia/data/questions/inventions.dart';
import 'package:trivia/data/questions/politics.dart';
import 'package:trivia/data/questions/pop_culture.dart';
import 'package:trivia/data/questions/proverbs.dart';
import 'package:trivia/data/questions/religion.dart';
import 'package:trivia/data/questions/sports.dart';
import 'package:trivia/data/questions/vocab.dart';
import 'package:trivia/main.dart';
import 'package:trivia/models/game_background.dart';
import 'package:trivia/models/stat_bar.dart';
import 'package:trivia/providers/question.dart';
import 'package:trivia/providers/stage.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../data/questions/animals.dart';
import '../data/questions/science.dart';

class SelectScreen extends StatefulWidget {
  const SelectScreen({super.key});

  @override
  State<SelectScreen> createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectScreen> {
  // BannerAd? _bannerAd;

  List<List<Map<String, dynamic>>> selectItems = [
    [
      {
        "image": "assets/images/dolphin.png",
        "data": animalsData,
      },
      {
        "image": "assets/images/anime.png",
        "data": animeData,
      },
      {
        "image": "assets/images/arts.png",
        "data": artsData,
      },
      {
        "image": "assets/images/books.png",
        "data": booksData,
      },
    ],
    [
      {
        "image": "assets/images/discovery.png",
        "data": discoveriesData,
      },
      {
        "image": "assets/images/fruits_and_vegetables.png",
        "data": fruitsAndVegetablesData,
      },
      {
        "image": "assets/images/geography.png",
        "data": geographyData,
      },
      {
        "image": "assets/images/history.png",
        "data": historyData,
      },
    ],
    [
      {
        "image": "assets/images/invention.png",
        "data": inventionsData,
      },
      {
        "image": "assets/images/politics.png",
        "data": politicsData,
      },
      {
        "image": "assets/images/pop.png",
        "data": popCultureData,
      },
      {
        "image": "assets/images/quote.png",
        "data": proverbsIdiomsRiddlesData,
      },
    ],
    [
      {
        "image": "assets/images/religion.png",
        "data": religionData,
      },
      {
        "image": "assets/images/science.png",
        "data": scienceData,
      },
      {
        "image": "",
        "data": sportsData,
      },
      {
        "image": "assets/images/sports.png",
        "data": vocabData,
      },
    ],
  ];

  @override
  void initState() {
    for (var item in selectItems) {
      if (box.get(item["data"]["title"]) == null) {
        box.put(item["data"]["title"], item["data"]);
      }
    }

    /* _initGoogleMobileAds();
    _loadBannerAd(); */
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        playTap(context);
        Navigator.pushReplacementNamed(context, "/menu");
        return true;
      },
      child: GameBackground(
        /* bottomNavigationBar: (_bannerAd != null)
            ? SizedBox(
                width: _bannerAd!.size.width.toDouble(),
                height: _bannerAd!.size.height.toDouble(),
                child: AdWidget(ad: _bannerAd!),
              )
            : null, */
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 40.h),
          child: Column(
            children: [
              const GameStats(),
              const Spacer(flex: 2),
              Text(
                "Choose a category",
                style: TextStyle(
                  color: AppColor.white,
                  fontSize: 30.sp,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              SizedBox(
                height: 400.h,
                child: ListView.builder(
                  itemCount: selectItems.length,
                  padding: EdgeInsets.only(top: 20.h),
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    final selectItem = selectItems[index];

                    return Consumer<QuestionProvider>(
                        builder: (_, questionProvider, child) {
                      return ZoomTapAnimation(
                        onTap: () {
                          var stageProvider = Provider.of<StageProvider>(
                              context,
                              listen: false);
                          stageProvider.resetCompletedStage();
                          questionProvider.title = selectItem["data"]["title"];

                          if (box.get(selectItem["data"]["title"]) == null) {
                            box.put(selectItem["data"]["title"],
                                selectItem["data"]);
                          }

                          questionProvider.data =
                              box.get(selectItem["data"]["title"]);

                          questionProvider.currentLevel = box
                              .get(selectItem["data"]["title"])["currentLevel"];
                          Future.delayed(
                            3.microseconds,
                            () => Navigator.pushNamed(context, "/stage"),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.all(10.sp),
                          margin: EdgeInsets.only(bottom: 20.sp),
                          decoration: BoxDecoration(
                            color: AppColor.lightRed,
                            border: Border.all(
                              width: 2.sp,
                              color: AppColor.lightRed,
                            ),
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: ListTile(
                            leading: Image.asset(
                              selectItem["image"],
                              width: 40.w,
                              height: 40.h,
                            ),
                            title: Text(
                              selectItem["data"]["title"],
                              style: TextStyle(
                                color: AppColor.white,
                                fontSize: 16.sp,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            trailing: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15.sp, vertical: 10.sp),
                              decoration: BoxDecoration(
                                color: AppColor.yellow,
                                borderRadius: BorderRadius.circular(50.r),
                              ),
                              child: Text(
                                "Level ${box.get(selectItem["data"]["title"])?["currentLevel"]}",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    });
                  },
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Future<InitializationStatus> _initGoogleMobileAds() {
    return MobileAds.instance.initialize();
  }

  _loadBannerAd() {
    BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            // _bannerAd = ad as BannerAd;
          });
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          Toast.show("Failed to load ad",
              textStyle: TextStyle(
                fontSize: 20.sp,
                color: Colors.white,
              ),
              duration: 3,
              gravity: Toast.bottom);
          ad.dispose();
        },
      ),
    ).load();
  }
}
