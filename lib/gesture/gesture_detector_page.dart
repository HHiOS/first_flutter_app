import 'package:flutter/material.dart';

class GestureDetectorTestPage extends StatefulWidget {
  GestureDetectorTestPage({Key key}) : super(key: key);

  @override
  _GestureDetectorTestPageState createState() =>
      _GestureDetectorTestPageState();
}

class _GestureDetectorTestPageState extends State<GestureDetectorTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GestureDetector'),
      ),
      body: Drag(),
    );
  }
}

class Drag extends StatefulWidget {
  Drag({Key key}) : super(key: key);

  @override
  _DragState createState() => _DragState();
}

class _DragState extends State<Drag> {
  double _top = 0.0;
  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: _top,
          left: _left,
          child: GestureDetector(
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text('ABC'),
            ),
            onPanDown: (e) {
              print('用户手指按下:${e.globalPosition}');
            },
            onPanUpdate: (e) {
              setState(() {
                _left += e.delta.dx;
                _top += e.delta.dy;
              });
            },
            onPanEnd: (e) {
              print(e.velocity);
            },
          ),
        ),
      ],
    );
  }
}
