import 'package:flutter/material.dart';

class GestureListenerTestPage extends StatefulWidget {
  GestureListenerTestPage({Key key}) : super(key: key);

  @override
  _GestureListenerTestPageState createState() =>
      _GestureListenerTestPageState();
}

class _GestureListenerTestPageState extends State<GestureListenerTestPage> {
  PointerEvent _event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GestureListener'),
      ),
      body: Column(
        children: [
          Listener(
            child: Container(
              alignment: Alignment.center,
              color: Colors.blue,
              width: 300,
              height: 150,
              child: Text(
                _event?.toString() ?? "",
                style: TextStyle(color: Colors.white),
              ),
            ),
            onPointerDown: (event) {
              setState(() {
                _event = event;
              });
            },
            onPointerMove: (event) {
              setState(() {
                _event = event;
              });
            },
            onPointerUp: (event) {
              setState(() {
                _event = event;
              });
            },
          ),
          SizedBox(
            height: 10,
          ),
          Stack(
            children: [
              Listener(
                child: ConstrainedBox(
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.blue),
                  ),
                  constraints: BoxConstraints.tight(
                    Size(300, 200),
                  ),
                ),
                onPointerDown: (event) {
                  print('Down0');
                },
              ),
              Listener(
                child: ConstrainedBox(
                  child: Center(
                    child: Text('左上角200*100范围内非文本区域点击'),
                  ),
                  constraints: BoxConstraints.tight(
                    Size(200, 100),
                  ),
                ),
                onPointerDown: (event) {
                  print('Down1');
                },
                behavior: HitTestBehavior.translucent,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
