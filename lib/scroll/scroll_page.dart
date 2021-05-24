import 'package:flutter/material.dart';

class ScrollTestPage extends StatefulWidget {
  ScrollTestPage({Key key}) : super(key: key);

  @override
  _ScrollTestPageState createState() => _ScrollTestPageState();
}

class _ScrollTestPageState extends State<ScrollTestPage> {
  List _items = [
    'SingleChildScrollView',
    'ListView',
    'GridView',
    'CustomScrollView',
  ];

  void clickList(int index) {
    String item = _items[index];
    if (item == 'SingleChildScrollView') {
      Navigator.of(context).pushNamed('scroll_single_child_page');
    } else if (item == 'ListView') {
      Navigator.of(context).pushNamed('scroll_list_page');
    } else if (item == 'GridView') {
      Navigator.of(context).pushNamed('scroll_grid_page');
    } else if (item == 'CustomScrollView') {
      Navigator.of(context).pushNamed('scroll_custom_page');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scroll'),
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
