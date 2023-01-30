
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:memory_man_app/controller/dialog_messages.dart';
import 'package:memory_man_app/controller/saved_data.dart';
import 'package:memory_man_app/controller/sound_controller.dart';
import 'package:flutter/services.dart';
import 'package:memory_man_app/controller/translator.dart';


class GameController extends ChangeNotifier{

  final SoundController sound;
  final DialogMessages message;
  final Data data;
  final Translator translator;

  GameController({
    required this.sound,
    required this.message,
    required this.data,
    required this.translator
  }){
    sound.start();
    _firstAnimationApp();
    _firstSequence();
    data.readRecord();
  }

  BuildContext? context;

  List sequence = [];
  List startAnimationSequence = [1,2,4,3,1,2,4,3,1,2,4,3];

  int score = 0;
  int level = 1;
  double scoreBar = 0;

  int numberOfPlays = 0;
  int numberOfLife = 3;

  bool canPlay = false;
  bool blockPlay = true;
  bool canSound = true;
  bool autoAdjustTimer = true;

  int animationTimer = 350;

  double redOpacity = 0.7;
  double subtractRedPressSize = 0;

  double blueOpacity = 0.7;
  double subtractBluePressSize = 0;

  double greenOpacity = 0.7;
  double subtractGreenPressSize = 0;

  double yellowOpacity = 0.7;
  double subtractYellowPressSize = 0;

  Language selectedLanguage = Language.Portuguese;


  playerIsPlaying(int position){
    print("PP");
    if(canPlay){
      if(numberOfPlays < sequence.length) {
          if(position != sequence[numberOfPlays]){
            _wrongPlay();
          } else if(numberOfPlays == sequence.length -1){
            _completedSequence();
          }else{
            _eachPlay();
          }
      }
    }
  }

  startSequence() async {
    print("SS");
    scoreBar = 0;
    numberOfPlays = 0;
    if(!canPlay){
      canPlay = true;
      blockPlay = true;
      for (int element in sequence) {
        await Future.delayed( Duration(milliseconds: animationTimer), () => pressButton(position: element));
      }
      canPlay = false;
    }
    await Future.delayed(const Duration(seconds: 1));
    canPlay = true;
    blockPlay = false;
    notifyListeners();
  }


  _completedSequence(){
    print("CS");
    canPlay = false;
    score++;
    level++;
    scoreBar = sequence.length.toDouble();
    numberOfPlays+=2;
    _addNewMemory();
    _autoAdjustTime();
    data.updateRecord(
        showMessage: true,
        context: context!,
        score: score,
        level: level
    );
    debugPrint(sequence.toString());
  }

  _eachPlay(){
    print("EP");
    numberOfPlays++;
    score++;
    scoreBar = numberOfPlays / sequence.length;
    data.updateRecord(
        showMessage: false,
        context: context!,
        score: score,
        level: level);
  }

  _wrongPlay(){
    sound.error();
    HapticFeedback.mediumImpact().timeout(Duration(seconds: 1));
    canPlay = false;
    numberOfLife--;
    if(numberOfLife == 0){
      message.gameOver(context).then((value) => resetGame() );
    }else{
      if(numberOfLife == 1) message.lostLife(context);
    }
    notifyListeners();
  }

  resetGame(){
    sequence = [];
    numberOfPlays = 0;
    numberOfLife = 3;
    score = 0;
    level = 1;
    scoreBar = 0;
    canPlay = false;
    _firstSequence();
    notifyListeners();
  }

  _firstSequence(){
    for(int i = 0; i < 4; i++){
      _addNewMemory();
    }
  }

  void pressButton({required int position}) async {
    if(canPlay) {
      if(canSound) sound.playSound(position);
      _buttonTransform(position);
      await Future.delayed(Duration(milliseconds: animationTimer));
      _buttonTransform(position);
    }
  }


  _addNewMemory(){
    var newElement = Random().nextInt(4);
    sequence.add(newElement + 1);
  }


  _buttonTransform(int position) async{
    switch(position) {
      case 1 :
        subtractRedPressSize = subtractRedPressSize == 10 ? 0 : 10;
        redOpacity = redOpacity == 1 ? 0.7 : 1;
        break;
      case 2 :
        subtractBluePressSize = subtractBluePressSize == 10 ? 0 : 10;
        blueOpacity = blueOpacity == 1 ? 0.7 : 1;
        break;
      case 3 :
        subtractGreenPressSize = subtractGreenPressSize == 10 ? 0 : 10;
        greenOpacity = greenOpacity == 1 ? 0.7 : 1;
        break;
      case 4 :
        subtractYellowPressSize = subtractYellowPressSize == 10 ? 0 : 10;
        yellowOpacity = yellowOpacity == 1 ? 0.7 : 1;
        break;
    }
    notifyListeners();
  }

  _firstAnimationApp() async {
    if(!canPlay){
      canPlay = true;
      canSound = false;
      animationTimer = 40;
      for( int element in startAnimationSequence ){
        await Future.delayed(const Duration(milliseconds: 40), () => pressButton(position: element));
        await Future.delayed(const Duration(milliseconds: 40), () => pressButton(position: element));
      }
      await Future.delayed(const Duration(milliseconds: 200));
      for( int element in startAnimationSequence.reversed ){
        await Future.delayed(const Duration(milliseconds: 40), () => pressButton(position: element));
        await Future.delayed(const Duration(milliseconds: 40), () => pressButton(position: element));
      }
      canPlay = false;
      canSound = true;
    }
    animationTimer = 350;
  }

  _autoAdjustTime(){
    if(level % 1 == 0 && animationTimer > 85 && autoAdjustTimer) animationTimer -= 5;
  }

  translate(){
    if(selectedLanguage == Language.Portuguese ) translator.portuguese();
    if(selectedLanguage == Language.English) translator.english();
    notifyListeners();
  }

}