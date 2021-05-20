import 'package:flutter/material.dart';

class CustomScrollViewTestRoute extends StatefulWidget {
  CustomScrollViewTestRoute({Key key}) : super(key: key);

  @override
  _CustomScrollViewTestRouteState createState() =>
      _CustomScrollViewTestRouteState();
}

class _CustomScrollViewTestRouteState extends State<CustomScrollViewTestRoute> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('CustomScrollView'),
              background: Image.network(
                "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(8.0),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.cyan[100 * (index % 9)],
                    child: Text('grid item $index'),
                  );
                },
                childCount: 20,
              ),
            ),
          ),
          SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100 * (index % 9)],
                  child: Text('grid item $index'),
                );
              },
              childCount: 50,
            ),
            itemExtent: 50.0,
          ),
        ],
      ),
    );
  }
}
