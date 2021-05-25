import 'package:first_flutter_app/custom/custom_turn_box_page.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class CustomIndicatorTestPage extends StatefulWidget {
  CustomIndicatorTestPage({Key key}) : super(key: key);

  @override
  _CustomIndicatorTestPageState createState() =>
      _CustomIndicatorTestPageState();
}

class _CustomIndicatorTestPageState extends State<CustomIndicatorTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GradientCircularProgressIndicator'),
      ),
      body: GradientCircularProgressRoute(),
    );
  }
}

class GradientCircularProgressRoute extends StatefulWidget {
  GradientCircularProgressRoute({Key key}) : super(key: key);

  @override
  _GradientCircularProgressRouteState createState() =>
      _GradientCircularProgressRouteState();
}

class _GradientCircularProgressRouteState
    extends State<GradientCircularProgressRoute> with TickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 3,
      ),
    );
    bool isForward = true;
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.forward) {
        isForward = true;
      } else if (status == AnimationStatus.completed ||
          status == AnimationStatus.dismissed) {
        if (isForward) {
          _animationController.reverse();
        } else {
          _animationController.forward();
        }
      } else if (status == AnimationStatus.reverse) {
        isForward = false;
      }
    });
    _animationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    children: [
                      Wrap(
                        spacing: 10.0,
                        runSpacing: 16.0,
                        children: [
                          GradientCircularProgressIndicator(
                            radius: 50.0,
                            colors: [
                              Colors.blue,
                              Colors.blue,
                            ],
                            strokeWidth: 3.0,
                            value: _animationController.value,
                          ),
                          GradientCircularProgressIndicator(
                            radius: 50.0,
                            colors: [
                              Colors.red,
                              Colors.orange,
                            ],
                            strokeWidth: 3.0,
                            value: _animationController.value,
                          ),
                          GradientCircularProgressIndicator(
                            radius: 50.0,
                            colors: [
                              Colors.red,
                              Colors.orange,
                            ],
                            strokeWidth: 5.0,
                            value: _animationController.value,
                          ),
                          GradientCircularProgressIndicator(
                            radius: 50.0,
                            colors: [
                              Colors.teal,
                              Colors.cyan,
                            ],
                            strokeWidth: 5.0,
                            value: CurvedAnimation(
                              parent: _animationController,
                              curve: Curves.decelerate,
                            ).value,
                          ),
                          TurnBox(
                            turns: 1 / 8,
                            child: GradientCircularProgressIndicator(
                              radius: 50.0,
                              colors: [
                                Colors.red,
                                Colors.orange,
                                Colors.red,
                              ],
                              strokeWidth: 5.0,
                              strokeCapRound: true,
                              backgroundColor: Colors.red[50],
                              totalAngle: 1.5 * pi,
                              value: CurvedAnimation(
                                parent: _animationController,
                                curve: Curves.ease,
                              ).value,
                            ),
                          ),
                          RotatedBox(
                            quarterTurns: 1,
                            child: GradientCircularProgressIndicator(
                              radius: 50.0,
                              colors: [
                                Colors.blue[700],
                                Colors.blue[200],
                              ],
                              strokeWidth: 3.0,
                              strokeCapRound: true,
                              backgroundColor: Colors.transparent,
                              value: _animationController.value,
                            ),
                          ),
                          GradientCircularProgressIndicator(
                            radius: 50.0,
                            colors: [
                              Colors.red,
                              Colors.amber,
                              Colors.cyan,
                              Colors.green[200],
                              Colors.blue,
                              Colors.red,
                            ],
                            strokeWidth: 5.0,
                            strokeCapRound: true,
                            value: _animationController.value,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      GradientCircularProgressIndicator(
                        radius: 100.0,
                        colors: [
                          Colors.blue[700],
                          Colors.blue[200],
                        ],
                        strokeWidth: 20.0,
                        value: _animationController.value,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: GradientCircularProgressIndicator(
                          radius: 100.0,
                          colors: [
                            Colors.blue[700],
                            Colors.blue[300],
                          ],
                          strokeWidth: 20.0,
                          strokeCapRound: true,
                          value: _animationController.value,
                        ),
                      ),
                      ClipRect(
                        child: Align(
                          alignment: Alignment.topCenter,
                          heightFactor: .5,
                          child: Padding(
                            padding: EdgeInsets.only(
                              bottom: 8.0,
                            ),
                            child: SizedBox(
                              child: GradientCircularProgressIndicator(
                                radius: 100.0,
                                colors: [
                                  Colors.teal,
                                  Colors.cyan[500],
                                ],
                                strokeWidth: 8.0,
                                totalAngle: pi,
                                strokeCapRound: true,
                                value: _animationController.value,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 104.0,
                        width: 200.0,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              height: 200.0,
                              top: .0,
                              child: TurnBox(
                                turns: .75,
                                child: GradientCircularProgressIndicator(
                                  radius: 100.0,
                                  colors: [
                                    Colors.teal,
                                    Colors.cyan[500],
                                  ],
                                  strokeWidth: 8.0,
                                  strokeCapRound: true,
                                  totalAngle: pi,
                                  value: _animationController.value,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              child: Text(
                                '${(_animationController.value * 100).toInt()}%',
                                style: TextStyle(
                                  fontSize: 25.0,
                                  color: Colors.blueGrey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class GradientCircularProgressIndicator extends StatelessWidget {
  const GradientCircularProgressIndicator({
    Key key,
    this.strokeWidth = 2.0,
    @required this.radius,
    @required this.colors,
    this.stops,
    this.strokeCapRound = false,
    this.backgroundColor = const Color(0xFFEEEEEE),
    this.totalAngle = 2 * pi,
    this.value,
  }) : super(key: key);

  // 粗细
  final double strokeWidth;

  // 半径
  final double radius;

  // 两端是否为圆角
  final bool strokeCapRound;

  // 当前进度【0.0-1.0】
  final double value;

  // 背景色
  final Color backgroundColor;

  // 进度条总弧度
  final double totalAngle;

  // 渐变色数组
  final List<Color> colors;

  // 渐变色的终止点，对应colors属性
  final List<double> stops;

  @override
  Widget build(BuildContext context) {
    double _offset = .0;
    // 如果两端为圆角，则需要对起始位置进行调整，否则圆角部分会偏离起始位置
    // 下面调整的角度的计算公式是通过数学几何知识得出，读者有兴趣可以研究一下为什么是这样
    if (strokeCapRound) {
      _offset = asin(strokeWidth / (radius * 2 - strokeWidth));
    }
    var _colors = colors;
    if (_colors == null) {
      Color color = Theme.of(context).accentColor;
      _colors = [color, color];
    }
    return Transform.rotate(
      angle: -pi / 2.0 - _offset,
      child: CustomPaint(
        size: Size.fromRadius(radius),
        painter: _GradientCircularProgressPainter(
          colors: _colors,
          strokeWidth: strokeWidth,
          strokeCapRound: strokeCapRound,
          backgroundColor: backgroundColor,
          value: value,
          total: totalAngle,
          radius: radius,
        ),
      ),
    );
  }
}

class _GradientCircularProgressPainter extends CustomPainter {
  _GradientCircularProgressPainter({
    this.strokeWidth: 10.0,
    this.strokeCapRound: false,
    this.backgroundColor = const Color(0xFFEEEEEE),
    this.radius,
    this.total = 2 * pi,
    @required this.colors,
    this.stops,
    this.value,
  });

  final double strokeWidth;
  final bool strokeCapRound;
  final double value;
  final Color backgroundColor;
  final List<Color> colors;
  final double total;
  final double radius;
  final List<double> stops;

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    if (radius != null) {
      size = Size.fromRadius(radius);
    }
    double _offset = strokeWidth / 2.0;
    double _value = value ?? .0;
    _value = _value.clamp(.0, 1.0) * total;
    double _start = .0;

    if (strokeCapRound) {
      _start = asin(strokeWidth / (size.width - strokeWidth));
    }

    Rect rect = Offset(_offset, _offset) &
        Size(
          size.width - strokeWidth,
          size.height - strokeWidth,
        );

    var paint = Paint()
      ..strokeCap = strokeCapRound ? StrokeCap.round : StrokeCap.butt
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true
      ..strokeWidth = strokeWidth;

    // 画背景
    if (backgroundColor != Colors.transparent) {
      paint.color = backgroundColor;
      canvas.drawArc(
        rect,
        _start,
        total,
        false,
        paint,
      );
    }

    // 画前景，应用渐变
    if (_value > 0) {
      paint.shader = SweepGradient(
        colors: colors,
        startAngle: 0.0,
        endAngle: _value,
        stops: stops,
      ).createShader(rect);

      canvas.drawArc(
        rect,
        _start,
        _value,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
