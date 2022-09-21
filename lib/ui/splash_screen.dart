import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{


  double turns = 0;

  _logoAnimation(){
    setState(() {
      turns = 1;
    });
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future.delayed(const Duration(milliseconds: 500), () => _logoAnimation());
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [

        Center(
          child: AnimatedRotation(
            turns: turns,
            duration: const Duration(seconds: 5),
            curve: Curves.easeInOutCubic,
            child: Center(child: Image.asset("assets/memory_man_icon_150.png")),
          ),
        ),


        Padding(
          padding: const EdgeInsets.only(bottom: 80),
          child: AnimatedOpacity(
              opacity: turns,
              duration: const Duration(seconds: 5),
              child: Image.asset("assets/mm_title.png", width: 250,),
          ),
        ),

      ],
    );
  }
}
