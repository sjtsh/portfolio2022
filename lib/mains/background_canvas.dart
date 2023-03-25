import 'dart:math';

import 'package:flutter/material.dart';

class BackgroundCanvas extends CustomPainter {
  // final Size size;
  //
  // BackgroundCanvas(this.size);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Random random = Random(DateTime.now().second);
    int myRandomNumber = random.nextInt(600);
    int numberOfStars =
        myRandomNumber > 300 ? myRandomNumber : myRandomNumber + 300;
    for (int i = 0; i < numberOfStars; i++) {
      paint.color = Colors.white.withOpacity(random.nextInt(20) / 100);
      Offset offset = Offset(random.nextInt(size.width.ceil()) + 0.0,
          random.nextInt(size.height.ceil()) + 0.0);
      canvas.drawCircle(offset, random.nextInt(50) / 10, paint);
    }

    double padding = 30;
    for (int i = 0; i < 100; i++) {
      paint.color = Colors.white.withOpacity(random.nextInt(80) / 100);
      Offset offset = Offset(random.nextInt(150) + (size.width -150 - padding),
          random.nextInt(80)+padding);
      canvas.drawCircle(offset, random.nextInt(30) / 10, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw false;
  }
}
