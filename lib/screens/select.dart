import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
  int pageIndex = 0;

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
        "image": "assets/images/sports.png",
        "data": sportsData,
      },
      {
        "image": "assets/images/vocab.png",
        "data": vocabData,
      },
    ],
  ];

  @override
  void initState() {
    for (var selectItem in selectItems) {
      for (var item in selectItem) {
        if (box.get(item["data"]["title"]) == null) {
          box.put(item["data"]["title"], item["data"]);
        }
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
              const Spacer(flex: 4),
              Text(
                "Choose a category",
                style: TextStyle(
                  color: AppColor.white,
                  fontSize: 30.sp,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(flex: 2),
              SizedBox(
                height: 400.h,
                child: PageView.builder(
                    itemCount: selectItems.length,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (value) {
                      setState(() {
                        pageIndex = value;
                      });
                    },
                    itemBuilder: (context, pageIndex) {
                      final selectItem = selectItems[pageIndex];

                      return ListView.builder(
                        itemCount: selectItems.length,
                        padding: EdgeInsets.only(
                            top: 20.h, left: 10.sp, right: 10.sp),
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int listIndex) {
                          final item = selectItem[listIndex];

                          return Consumer<QuestionProvider>(
                              builder: (_, questionProvider, child) {
                            return ZoomTapAnimation(
                              onTap: () {
                                var stageProvider = Provider.of<StageProvider>(
                                    context,
                                    listen: false);
                                stageProvider.resetCompletedStage();
                                questionProvider.title = item["data"]["title"];

                                if (box.get(item["data"]["title"]) == null) {
                                  box.put(item["data"]["title"], item["data"]);
                                }

                                questionProvider.data =
                                    box.get(item["data"]["title"]);

                                questionProvider.currentLevel = box
                                    .get(item["data"]["title"])["currentLevel"];
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
                                    item["image"],
                                    width: 40.w,
                                    height: 40.h,
                                  ),
                                  title: Text(
                                    item["data"]["title"],
                                    style: TextStyle(
                                      color: AppColor.white,
                                      fontSize: 16.sp,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  trailing: IntrinsicWidth(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Level ${box.get(item["data"]["title"])?["currentLevel"]} / 30",
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            color: AppColor.yellow,
                                          ),
                                        ),
                                        SizedBox(height: 5.h),
                                        Container(
                                          height: 6.h,
                                          decoration: BoxDecoration(
                                            color: AppColor.white,
                                            borderRadius:
                                                BorderRadius.circular(50.r),
                                          ),
                                          child: Container(
                                            height: 6.h,
                                            width:
                                                box.get(item["data"]["title"])?[
                                                        "currentLevel"] /
                                                    100,
                                            decoration: BoxDecoration(
                                              color: AppColor.white,
                                              borderRadius:
                                                  BorderRadius.circular(50.r),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          });
                        },
                      );
                    }),
              ),
              const Spacer(flex: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < selectItems.length; i++)
                    AnimatedContainer(
                      duration: .3.seconds,
                      margin: EdgeInsets.symmetric(horizontal: 5.sp),
                      width: 10.sp,
                      height: 10.sp,
                      decoration: BoxDecoration(
                        color: (pageIndex == i)
                            ? AppColor.yellow
                            : AppColor.lightRed,
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                    ),
                ],
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
