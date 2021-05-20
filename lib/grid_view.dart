import 'package:flutter/material.dart';

class InfiniteGridView extends StatefulWidget {
  InfiniteGridView({Key key}) : super(key: key);

  @override
  _InfiniteGridViewState createState() => _InfiniteGridViewState();
}

class _InfiniteGridViewState extends State<InfiniteGridView> {
  List<IconData> _icons = [];

  void _retrieveIcons() {
    Future.delayed(Duration(milliseconds: 200)).then((value) {
      setState(() {
        _icons.addAll(
          [
            Icons.ac_unit,
            Icons.airport_shuttle,
            Icons.all_inclusive,
            Icons.beach_access,
            Icons.cake,
            Icons.free_breakfast
          ],
        );
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _retrieveIcons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView'),
      ),
      body: GridView.builder(
        itemCount: _icons.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.0,
        ),
        itemBuilder: (context, index) {
          if (index == _icons.length - 1 && _icons.length < 200) {
            _retrieveIcons();
          }
          return Icon(
            _icons[index],
          );
        },
      ),
    );
  }
}
