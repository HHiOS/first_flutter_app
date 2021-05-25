import 'package:flutter/material.dart';

class CustomTestPage extends StatefulWidget {
  CustomTestPage({Key key}) : super(key: key);

  @override
  _CustomTestPageState createState() => _CustomTestPageState();
}

class _CustomTestPageState extends State<CustomTestPage> {
  List _items = [
    'GradientButton',
    'TurnBox',
    'CustomPaint&Canvas',
    'GradientCircularProgressIndicator',
  ];

  void clickList(int index) {
    String item = _items[index];
    if (item == 'GradientButton') {
      Navigator.of(context).pushNamed('custom_gradient_button_page');
    } else if (item == 'TurnBox') {
      Navigator.of(context).pushNamed('custom_turn_box_page');
    } else if (item == 'CustomPaint&Canvas') {
      Navigator.of(context).pushNamed('custom_paint_page');
    } else if (item == 'GradientCircularProgressIndicator') {
      Navigator.of(context).pushNamed('custom_indicator_page');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom'),
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
