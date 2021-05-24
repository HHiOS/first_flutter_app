import 'package:flutter/material.dart';

class AnimationStaggerTestPage extends StatefulWidget {
  AnimationStaggerTestPage({Key key}) : super(key: key);

  @override
  _AnimationStaggerTestPageState createState() =>
      _AnimationStaggerTestPageState();
}

class _AnimationStaggerTestPageState extends State<AnimationStaggerTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimationStagger'),
      ),
      body: StaggerAnimationRoute(),
    );
  }
}

class StaggerAnimationRoute extends StatefulWidget {
  StaggerAnimationRoute({Key key}) : super(key: key);

  @override
  _StaggerAnimationRouteState createState() => _StaggerAnimationRouteState();
}

class _StaggerAnimationRouteState extends State<StaggerAnimationRoute>
    with TickerProviderStateMixin {
  AnimationController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  Future<Null> _playAnimation() async {
    try {
      await _controller.forward().orCancel;
      await _controller.reverse().orCancel;
    } on TickerCanceled {}
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        _playAnimation();
      },
      child: Center(
        child: Container(
          width: 300.0,
          height: 300.0,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.1),
            border: Border.all(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          child: StaggerAnimation(
            controller: _controller,
          ),
        ),
      ),
    );
  }
}

class StaggerAnimation extends StatelessWidget {
  StaggerAnimation({Key key, this.controller}) : super(key: key) {
    height = Tween<double>(begin: 0, end: 300.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.0,
          0.6,
          curve: Curves.ease,
        ),
      ),
    );

    color = ColorTween(
      begin: Colors.green,
      end: Colors.red,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.0,
          0.6,
          curve: Curves.ease,
        ),
      ),
    );

    padding = Tween<EdgeInsets>(
      begin: EdgeInsets.only(
        left: 0,
      ),
      end: EdgeInsets.only(
        left: 100.0,
      ),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.6,
          1.0,
          curve: Curves.ease,
        ),
      ),
    );
  }

  final Animation<double> controller;
  Animation<double> height;
  Animation<EdgeInsets> padding;
  Animation<Color> color;

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: padding.value,
      child: Container(
        color: color.value,
        width: 50.0,
        height: height.value,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }
}
