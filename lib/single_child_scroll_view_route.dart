import 'package:flutter/material.dart';

class SingleChildScrollViewRoute extends StatefulWidget {
  SingleChildScrollViewRoute({Key key}) : super(key: key);

  @override
  _SingleChildScrollViewRouteState createState() =>
      _SingleChildScrollViewRouteState();
}

class _SingleChildScrollViewRouteState
    extends State<SingleChildScrollViewRoute> {
  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scaffold(
      appBar: AppBar(
        title: Text('SingleChileScrollView'),
      ),
      body: Scrollbar(
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
      ),
    );
  }
}
