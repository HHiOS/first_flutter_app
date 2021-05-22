import 'package:flutter/material.dart';

class NotificationTestPage extends StatefulWidget {
  NotificationTestPage({Key key}) : super(key: key);

  @override
  _NotificationTestPageState createState() => _NotificationTestPageState();
}

class _NotificationTestPageState extends State<NotificationTestPage> {
  String _msg = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification'),
      ),
      body: NotificationListener<MyNotification>(
        onNotification: (n) {
          print(n.msg);
          return true;
        },
        child: NotificationListener<MyNotification>(
          onNotification: (n) {
            setState(() {
              _msg += n.msg + " ";
            });
            // 返回true会阻止父NotificationListener收到通知
            return false;
          },
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Builder(builder: (context) {
                  return TextButton(
                    onPressed: () {
                      MyNotification("Hi Flutter").dispatch(context);
                    },
                    child: Text('Send'),
                  );
                }),
                Text(_msg),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyNotification extends Notification {
  MyNotification(this.msg);
  final String msg;
}
