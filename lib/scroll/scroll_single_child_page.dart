import 'package:flutter/material.dart';

class ScrollSingleChildTestPage extends StatefulWidget {
  ScrollSingleChildTestPage({Key key}) : super(key: key);

  @override
  _ScrollSingleChildTestPageState createState() =>
      _ScrollSingleChildTestPageState();
}

class _ScrollSingleChildTestPageState extends State<ScrollSingleChildTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SingleChildScrollView'),
      ),
      body: SingleChildScrollViewTestRoute(),
    );
  }
}

class SingleChildScrollViewTestRoute extends StatelessWidget {
  const SingleChildScrollViewTestRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Container(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: str
                .split("")
                .map(
                  (e) => Text(
                    e,
                    textScaleFactor: 2.0,
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
