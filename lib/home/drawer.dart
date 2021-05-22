import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  MyDrawer({Key key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 38.0),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    // child: ClipRect(
                    //   clipper: MyClipper(),
                    child: ClipOval(
                      child: Image.network(
                        "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                        width: 80,
                      ),
                    ),
                  ),
                  // ),
                  Text(
                    '头像名字',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return ListTile(
                      leading: Icon(Icons.add),
                      title: Text('Add account'),
                    );
                  } else {
                    return ListTile(
                      leading: Icon(Icons.settings),
                      title: Text('Manage account'),
                    );
                  }
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    color: Colors.black,
                    indent: 10.0,
                    endIndent: 10.0,
                  );
                },
                itemCount: 2,
                // itemExtent: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
