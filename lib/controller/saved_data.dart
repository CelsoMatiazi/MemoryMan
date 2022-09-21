
import 'package:memory_man_app/controller/dialog_messages.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class Data{
  final DialogMessages message;
  Data({required this.message});

  late final SharedPreferences prefs ;

  int scoreRecordSaved = 0;
  int levelRecordSaved = 0;

  updateRecord({
    required bool showMessage,
    required int score,
    required int level,
    required BuildContext context,
  }) async {
    if(score > scoreRecordSaved) {
      scoreRecordSaved = score;
      levelRecordSaved = level;
      saveRecord(score: score, level: level);
      if(level > 5 && showMessage) message.record(context);
    }
  }

  saveRecord({
    required int score,
    required int level,
}) async {
    await prefs.setInt('score', score);
    await prefs.setInt('level', level);
  }

  readRecord() async {
    prefs = await SharedPreferences.getInstance();
    scoreRecordSaved = prefs.getInt('score') ?? 0;
    levelRecordSaved = prefs.getInt('level') ?? 0;
  }
}