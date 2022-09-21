import 'package:flutter/material.dart';

class ButtonPaint extends CustomPainter{

  final Color color;
  ButtonPaint({required this.color});

  @override
  void paint(Canvas canvas, Size size) {

    Paint paint0 = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;


    Path path0 = Path();
    path0.moveTo(size.width*0.7867857,size.height);
    path0.quadraticBezierTo(size.width*0.7946429,size.height*0.9021429,size.width*0.8514286,size.height*0.8432143);
    path0.quadraticBezierTo(size.width*0.9096429,size.height*0.7860714,size.width,size.height*0.7839286);
    path0.lineTo(size.width,0);
    path0.quadraticBezierTo(size.width*0.5739286,size.height*0.0046429,size.width*0.2957143,size.height*0.2703571);
    path0.quadraticBezierTo(size.width*0.0342857,size.height*0.5307143,0,size.height);
    path0.lineTo(0,size.height);
    path0.lineTo(size.width*0.4257143,size.height);
    path0.close();

    canvas.drawPath(path0, paint0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}