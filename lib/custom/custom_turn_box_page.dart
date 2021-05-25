import 'package:flutter/material.dart';

class CustomTurnBoxTestPage extends StatefulWidget {
  CustomTurnBoxTestPage({Key key}) : super(key: key);

  @override
  _CustomTurnBoxTestPageState createState() => _CustomTurnBoxTestPageState();
}

class _CustomTurnBoxTestPageState extends State<CustomTurnBoxTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TurnBox'),
      ),
      body: Column(
        children: [
          TurnBoxRoute(),
          // SizedBox(
          //   height: 100,
          //   child: MyRichText(
          //     text: '富文本',
          //   ),
          // ),
        ],
      ),
    );
  }
}

class TurnBoxRoute extends StatefulWidget {
  TurnBoxRoute({Key key}) : super(key: key);

  @override
  _TurnBoxRouteState createState() => _TurnBoxRouteState();
}

class _TurnBoxRouteState extends State<TurnBoxRoute> {
  double _turns = .0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          TurnBox(
            turns: _turns,
            speed: 1000,
            child: Icon(
              Icons.refresh,
              size: 50,
            ),
          ),
          TurnBox(
            turns: _turns,
            speed: 1000,
            child: Icon(
              Icons.refresh,
              size: 150,
            ),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _turns += .2;
              });
            },
            child: Text(
              '顺时针旋转1/5圈',
            ),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _turns -= .2;
              });
            },
            child: Text(
              '逆时针旋转1/5圈',
            ),
          ),
        ],
      ),
    );
  }
}

class TurnBox extends StatefulWidget {
  TurnBox({
    Key key,
    this.turns = .0,
    this.speed = 200,
    this.child,
  }) : super(key: key);

  final double turns;
  final int speed;
  final Widget child;

  @override
  _TurnBoxState createState() => _TurnBoxState();
}

class _TurnBoxState extends State<TurnBox> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      lowerBound: -double.infinity,
      upperBound: double.infinity,
    );
    _controller.value = widget.turns;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      child: widget.child,
      turns: _controller,
    );
  }

  @override
  void didUpdateWidget(covariant TurnBox oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (oldWidget.turns != widget.turns) {
      _controller.animateTo(
        widget.turns,
        duration: Duration(milliseconds: widget.speed ?? 200),
        curve: Curves.easeOut,
      );
    }
  }
}

class MyRichText extends StatefulWidget {
  MyRichText({
    Key key,
    this.text,
    this.linkStyle,
  }) : super(key: key);

  final String text;
  final TextStyle linkStyle;

  @override
  _MyRichTextState createState() => _MyRichTextState();
}

class _MyRichTextState extends State<MyRichText> {
  TextSpan _textSpan;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: _textSpan,
    );
  }

  TextSpan parseText(String text) {
    return TextSpan(
      text: text,
      style: TextStyle(
        backgroundColor: Colors.black,
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    _textSpan = parseText(widget.text);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant MyRichText oldWidget) {
    if (widget.text != oldWidget.text) {
      _textSpan = parseText(widget.text);
    }
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }
}
