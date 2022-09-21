import 'package:flutter/material.dart';
import '../components/box_settings.dart';
import '../components/game_console.dart';
import '../components/game_life.dart';
import '../components/game_score.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: size.height,
        width: size.width,
        color: Colors.black,
        child: SafeArea(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [

              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [

                  Spacer(),
                  GameLife(),
                  //Spacer(),
                  GameConsole(),
                  Spacer(),
                  ScoreWidget(),
                  //Spacer(),
                  SizedBox(height: 50,)
                ],
              ),

              const BoxSettings(),

            ],
          ),
        ),
      ),
    );
  }
}




