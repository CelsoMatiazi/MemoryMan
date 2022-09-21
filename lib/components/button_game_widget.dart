import 'package:flutter/material.dart';
import 'button_paint.dart';

class ButtonGame extends StatelessWidget {
  const ButtonGame({
    Key? key,
    required this.subtractSize,
    required this.opacity,
    required this.color,
    required this.onTapDown,
    required this.angle,
  }) : super(key: key);

  final double subtractSize;
  final double opacity;
  final Color color;
  final VoidCallback onTapDown;
  final int angle;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTapDown: (value){
        onTapDown();
      },
      child: Stack(
        alignment: Alignment.center,
        children: [


          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: subtractSize == 0 ? Colors.transparent : color,
                    blurRadius: 100,
                    spreadRadius: 70,
                )
              ]


            ),
          ),


          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: EdgeInsets.all(subtractSize),
            margin: const EdgeInsets.all(10),
            height: size.width / 2 - 30,
            width: size.width /2 -30,
            child: RotatedBox(
              quarterTurns: angle,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: opacity,
                child: CustomPaint(
                  size: Size(size.width, size.width),
                  painter: ButtonPaint(color: color),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}