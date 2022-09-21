import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/game_controller.dart';

enum Chord { maior7, menor7, maior7M, menor7M, meioDiminuto }

class SoundSelector extends StatefulWidget {
  const SoundSelector({Key? key}) : super(key: key);

  @override
  State<SoundSelector> createState() => _SoundSelectorState();
}

class _SoundSelectorState extends State<SoundSelector> {

  Chord? _selectedChord = Chord.maior7;

  @override
  Widget build(BuildContext context) {
    var status = Provider.of<GameController>(context, listen: false);
    _selectedChord = status.sound.selectedChord;
    //status.sound.loadSoundCache();
    return Container(
      padding: const EdgeInsets.all(20),
      height: 380,
      width: double.maxFinite,
      color: Colors.amber[700],
      child: Column(
        children:  [
          Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              width: double.maxFinite,
              color: Colors.black,
              child: Text(status.translator.text15.toUpperCase(),
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.amber
                ),
              )
          ),
          const SizedBox(height: 10,),
          Text(status.translator.text16,
            style: TextStyle(fontSize: 15),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 0,),
          Container(
            height: 40,
            child: RadioListTile<Chord>(
                activeColor: Colors.green[800],
                contentPadding: EdgeInsets.zero,
                title: Text(status.translator.text17),
                value: Chord.maior7,
                groupValue: _selectedChord,
                onChanged: (Chord? value){
                  status.sound.selectedChord = value!;
                  setState(() {
                    _selectedChord = value;
                  });
                }
            ),
          ),
          Container(
            height: 40,
            child: RadioListTile<Chord>(
                activeColor: Colors.green[800],
                contentPadding: EdgeInsets.zero,
                title: Text(status.translator.text18),
                value: Chord.menor7,
                groupValue: _selectedChord,
                onChanged: (Chord? value){
                  status.sound.selectedChord = value!;
                  setState(() {
                    _selectedChord = value;
                  });
                }
            ),
          ),
          Container(
            height: 40,
            child: RadioListTile<Chord>(
                activeColor: Colors.green[800],
                contentPadding: EdgeInsets.zero,
                title: Text(status.translator.text19),
                value: Chord.maior7M,
                groupValue: _selectedChord,
                onChanged: (Chord? value){
                  status.sound.selectedChord = value!;
                  setState(() {
                    _selectedChord = value;
                  });
                }
            ),
          ),
          Container(
            height: 40,
            child: RadioListTile<Chord>(
                activeColor: Colors.green[800],
                contentPadding: EdgeInsets.zero,
                title: Text(status.translator.text20),
                value: Chord.menor7M,
                groupValue: _selectedChord,
                onChanged: (Chord? value){
                  status.sound.selectedChord = value!;
                  setState(() {
                    _selectedChord = value;
                  });
                }
            ),
          ),
          Container(
            height: 40,
            child: RadioListTile<Chord>(
                activeColor: Colors.green[800],
                contentPadding: EdgeInsets.zero,
                title: Text(status.translator.text21),
                value: Chord.meioDiminuto,
                groupValue: _selectedChord,
                onChanged: (Chord? value){
                  status.sound.selectedChord = value!;
                  setState(() {
                    _selectedChord = value;
                  });
                }
            ),
          ),
        ],
      ),
    );
  }
}
