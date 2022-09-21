import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../controller/game_controller.dart';
import 'button_game_widget.dart';

class GameConsole extends StatelessWidget {
  const GameConsole({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<GameController>(
      builder: (context, controller, _) {
        return Stack(
          alignment: Alignment.center,
          children: [

            if(!controller.canPlay)
            GestureDetector(
              onTap: (){controller.startSequence();},
              child: Container(
                height: size.width * .15,
                width: size.width * .15,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: const Icon(
                  Icons.play_circle_outline, size: 40,
                  color: Colors.black,
                ),
              ),
            ),

            if(controller.canPlay)
              SizedBox(
                height: size.width * .15,
                width: size.width * .15,
                child: Lottie.asset("assets/loading_color.json")
              ),


            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonGame(
                        subtractSize: controller.subtractRedPressSize,
                        opacity: controller.redOpacity,
                        color: Colors.red,
                        angle: 4,
                        onTapDown: (){
                        controller.pressButton(position: 1);
                        controller.playerIsPlaying(1);
                      },
                    ),

                    ButtonGame(
                      subtractSize: controller.subtractBluePressSize,
                      opacity: controller.blueOpacity,
                      color: Colors.blue,
                      angle: 1,
                      onTapDown: (){
                        controller.pressButton(position: 2);
                        controller.playerIsPlaying(2);
                      },
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    ButtonGame(
                      subtractSize: controller.subtractGreenPressSize,
                      opacity: controller.greenOpacity,
                      color: Colors.green,
                      angle: 3,
                      onTapDown: (){
                        controller.pressButton(position: 3);
                        controller.playerIsPlaying(3);
                      },
                    ),

                    ButtonGame(
                      subtractSize: controller.subtractYellowPressSize,
                      opacity: controller.yellowOpacity,
                      color: Colors.yellow,
                      angle: 2,
                      onTapDown: (){
                        controller.pressButton(position: 4);
                        controller.playerIsPlaying(4);
                      },
                    ),
                  ],
                ),

              ],
            ),
          ],
        );
      }
    );
  }
}
