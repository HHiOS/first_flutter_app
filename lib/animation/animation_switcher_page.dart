import 'package:flutter/material.dart';

class AnimationSwitcherTestPage extends StatefulWidget {
  AnimationSwitcherTestPage({Key key}) : super(key: key);

  @override
  _AnimationSwitcherTestPageState createState() =>
      _AnimationSwitcherTestPageState();
}

class _AnimationSwitcherTestPageState extends State<AnimationSwitcherTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimationSwitcher'),
      ),
      body: Center(
        child: Column(
          children: [
            AnimationSwitcherCounterRoute(),
            SizedBox(
              height: 100,
            ),
            AnimationSwitcherSlideRoute(),
          ],
        ),
      ),
    );
  }
}

class AnimationSwitcherCounterRoute extends StatefulWidget {
  AnimationSwitcherCounterRoute({Key key}) : super(key: key);

  @override
  _AnimationSwitcherCounterRouteState createState() =>
      _AnimationSwitcherCounterRouteState();
}

class _AnimationSwitcherCounterRouteState
    extends State<AnimationSwitcherCounterRoute> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedSwitcher(
            duration: Duration(
              milliseconds: 500,
            ),
            transitionBuilder: (child, animation) {
              return ScaleTransition(
                scale: animation,
                child: child,
              );
            },
            child: Text(
              '$_count',
              style: Theme.of(context).textTheme.headline4,
              key: ValueKey<int>(_count),
            ),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _count += 1;
              });
            },
            child: Text(
              '+1',
            ),
          ),
        ],
      ),
    );
  }
}

class AnimationSwitcherSlideRoute extends StatefulWidget {
  AnimationSwitcherSlideRoute({Key key}) : super(key: key);

  @override
  _AnimationSwitcherSlideRouteState createState() =>
      _AnimationSwitcherSlideRouteState();
}

class _AnimationSwitcherSlideRouteState
    extends State<AnimationSwitcherSlideRoute> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedSwitcher(
            duration: Duration(
              milliseconds: 200,
            ),
            transitionBuilder: (child, animation) {
              var tween = Tween<Offset>(
                begin: Offset(1, 0),
                end: Offset(0, 1),
              );
              // return MySlideTransition(
              //   position: tween.animate(animation),
              //   child: child,
              // );
              return SlideTransitionX(
                position: animation,
                child: child,
                direction: AxisDirection.left,
              );
            },
            child: Text(
              '$_count',
              style: Theme.of(context).textTheme.headline4,
              key: ValueKey<int>(_count),
            ),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _count += 1;
              });
            },
            child: Text(
              'Increment',
            ),
          ),
        ],
      ),
    );
  }
}

class MySlideTransition extends AnimatedWidget {
  MySlideTransition({
    Key key,
    @required Animation<Offset> position,
    this.transformHitTests = true,
    this.child,
  })  : assert(position != null),
        super(key: key, listenable: position);

  Animation<Offset> get position => listenable;
  final bool transformHitTests;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Offset offset = position.value;
    if (position.status == AnimationStatus.reverse) {
      offset = Offset(-offset.dx, offset.dy);
    }
    return FractionalTranslation(
      translation: offset,
      transformHitTests: transformHitTests,
      child: child,
    );
  }
}

class SlideTransitionX extends AnimatedWidget {
  SlideTransitionX({
    Key key,
    @required Animation<double> position,
    this.transformHitTests = true,
    this.child,
    this.direction = AxisDirection.down,
  })  : assert(position != null),
        super(key: key, listenable: position) {
    switch (direction) {
      case AxisDirection.up:
        _tween = Tween(begin: Offset(0, 1), end: Offset(0, 0));
        break;
      case AxisDirection.left:
        _tween = Tween(begin: Offset(1, 0), end: Offset(0, 0));
        break;
      case AxisDirection.down:
        _tween = Tween(begin: Offset(0, -1), end: Offset(0, 0));
        break;
      case AxisDirection.right:
        _tween = Tween(begin: Offset(-1, 0), end: Offset(0, 0));
        break;
      default:
    }
  }

  Animation<double> get position => listenable;
  final bool transformHitTests;
  final Widget child;
  final AxisDirection direction;
  Tween<Offset> _tween;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Offset offset = _tween.evaluate(position);
    if (position.status == AnimationStatus.reverse) {
      switch (direction) {
        case AxisDirection.up:
          offset = Offset(offset.dx, -offset.dy);
          break;
        case AxisDirection.left:
          offset = Offset(-offset.dx, offset.dy);
          break;
        case AxisDirection.down:
          offset = Offset(offset.dx, -offset.dy);
          break;
        case AxisDirection.right:
          offset = Offset(-offset.dx, offset.dy);
          break;
        default:
      }
    }
    return FractionalTranslation(
      translation: offset,
      transformHitTests: transformHitTests,
      child: child,
    );
  }
}
