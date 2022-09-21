import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ShowDialog extends StatelessWidget {
  const ShowDialog({
    Key? key,
    required this.path,
    required this.title,
    required this.content,
    required this.btnLabel
  }) : super(key: key);

  final String path;
  final String title;
  final String content;
  final String btnLabel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      content:  SizedBox(
        height: 420,
        width: 400,
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 27),
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(path, height: 250,),
               // const SizedBox(height: 30,),
                Text(title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,),
                const SizedBox(height: 5,),
                Text(content,
                  style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 16
                  ),
                  textAlign: TextAlign.center,),
                GestureDetector(
                  onTap: (){ Navigator.pop(context); },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    margin: const EdgeInsets.all(20),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.green, width: 3)
                    ),
                    child: Text(btnLabel,
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 18
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
