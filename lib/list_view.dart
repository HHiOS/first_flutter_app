import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class InfiniteListView extends StatefulWidget {
  InfiniteListView({Key key}) : super(key: key);

  @override
  _InfiniteListViewState createState() => _InfiniteListViewState();
}

class _InfiniteListViewState extends State<InfiniteListView> {
  static const loadingTag = "##loading##";
  var _words = <String>[loadingTag];
  ScrollController _controller = ScrollController();
  bool _showToTopBtn = false;

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((value) {
      setState(() {
        _words.insertAll(
          _words.length - 1,
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList(),
        );
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(() {
      print(_controller.offset);
      if (_controller.offset < 1000 && _showToTopBtn) {
        setState(() {
          _showToTopBtn = false;
        });
      } else if (_controller.offset >= 1000 && !_showToTopBtn) {
        setState(() {
          _showToTopBtn = true;
        });
      }
    });
    _retrieveData();
  }

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView'),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text("下面是个列表"),
          ),
          Expanded(
            child: ListView.separated(
                controller: _controller,
                itemBuilder: (context, index) {
                  if (_words[index] == loadingTag) {
                    if (_words.length - 1 < 100) {
                      _retrieveData();
                      return Container(
                        padding: EdgeInsets.all(16.0),
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 24.0,
                          height: 24.0,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.0,
                          ),
                        ),
                      );
                    } else {
                      return Container(
                        padding: EdgeInsets.all(16.0),
                        alignment: Alignment.center,
                        child: Text(
                          "没有更多了",
                          style: TextStyle(color: Colors.grey),
                        ),
                      );
                    }
                  }
                  return ListTile(
                    title: Text(_words[index]),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 0.0,
                  );
                },
                itemCount: _words.length),
          ),
        ],
      ),
      floatingActionButton: !_showToTopBtn
          ? null
          : FloatingActionButton(
              onPressed: () {
                _controller.animateTo(
                  .0,
                  duration: Duration(milliseconds: 200),
                  curve: Curves.ease,
                );
              },
              child: Icon(Icons.arrow_upward),
            ),
    );
  }
}
