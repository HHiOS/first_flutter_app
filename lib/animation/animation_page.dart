import 'package:flutter/material.dart';

class AnimationTestPage extends StatefulWidget {
  AnimationTestPage({Key key}) : super(key: key);

  @override
  _AnimationTestPageState createState() => _AnimationTestPageState();
}

class _AnimationTestPageState extends State<AnimationTestPage> {
  List _items = [
    'AnimationBasic',
    'AnimationRoute',
    'AnimationHero',
    'AnimationStagger',
    'AnimationSwitcher',
    'AnimationCustom',
  ];

  void clickList(int index) {
    String item = _items[index];
    if (item == 'AnimationBasic') {
      Navigator.of(context).pushNamed('animation_basic_page');
    } else if (item == 'AnimationRoute') {
      Navigator.of(context).pushNamed('animation_route_page');
    } else if (item == 'AnimationHero') {
      Navigator.of(context).pushNamed('animation_hero_page');
    } else if (item == 'AnimationStagger') {
      Navigator.of(context).pushNamed('animation_stagger_page');
    } else if (item == 'AnimationSwitcher') {
      Navigator.of(context).pushNamed('animation_switcher_page');
    } else if (item == 'AnimationCustom') {
      Navigator.of(context).pushNamed('animation_custom_page');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation'),
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
