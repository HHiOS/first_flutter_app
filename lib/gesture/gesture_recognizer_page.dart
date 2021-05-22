import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GestureRecognizerTestRoute extends StatefulWidget {
  GestureRecognizerTestRoute({Key key}) : super(key: key);

  @override
  _GestureRecognizerTestRouteState createState() =>
      _GestureRecognizerTestRouteState();
}

class _GestureRecognizerTestRouteState
    extends State<GestureRecognizerTestRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GestureRecognizer'),
      ),
      body: GestureRecognizerTest(),
    );
  }
}

class GestureRecognizerTest extends StatefulWidget {
  GestureRecognizerTest({Key key}) : super(key: key);

  @override
  _GestureRecognizerTestState createState() => _GestureRecognizerTestState();
}

class _GestureRecognizerTestState extends State<GestureRecognizerTest> {
  TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();
  bool _toggle = false;

  @override
  void dispose() {
    // TODO: implement dispose
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '你好世界',
            ),
            TextSpan(
              text: '点我变色',
              style: TextStyle(
                fontSize: 30.0,
                color: _toggle ? Colors.blue : Colors.red,
              ),
              recognizer: _tapGestureRecognizer
                ..onTap = () {
                  setState(
                    () {
                      _toggle = !_toggle;
                    },
                  );
                },
            ),
            TextSpan(
              text: '你好世界',
            ),
          ],
        ),
      ),
    );
  }
}
