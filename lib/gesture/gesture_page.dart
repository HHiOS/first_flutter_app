import 'package:flutter/material.dart';

class GestureTestPageRoute extends StatefulWidget {
  GestureTestPageRoute({Key key}) : super(key: key);

  @override
  _GestureTestPageRouteState createState() => _GestureTestPageRouteState();
}

class _GestureTestPageRouteState extends State<GestureTestPageRoute> {
  List _items = [
    'GestureListener',
    'GestureDetector',
    'GestureRecognizer',
    '手势冲突',
  ];

  void clickList(int index) {
    String item = _items[index];
    if (item == 'GestureListener') {
      Navigator.of(context).pushNamed('gesture_listener_page');
    } else if (item == 'GestureDetector') {
      Navigator.of(context).pushNamed('gesture_detector_page');
    } else if (item == 'GestureRecognizer') {
      Navigator.of(context).pushNamed('gesture_recognizer_page');
    } else if (item == '手势冲突') {
      Navigator.of(context).pushNamed('gesture_conflict_page');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gesture'),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return TextButton(
            onPressed: () {
              clickList(index);
            },
            child: Text(
              _items[index],
              style: TextStyle(
                color: Colors.black54,
                fontSize: 16,
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            height: 1.0,
            indent: 10,
            endIndent: 10,
            color: Colors.grey,
          );
        },
        itemCount: _items.length,
      ),
    );
  }
}
