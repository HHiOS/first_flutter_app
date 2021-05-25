import 'package:flutter/material.dart';

class CustomGradientButtonPage extends StatefulWidget {
  CustomGradientButtonPage({Key key}) : super(key: key);

  @override
  _CustomGradientButtonPageState createState() =>
      _CustomGradientButtonPageState();
}

class _CustomGradientButtonPageState extends State<CustomGradientButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GradientButton'),
      ),
      body: GradientButtonRoute(),
    );
  }
}

class GradientButtonRoute extends StatefulWidget {
  GradientButtonRoute({Key key}) : super(key: key);

  @override
  _GradientButtonRouteState createState() => _GradientButtonRouteState();
}

class _GradientButtonRouteState extends State<GradientButtonRoute> {
  onTap() {
    print('button click');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          GradientButton(
            child: Text('Submit'),
            onPressed: onTap,
            height: 50.0,
            colors: [
              Colors.orange,
              Colors.red,
            ],
          ),
          GradientButton(
            child: Text('Submit'),
            onPressed: onTap,
            height: 50.0,
            colors: [
              Colors.lightGreen,
              Colors.green[700],
            ],
          ),
          GradientButton(
            child: Text('Submit'),
            onPressed: onTap,
            height: 50.0,
            colors: [
              Colors.lightBlue[300],
              Colors.blueAccent,
            ],
          ),
        ],
      ),
    );
  }
}

class GradientButton extends StatelessWidget {
  const GradientButton({
    Key key,
    this.colors,
    this.width,
    this.height,
    this.onPressed,
    this.borderRadius,
    @required this.child,
  }) : super(key: key);

  final List<Color> colors;

  final double width;
  final double height;

  final Widget child;
  final BorderRadius borderRadius;

  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    List<Color> _colors = colors ??
        [theme.primaryColor, theme.primaryColorDark ?? theme.primaryColor];
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: _colors),
        borderRadius: borderRadius,
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          splashColor: _colors.last,
          highlightColor: Colors.transparent,
          borderRadius: borderRadius,
          onTap: onPressed,
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(
              height: height,
              width: width,
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: DefaultTextStyle(
                  style: TextStyle(fontWeight: FontWeight.bold),
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
