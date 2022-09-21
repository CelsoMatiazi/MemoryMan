import 'package:flutter/material.dart';
import 'package:memory_man_app/components/score_box.dart';
import 'package:provider/provider.dart';
import '../controller/game_controller.dart';

class ScoreWidget extends StatelessWidget {
  const ScoreWidget({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<GameController>(builder: (context, state, _) {
      return SizedBox(
        height: size.height * .22,
        child: Column(
          children: [
            const SizedBox(height: 10,),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red.withOpacity(0.5))
                  ),
                  child: LinearProgressIndicator(
                    value: state.scoreBar,
                    backgroundColor: Colors.black,
                    color: Colors.orange,
                    minHeight: 18,
                  ),
                )
            ),


            const SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ScoreBox(color: Colors.red, title: state.translator.text1, value: state.sequence.length - state.numberOfPlays,),
                  ScoreBox(color: Colors.green, title: state.translator.text2, value: state.score,),
                  ScoreBox(color: Colors.yellow, title: state.translator.text3, value: state.level,),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
