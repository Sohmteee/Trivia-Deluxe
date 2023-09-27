import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trivia/data/controllers.dart';
import 'package:trivia/providers/audio.dart';
import 'package:trivia/providers/level.dart';
import 'package:trivia/providers/money.dart';
import 'package:trivia/providers/question.dart';
import 'package:trivia/providers/time.dart';
import 'package:trivia/screens/ad.dart';
import 'package:trivia/screens/game.dart';
import 'package:trivia/screens/level.dart';
import 'package:trivia/screens/menu.dart';
import 'package:trivia/screens/select.dart';
import 'package:trivia/screens/reward.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  await bgPlayer.setSource(AssetSource("audio/bg-music.mp3"));

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LevelProvider()),
        ChangeNotifierProvider(create: (_) => QuestionProvider()),
        ChangeNotifierProvider(create: (_) => TimeProvider()),
        ChangeNotifierProvider(create: (_) => MoneyProvider()),
        ChangeNotifierProvider(create: (_) => AudioProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            title: 'Trivia Deluxe',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.red,
              ),
              fontFamily: "Race",
            ),
            // home: const RewardScreen(),
            home: const MenuScreen(),
            debugShowCheckedModeBanner: false,
            routes: {
              '/menu': (context) => const MenuScreen(),
              '/game': (context) => const GameScreen(),
              '/level': (context) => const LevelScreen(),
              '/select': (context) => const SelectScreen(),
              '/ad': (context) => AdScreen(),
              '/victory': (context) => const RewardScreen(),
            },
          );
        });
  }
}
