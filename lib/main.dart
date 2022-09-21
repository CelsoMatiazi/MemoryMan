
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:memory_man_app/controller/game_controller.dart';
import 'package:memory_man_app/controller/dialog_messages.dart';
import 'package:memory_man_app/controller/sound_controller.dart';
import 'package:memory_man_app/controller/translator.dart';
import 'package:memory_man_app/ui/home.dart';
import 'package:memory_man_app/ui/splash_screen.dart';
import 'package:provider/provider.dart';

import 'controller/saved_data.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.black
      )
  );

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);


  runApp(const SplashScreen());

  await Future.delayed(const Duration(seconds: 6));

  var translator = Translator();

  runApp(ChangeNotifierProvider(
      create: (context) => GameController(
          sound: SoundController(),
          message: DialogMessages(translator: translator),
          data: Data(message: DialogMessages(translator: translator)),
          translator: translator
      ),
      child: const MyApp()
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

