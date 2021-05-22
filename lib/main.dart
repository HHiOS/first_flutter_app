import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:english_words/english_words.dart';
import 'route/route.dart';
import 'home/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.yellow,
        ),
        home: Home(), // MyHomePage(title: 'Flutter Demo Home Page'),
        routes: routes,
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(builder: (_context) {
            String routeName = settings.name;
            if (routeName == 'new_page1') {
              print('====================');
              return NewRoute(text: settings.arguments);
            }
          });
        });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CounterWidget _widget;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text.rich(TextSpan(
              children: [
                TextSpan(
                    text: '这是一个按钮', style: TextStyle(color: Color(0xffdddddd))),
                TextSpan(text: '开始跳转', style: TextStyle(color: Colors.red)),
              ],
            )),
            TextButton(
              onPressed: () {
                _CounterWidgetState _state = _widget.createState();
                final _arguments = _state._counter.toString();
                Navigator.pushNamed(context, 'new_page1',
                    arguments: _arguments);
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) {
                //           return NewRoute(
                //             text: "123",
                //           );
                //         },
                //         fullscreenDialog: true));
              },
              child: Text("open new route"),
            ),
            RandomWordsWidget(),
            _widget = CounterWidget(
              initValue: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class NewRoute extends StatelessWidget {
  const NewRoute({Key key, this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(text),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "This is new route",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            Image.network(
              "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
              width: 100,
            ),
            Icon(
              Icons.accessibility,
              color: Colors.yellow,
              size: 100,
            ),
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                labelText: '请填写',
                hintText: '用户名',
                prefixIcon: Icon(Icons.person),
                border: InputBorder.none,
              ),
              obscureText: true,
              onChanged: (v) {
                print(v);
              },
            ),
            Form(
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                children: [
                  TextFormField(
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: '密码',
                      hintText: '请输入密码',
                      icon: Icon(Icons.lock),
                    ),
                    validator: (v) {
                      return v.trim().length > 5 ? null : '密码长度不能少于6位';
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
              child: Container(
                color: Colors.green,
                margin: EdgeInsets.all(6.0),
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.red,
                    Colors.yellow,
                  ],
                ),
                borderRadius: BorderRadius.circular(3.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    offset: Offset(2.0, 2.0),
                    blurRadius: 4.0,
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 100.0,
                  vertical: 20.0,
                ),
                child: Text(
                  '我是一个DecoratedBox',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              color: Colors.black,
              child: Transform(
                alignment: Alignment.topRight,
                transform: Matrix4.skewY(0.3),
                child: Container(
                  padding: EdgeInsets.all(5.0),
                  color: Colors.blueAccent,
                  child: Text('这是一个Transform'),
                  constraints: BoxConstraints(
                    minHeight: 4,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RandomWordsWidget extends StatelessWidget {
  const RandomWordsWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(wordPair.toString()),
    );
  }
}

class CounterWidget extends StatefulWidget {
  CounterWidget({Key key, this.initValue: 0}) : super(key: key);

  final int initValue;

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _counter = widget.initValue;
    print('\n---------initState---------');
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('\n---------build---------');
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
        child: Column(
          children: [
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
          ],
        ));
  }

  @override
  void didUpdateWidget(covariant CounterWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print('\n---------didUpdateWidget---------');
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print('\n---------deactivate---------');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('\n---------dispose---------');
  }

  @override
  void reassemble() {
    super.reassemble();
    print('\n---------reassemble---------');
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('\n---------didChangeDependencies---------');
  }
}
