import 'package:flutter/material.dart';
import 'package:memory_man_app/components/box_languages.dart';
import 'package:memory_man_app/components/box_sound_selector.dart';
import 'package:memory_man_app/components/time_adjust.dart';
import 'package:memory_man_app/controller/game_controller.dart';
import 'package:provider/provider.dart';


class BoxSettings extends StatefulWidget {
  const BoxSettings({
    Key? key,
  }) : super(key: key);

  @override
  State<BoxSettings> createState() => _BoxSettingsState();
}

class _BoxSettingsState extends State<BoxSettings> {

  var boxHeight = -260.00;

  _openBox(){
    boxHeight = boxHeight == -260 ? 0 : -260;
    setState(() {});
  }

  _resetGame(){
    var state = Provider.of<GameController>(context, listen: false);
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.grey[900],
          title:  Text("Reset", style: TextStyle(color: Colors.red[700]),),
          content: Text(state.translator.text6,
            style: TextStyle(
                color: Colors.white
            ),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(state.translator.text8,
                  style: TextStyle(
                      color: Colors.red[700],
                      fontSize: 18
                  ),
                )
            ),
            TextButton(
                onPressed: (){
                  context.read<GameController>().resetGame();
                  Navigator.pop(context);
                  _openBox();
                },
                child: Text(state.translator.text7,
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 18
                    )
                )
            )
          ],
        )
    );
  }


  _gameTimer(){
    showModalBottomSheet(
        context: context, builder: (context) => const TimeAdjust()
    );
  }

  _gameSound(){
    showModalBottomSheet(
        context: context, builder: (context) => const SoundSelector()
    );
  }

  _gameConfig(){
    showModalBottomSheet(
        context: context, builder: (context) => const Languages()
    );
  }


  @override
  Widget build(BuildContext context) {
    var state = Provider.of<GameController>(context);
    var size = MediaQuery.of(context).size;
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 400),
      bottom: boxHeight,
      child: SizedBox(
        width: size.width,
        height: 300,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [

            Container(
              alignment: Alignment.topCenter,
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.65),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white38, width: 2)
              ),

              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: _openBox,
                icon: Icon(
                  boxHeight == 0 ?Icons.arrow_downward : Icons.arrow_upward,
                  color: Colors.white54,),
              ),
            ),

            GestureDetector(
              onVerticalDragUpdate: (value){
                if(value.delta.dy > 5){
                  _openBox();
                }
              },
              child: Column(
                children: [
                  const SizedBox(height: 40,),
                  Expanded(
                      child: Container(
                        width: size.width,
                        decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50)
                          )
                        ),

                        child: Column(
                          children: [
                            const SizedBox(height: 20,),
                            Text(state.translator.text4,
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),

                            const SizedBox(height: 10,),
                            Container(
                              height: 70,
                              width: size.width * .8,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.green, width: .7)
                              ),

                              child: Row(
                                children: [

                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(state.translator.text2,
                                          style: TextStyle(color: Colors.green),
                                        ),

                                        Text("${state.data.scoreRecordSaved}",
                                          style: const TextStyle(
                                              color: Colors.green,
                                              fontSize: 28,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Container(
                                    height: 40,
                                    width: 2,
                                    color: Colors.white24,
                                  ),

                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children:  [
                                        Text(state.translator.text3,
                                          style: TextStyle(color: Colors.green),
                                        ),

                                        Text("${state.data.levelRecordSaved}",
                                          style: const TextStyle(
                                              color: Colors.green,
                                              fontSize: 28,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ),


                            const SizedBox(height: 20,),
                            Text(state.translator.text5,
                              style: TextStyle(
                                  color: Colors.white24,
                                  fontSize: 16
                              ),),
                            const SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                  padding: EdgeInsets.zero,
                                    onPressed: _gameConfig,
                                    icon: const Icon(
                                      Icons.settings,
                                      color: Colors.white24,
                                      size: 35,
                                    )
                                ),


                                Container(
                                  margin: const EdgeInsets.only(right: 5, left: 10),
                                  height: 40,
                                  width: 2,
                                  color: Colors.white24,
                                ),

                                IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: _gameSound,
                                    icon: const Icon(
                                      Icons.music_note,
                                      color: Colors.white24,
                                      size: 35,
                                    )
                                ),

                                Container(
                                  margin: const EdgeInsets.only(left: 5, right: 5),
                                  height: 40,
                                  width: 1,
                                  color: Colors.white24,
                                ),

                                IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: _gameTimer,
                                    icon: const Icon(
                                      Icons.timer,
                                      color: Colors.white24,
                                      size: 35,
                                    )
                                ),

                                Container(
                                  margin: const EdgeInsets.only(left: 5, right: 5),
                                  height: 40,
                                  width: 1,
                                  color: Colors.white24,
                                ),

                                IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: _resetGame,
                                    icon: const Icon(
                                      Icons.refresh,
                                      color: Colors.white24,
                                      size: 35,
                                    )
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}