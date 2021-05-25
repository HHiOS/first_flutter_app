import 'dart:math';

import 'package:flutter/material.dart';

class CustomPaintTestPage extends StatefulWidget {
  CustomPaintTestPage({Key key}) : super(key: key);

  @override
  _CustomPaintTestPageState createState() => _CustomPaintTestPageState();
}

class _CustomPaintTestPageState extends State<CustomPaintTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CustomPaint'),
      ),
      body: CustomPaintRoute(),
    );
  }
}

class CustomPaintRoute extends StatefulWidget {
  CustomPaintRoute({Key key}) : super(key: key);

  @override
  _CustomPaintRouteState createState() => _CustomPaintRouteState();
}

class _CustomPaintRouteState extends State<CustomPaintRoute> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(
              300,
              300,
            ),
            painter: ChessBoard(),
          ),
          CustomPaint(
            size: Size(
              300,
              300,
            ),
            painter: MyPainter(),
          ),
        ],
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    double eWidth = size.width / 15;
    double eHeight = size.height / 15;

    // 棋盘背景
    var paint = Paint();

    // 画一个黑子
    paint
      ..style = PaintingStyle.fill
      ..color = Colors.black;
    canvas.drawCircle(
      Offset(size.width / 2 - eWidth / 2, size.height / 2 - eHeight / 2),
      min(eWidth / 2, eHeight / 2) - 2,
      paint,
    );

    // 画一个白子
    paint.color = Colors.white;
    canvas.drawCircle(
      Offset(size.width / 2 + eWidth / 2, size.height / 2 + eHeight / 2),
      min(eWidth / 2, eHeight / 2) - 2,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

class ChessBoard extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    double eWidth = size.width / 15;
    double eHeight = size.height / 15;

    // 棋盘背景
    var paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..color = Color(0x77cdb175);
    canvas.drawRect(Offset.zero & size, paint);

    // 棋盘网格
    paint
      ..style = PaintingStyle.stroke
      ..color = Colors.black87
      ..strokeWidth = 1.0;

    for (var i = 0; i <= 15; i++) {
      double dy = eHeight * i;
      canvas.drawLine(Offset(0, dy), Offset(size.width, dy), paint);
    }

    for (var i = 0; i <= 15; i++) {
      double dx = eWidth * i;
      canvas.drawLine(Offset(dx, 0), Offset(dx, size.height), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
