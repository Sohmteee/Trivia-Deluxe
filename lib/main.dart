import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:trivia/data/box.dart';
import 'package:trivia/data/controllers.dart';
import 'package:trivia/providers/audio.dart';
import 'package:trivia/providers/money.dart';
import 'package:trivia/providers/question.dart';
import 'package:trivia/providers/score.dart';
import 'package:trivia/providers/stage.dart';
import 'package:trivia/providers/time.dart';
import 'package:trivia/screens/ad.dart';
import 'package:trivia/screens/game.dart';
import 'package:trivia/screens/menu.dart';
import 'package:trivia/screens/reward.dart';
import 'package:trivia/screens/select.dart';
import 'package:trivia/screens/stage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  await Hive.initFlutter();
  final dir = await getApplicationDocumentsDirectory();
  Hive.openBox("myBox", path: dir.path);
  box = await Hive.openBox("myBox");

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StageProvider()),
        ChangeNotifierProvider(create: (_) => QuestionProvider()),
        ChangeNotifierProvider(create: (_) => TimeProvider()),
        ChangeNotifierProvider(create: (_) => MoneyProvider()),
        ChangeNotifierProvider(create: (_) => AudioProvider()),
        ChangeNotifierProvider(create: (_) => ScoreProvider()),
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
              '/stage': (context) => const StageScreen(),
              '/select': (context) => const SelectScreen(),
              '/ad': (context) => AdScreen(),
              '/reward': (context) => const RewardScreen(),
            },
          );
        });
  }
}

Future<void> playTap(context) async {
  final audioProvider = Provider.of<AudioProvider>(context, listen: false);

  if (audioProvider.soundEffects) {
    await tapPlayer.stop();
    await tapPlayer.play(AssetSource("audio/tap-2.mp3"));

    debugPrint("Play Tap");
  }
}

Future<void> playCorrect(context) async {
  final audioProvider = Provider.of<AudioProvider>(context, listen: false);

  if (audioProvider.soundEffects) {
    await correctPlayer.stop();
    await correctPlayer.play(AssetSource("audio/correct.mp3"));

    debugPrint("Play Correct");
  }
}

Future<void> playWrong(context) async {
  final audioProvider = Provider.of<AudioProvider>(context, listen: false);

  if (audioProvider.soundEffects) {
    await wrongPlayer.stop();
    await wrongPlayer.play(AssetSource("audio/wrong.mp3"));

    debugPrint("Play Wrong");
  }
}

Future<void> playUnavailable(context) async {
  final audioProvider = Provider.of<AudioProvider>(context, listen: false);

  if (audioProvider.soundEffects) {
    await unavailablePlayer.stop();
    await unavailablePlayer
        .play(AssetSource("audio/unavailable-selection.mp3"));

    debugPrint("Play Unavailable");
  }
}

Future<void> playVictory(context) async {
  final audioProvider = Provider.of<AudioProvider>(context, listen: false);

  if (audioProvider.soundEffects) {
    await victoryPlayer.setSource(AssetSource("audio/victory.mp3"));
    await victoryPlayer.resume();
  }
}

Future<void> playLevel(context) async {
  final audioProvider = Provider.of<AudioProvider>(context, listen: false);

  if (audioProvider.soundEffects) {
    await levelPlayer.setSource(AssetSource("audio/stage.mp3"));
    await levelPlayer.resume();
  }
}

Future<void> playRedeem(context) async {
  final audioProvider = Provider.of<AudioProvider>(context, listen: false);

  if (audioProvider.soundEffects) {
    await redeemPlayer.setSource(AssetSource("audio/redeem.mp3"));
    await redeemPlayer.resume();
  }
}

Future<void> playCoinUp(context) async {
  final audioProvider = Provider.of<AudioProvider>(context, listen: false);

  if (audioProvider.soundEffects) {
    await coinUpPlayer.setSource(AssetSource("audio/coin-up.mp3"));
    await coinUpPlayer.resume();
  }
}

Future<void> playCoinDown(context) async {
  final audioProvider = Provider.of<AudioProvider>(context, listen: false);

  if (audioProvider.soundEffects) {
    await coinDownPlayer.setSource(AssetSource("audio/coin-down.mp3"));
    await coinDownPlayer.resume();
  }
}
