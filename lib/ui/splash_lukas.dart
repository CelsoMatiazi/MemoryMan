import 'package:flutter/material.dart';


class SplashLukas extends StatelessWidget {
  const SplashLukas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [


        Spacer(),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: Colors.white60,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueAccent,
                    spreadRadius: 100,
                    blurRadius: 100,


                  )
                ]
              ),

            ),

            Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  //color: Colors.red,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/lukas_img.png')
                  )
                ),
                child: SizedBox()
            ),
          ],
        ),

        Spacer(),

        Padding(
          padding: const EdgeInsets.only(bottom: 80),
          child: AnimatedOpacity(
            opacity: 1,
            duration: const Duration(seconds: 5),
            child: Image.asset("assets/memoluka_logo.png", width: 250,),
          ),
        ),


      ],
    );
  }
}
