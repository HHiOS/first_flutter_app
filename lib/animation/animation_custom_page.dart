import 'package:flutter/material.dart';

class AnimationCustomTestPage extends StatefulWidget {
  AnimationCustomTestPage({Key key}) : super(key: key);

  @override
  _AnimationCustomTestPageState createState() =>
      _AnimationCustomTestPageState();
}

class _AnimationCustomTestPageState extends State<AnimationCustomTestPage> {
  Color _decorationColor = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimationCustom'),
      ),
      body: Center(
        child: Column(
          children: [
            AnimatedDecoratedBox(
              decoration: BoxDecoration(color: _decorationColor),
              duration: Duration(
                milliseconds: _decorationColor == Colors.red ? 400 : 2000,
              ),
              curve: Curves.ease,
              child: Builder(
                builder: (context) {
                  return TextButton(
                    onPressed: () {
                      setState(() {
                        _decorationColor = _decorationColor == Colors.blue
                            ? Colors.red
                            : Colors.blue;
                      });
                    },
                    child: Text(
                      'AnimatedDecoratedBox',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
            ),
            AnimatedWidgetsTest(),
          ],
        ),
      ),
    );
  }
}

class AnimatedDecoratedBox extends ImplicitlyAnimatedWidget {
  AnimatedDecoratedBox({
    Key key,
    @required this.decoration,
    this.child,
    Curve curve = Curves.linear,
    @required Duration duration,
    // this.curve,
    // @required this.duration,
    this.reverseDuration,
  }) : super(key: key, curve: curve, duration: duration);

  final BoxDecoration decoration;
  final Widget child;
  // final Duration duration;
  // final Curve curve;
  final Duration reverseDuration;

  @override
  _AnimatedDecoratedBoxState createState() => _AnimatedDecoratedBoxState();
}

class _AnimatedDecoratedBoxState
    extends AnimatedWidgetBaseState<AnimatedDecoratedBox> {
  // @protected
  // AnimationController get controller => _controller;
  // AnimationController _controller;

  // Animation<double> get animation => _animation;
  // Animation<double> _animation;

  DecorationTween _tween;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: _tween.evaluate(animation),
      child: widget.child,
    );
    // return AnimatedBuilder(
    //   animation: _animation,
    //   builder: (context, child) {
    //     return DecoratedBox(
    //       decoration: _tween.animate(_animation).value,
    //       child: child,
    //     );
    //   },
    //   child: widget.child,
    // );
  }

  // void _updateCurve() {
  //   if (widget.curve != null) {
  //     _animation = CurvedAnimation(parent: _controller, curve: widget.curve);
  //   } else {
  //     _animation = _controller;
  //   }
  // }
  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _controller = AnimationController(
  //     vsync: this,
  //     duration: widget.duration,
  //     reverseDuration: widget.reverseDuration,
  //   );
  //   _tween = DecorationTween(begin: widget.decoration);
  //   _updateCurve();
  // }

  // @override
  // void didUpdateWidget(covariant AnimatedDecoratedBox oldWidget) {
  //   // TODO: implement didUpdateWidget
  //   super.didUpdateWidget(oldWidget);
  //   if (widget.curve != oldWidget.curve) {
  //     _updateCurve();
  //   }
  //   _controller.duration = widget.duration;
  //   _controller.reverseDuration = widget.reverseDuration;
  //   if (widget.decoration != (_tween.end ?? _tween.begin)) {
  //     _tween
  //       ..begin = _tween.evaluate(_animation)
  //       ..end = widget.decoration;
  //     _controller
  //       ..value = 0.0
  //       ..forward();
  //   }
  // }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   _controller.dispose();
  //   super.dispose();
  // }

  @override
  void forEachTween(TweenVisitor visitor) {
    // TODO: implement forEachTween
    _tween = visitor(_tween, widget.decoration, (value) {
      return DecorationTween(begin: value);
    });
  }
}

class AnimatedWidgetsTest extends StatefulWidget {
  AnimatedWidgetsTest({Key key}) : super(key: key);

  @override
  _AnimatedWidgetsTestState createState() => _AnimatedWidgetsTestState();
}

class _AnimatedWidgetsTestState extends State<AnimatedWidgetsTest> {
  double _padding = 10;
  var _align = Alignment.topRight;
  double _height = 100;
  double _left = 0;
  Color _color = Colors.red;
  TextStyle _style = TextStyle(color: Colors.black);
  Color _decorationColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    var duration = Duration(seconds: 5);
    return SingleChildScrollView(
      child: Column(
        children: [
          TextButton(
            onPressed: () {
              setState(() {
                _padding = 20;
              });
            },
            child: AnimatedPadding(
              padding: EdgeInsets.all(_padding),
              duration: duration,
              child: Text(
                'AnimatedPadding',
              ),
            ),
          ),
          SizedBox(
            height: 50,
            child: Stack(
              children: [
                AnimatedPositioned(
                  left: _left,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        _left = 100;
                      });
                    },
                    child: Text('AnimatedPositioned'),
                  ),
                  duration: duration,
                ),
              ],
            ),
          ),
          Container(
            height: 100,
            color: Colors.grey,
            child: AnimatedAlign(
              duration: duration,
              alignment: _align,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    _align = Alignment.center;
                  });
                },
                child: Text('AnimatedAlign'),
              ),
            ),
          ),
          AnimatedContainer(
            duration: duration,
            height: _height,
            color: _color,
            child: TextButton(
              onPressed: () {
                setState(() {
                  _height = 150;
                  _color = Colors.blue;
                });
              },
              child: Text(
                'AnimatedContainer',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          AnimatedDefaultTextStyle(
            child: GestureDetector(
              child: Text('hello world'),
              onTap: () {
                setState(() {
                  _style = TextStyle(
                    color: Colors.blue,
                    decorationStyle: TextDecorationStyle.solid,
                    decorationColor: Colors.blue,
                  );
                });
              },
            ),
            style: _style,
            duration: duration,
          ),
          AnimatedDecoratedBox(
            decoration: BoxDecoration(
              color: _decorationColor,
            ),
            duration: duration,
            child: TextButton(
              onPressed: () {
                setState(() {
                  _decorationColor = Colors.red;
                });
              },
              child: Text(
                'AnimatedDecoratedBox',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ]
            .map(
              (e) => Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 16,
                ),
                child: e,
              ),
            )
            .toList(),
      ),
    );
  }
}
