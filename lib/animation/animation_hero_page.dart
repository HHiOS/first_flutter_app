import 'package:flutter/material.dart';

class AnimationHeroTestPage extends StatefulWidget {
  AnimationHeroTestPage({Key key}) : super(key: key);

  @override
  _AnimationHeroTestPageState createState() => _AnimationHeroTestPageState();
}

class _AnimationHeroTestPageState extends State<AnimationHeroTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimationHero'),
      ),
      body: HeroAnimationRoute(),
    );
  }
}

class HeroAnimationRoute extends StatefulWidget {
  HeroAnimationRoute({Key key}) : super(key: key);

  @override
  _HeroAnimationRouteState createState() => _HeroAnimationRouteState();
}

class _HeroAnimationRouteState extends State<HeroAnimationRoute> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: InkWell(
        child: Hero(
          tag: 'avatar',
          child: ClipOval(
            child: Image.network(
              'https://avatars2.githubusercontent.com/u/20411648?s=460&v=4',
              width: 50.0,
            ),
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
              return FadeTransition(
                opacity: animation,
                child: Scaffold(
                  appBar: AppBar(
                    title: Text('HeroB'),
                  ),
                  body: AnimationHeroTestPageB(),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}

class AnimationHeroTestPageB extends StatelessWidget {
  const AnimationHeroTestPageB({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: 'avatar',
        child: Image.network(
          'https://avatars2.githubusercontent.com/u/20411648?s=460&v=4',
        ),
      ),
    );
  }
}
