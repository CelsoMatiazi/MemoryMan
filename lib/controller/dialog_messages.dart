import 'package:flutter/material.dart';
import 'package:memory_man_app/controller/translator.dart';
import '../../components/show_dialog.dart';

class DialogMessages{

  final Translator translator;

  DialogMessages({required this.translator});

  lostLife(context){
    _showBanner(
        context: context,
        path: "assets/bye_heart.json",
        title: "Oh No!",
        content: translator.text25
    );
  }

  record(context){
    _showBanner(
        context: context,
        path: "assets/olympic.json",
        title: translator.text26,
        content: translator.text27
    );
  }


  // dance(context){
  //   _showBanner(
  //       context: context,
  //       path: "assets/dance.json",
  //       title: "Yes",
  //       content: "Você esta arrebentando!!!."
  //   );
  // }

  Future<void> gameOver(context) async{
    await _showBanner(
        context: context,
        path: "assets/game_over.json",
        title: translator.text28,
        content: translator.text29
    );
  }


 Future _showBanner({
    required BuildContext context,
    required String path,
    required String title,
    required String content
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context){
          return  ShowDialog(
            path: path,
            title: title,
            content: content,
            btnLabel: translator.text30,
          );
        }
    );
  }

}