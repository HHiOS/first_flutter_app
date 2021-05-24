import 'package:flutter/material.dart';

class AnimationBasicTestPage extends StatefulWidget {
  AnimationBasicTestPage({Key key}) : super(key: key);

  @override
  _AnimationBasicTestPageState createState() => _AnimationBasicTestPageState();
}

class _AnimationBasicTestPageState extends State<AnimationBasicTestPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimationBasic'),
      ),
      body: BasicAnimationRoute(),
    );
  }
}

class BasicAnimationRoute extends StatefulWidget {
  BasicAnimationRoute({Key key}) : super(key: key);

  @override
  _BasicAnimationRouteState createState() => _BasicAnimationRouteState();
}

class _BasicAnimationRouteState extends State<BasicAnimationRoute>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 3,
      ),
    );
    // 使用弹性曲线
    _animation = CurvedAnimation(parent: _controller, curve: Curves.bounceIn);
    // 图片宽高从0变到300
    _animation = Tween(begin: 0.0, end: 300.0).animate(_animation)
      ..addListener(() {
        setState(() {});
      });

    _animation.addStatusListener((status) {
      print(status);
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });

    // 启动动画
    _controller.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedImage(
      animation: _animation,
    );
  }
}

class AnimatedImage extends AnimatedWidget {
  AnimatedImage({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return GrowTransition(
      child: Image.network(
        'https://avatars2.githubusercontent.com/u/20411648?s=460&v=4',
      ),
      animation: animation,
    );
    // return AnimatedBuilder(
    //   animation: animation,
    //   child: Image.network(
    //     'https://avatars2.githubusercontent.com/u/20411648?s=460&v=4',
    //   ),
    //   builder: (context, child) {
    //     return Center(
    //       child: Container(
    //         width: animation.value,
    //         height: animation.value,
    //         child: child,
    //       ),
    //     );
    //   },
    // );
    // return Center(
    //   child: Image.network(
    //     'https://avatars2.githubusercontent.com/u/20411648?s=460&v=4',
    //     width: animation.value,
    //     height: animation.value,
    //   ),
    // );
  }
}

class GrowTransition extends StatelessWidget {
  const GrowTransition({Key key, this.child, this.animation}) : super(key: key);

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        child: child,
        builder: (context, child) {
          return Container(
            width: animation.value,
            height: animation.value,
            child: child,
          );
        },
      ),
    );
  }
}
