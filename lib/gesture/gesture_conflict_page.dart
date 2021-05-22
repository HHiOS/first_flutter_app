import 'package:flutter/material.dart';

class GestureConflictTestPage extends StatefulWidget {
  GestureConflictTestPage({Key key}) : super(key: key);

  @override
  _GestureConflictTestPageState createState() =>
      _GestureConflictTestPageState();
}

class _GestureConflictTestPageState extends State<GestureConflictTestPage> {
  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GestureConflict'),
      ),
      body: Stack(
        children: [
          Positioned(
            left: _left,
            child: Listener(
              onPointerDown: (e) {
                print('onPointerDown');
              },
              onPointerUp: (e) {
                print('onPointerUp');
              },
              child: GestureDetector(
                child: CircleAvatar(
                  child: Text('A'),
                ),
                onHorizontalDragUpdate: (e) {
                  setState(() {
                    _left += e.delta.dx;
                  });
                },
                onHorizontalDragEnd: (e) {
                  print('onHorizontalDragEnd');
                },
                onTapDown: (e) {
                  print('onTapDown');
                },
                onTapUp: (e) {
                  print('onTapUp');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
