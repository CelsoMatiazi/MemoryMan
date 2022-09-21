
import '../../components/box_sound_selector.dart';
import 'package:just_audio/just_audio.dart';

class SoundController{

  SoundController(){ _init(); }

  late var sound;
  late var errorSound;

  _init(){
    sound = AudioPlayer();
    errorSound = AudioPlayer();
  }

  Chord selectedChord = Chord.maior7M;
  List notesList = [];

  Future<void> playSound(int position) async {
    var notesPath = _setChord(selectedChord);
    switch(position){
      case 1 :
        await sound.setAsset('assets/sounds/${notesPath[0]}');
        sound.play();
        break;
      case 2 :
        await sound.setAsset('assets/sounds/${notesPath[1]}');
        sound.play();
        break;
      case 3 :
        await sound.setAsset('assets/sounds/${notesPath[2]}');
        sound.play();
        break;
      case 4 :
        await sound.setAsset('assets/sounds/${notesPath[3]}');
        sound .play();
        break;
    }
  }

  Future<void> error() async {
    await errorSound.setAsset('assets/sounds/error.wav');
    errorSound.play();
  }

  Future<void> start() async {
    await sound.setAsset('assets/sounds/start2.wav');
    sound.play();
  }

  List<String> _setChord(Chord chord){
    switch(chord){
      case Chord.maior7M : return ["do.wav", "mi.wav", "sol.wav", "si.wav"];
      case Chord.menor7M : return ["do.wav", "mib.wav", "sol.wav", "si.wav"];
      case Chord.maior7 : return ["do.wav", "mi.wav", "sol.wav", "sib.wav"];
      case Chord.menor7 : return ["do.wav", "mib.wav", "sol.wav", "sib.wav"];
      case Chord.meioDiminuto : return ["do.wav", "mib.wav", "solb.wav", "sib.wav"];
    }
  }


}
