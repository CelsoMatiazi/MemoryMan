import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';

class ScoreBox extends StatelessWidget {
  const ScoreBox({
    Key? key,
    required this.color,
    required this.title,
    required this.value,
  }) : super(key: key);

  final Color color;
  final String title;
  final int value;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(8),
      height: size.width / 4,
      width: size.width / 4,
      decoration: BoxDecoration(
          border: Border.all(color: color),
          borderRadius: BorderRadius.circular(12)
      ),
      child: Column(
        children: [
          Text(title,
            style: TextStyle(
              color: color,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 10,),
          FittedBox(
            child: AnimatedFlipCounter(
                value: value,
                textStyle: TextStyle(
                    color: color,
                    fontSize: 35,
                    fontWeight: FontWeight.bold
                ),

            ),
          )
        ],
      ),

    );
  }
}