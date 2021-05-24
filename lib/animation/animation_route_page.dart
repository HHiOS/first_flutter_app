import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class AnimationRouteTestPage extends StatefulWidget {
  AnimationRouteTestPage({Key key}) : super(key: key);

  @override
  _AnimationRouteTestPageState createState() => _AnimationRouteTestPageState();
}

class _AnimationRouteTestPageState extends State<AnimationRouteTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimationRoute'),
      ),
      body: RouteAnimationRoute(),
    );
  }
}

class RouteAnimationRoute extends StatefulWidget {
  RouteAnimationRoute({Key key}) : super(key: key);

  @override
  _RouteAnimationRouteState createState() => _RouteAnimationRouteState();
}

class _RouteAnimationRouteState extends State<RouteAnimationRoute> {
  @override
  Widget build(BuildContext context) {
    final word = WordPair.random();
    return Center(
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            // PageRouteBuilder(
            //   pageBuilder: (context, animation, secondaryAnimation) {
            //     return FadeTransition(
            //       opacity: animation,
            //       child: AnimationRouteTestPage(),
            //     );
            //   },
            //   transitionDuration: Duration(
            //     milliseconds: 500,
            //   ),
            // ),
            FadeRoute(
              builder: (context) {
                return AnimationRouteTestPage();
              },
            ),
          );
        },
        child: Text(
          'Click' + ' ' + '$word',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}

class FadeRoute extends PageRoute {
  FadeRoute({
    @required this.builder,
    this.transitionDuration = const Duration(milliseconds: 300),
    this.opaque = true,
    this.barrierDismissible = false,
    this.barrierColor,
    this.barrierLabel,
    this.maintainState = true,
  });

  final WidgetBuilder builder;

  @override
  final Duration transitionDuration;

  @override
  final bool opaque;

  @override
  final bool barrierDismissible;

  @override
  final Color barrierColor;

  @override
  final String barrierLabel;

  @override
  final bool maintainState;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    // TODO: implement buildPage
    return builder(context);
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // TODO: implement buildTransitions
    if (isActive) {
      // 打开新路由
      return FadeTransition(
        opacity: animation,
        child: builder(context),
      );
    } else {
      // 是返回，则不使用过渡动画
      return Padding(
        padding: EdgeInsets.zero,
      );
    }
  }
}
