import 'package:flutter/material.dart';
import 'drawer.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  int _selectIndex = 0;
  bool _withFile = false;

  TabController _tabController;
  List _tabs = ['新闻', '历史', '图片'];

  List _items = [
    '可滚动组件',
    '事件处理',
    '通知',
    '动画',
  ];

  void clickList(int index) {
    String item = _items[index];
    if (item == '可滚动组件') {
      Navigator.of(context).pushNamed('scroll_page');
    } else if (item == '事件处理') {
      Navigator.of(context).pushNamed('gesture_page');
    } else if (item == '通知') {
      Navigator.of(context).pushNamed('notification_page');
    } else if (item == '动画') {
      Navigator.of(context).pushNamed('animation_page');
    }
  }

  Future<void> openShare() async {
    bool result = await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('提示'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('是否确定分享'),
                Row(
                  children: [
                    Text('同时分享文件'),
                    // 只取Checkbox的上下文进行获取Element
                    Builder(builder: (BuildContext context) {
                      return Checkbox(
                          value: _withFile,
                          onChanged: (value) {
                            //markNeedsBuild 将对话框对应的Element标记为dirty,以便于state改变
                            (context as Element).markNeedsBuild();
                            _withFile = !_withFile;
                          });
                    }),
                  ],
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('取消'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Text('确定'),
              ),
            ],
          );
        });
    print('点击了$result');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    _tabController.addListener(() {
      switch (_tabController.index) {
        case 0:
          break;
        case 1:
          break;
        case 2:
          break;
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: openShare,
          ),
          Builder(builder: (context) {
            return IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            );
          }),
        ],
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(Icons.dashboard),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
        // bottom: TabBar(
        //   tabs: _tabs
        //       .map((e) => Tab(
        //             text: e,
        //           ))
        //       .toList(),
        //   controller: _tabController,
        // ),
      ),
      // body: TabBarView(
      //   children: _tabs.map((e) {
      //     return Container(
      //       alignment: Alignment.center,
      //       child: Text(
      //         e,
      //         textScaleFactor: 5,
      //       ),
      //     );
      //   }).toList(),
      // ),
      drawer: MyDrawer(),
      endDrawer: MyDrawer(),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {},
            ),
            SizedBox(),
            IconButton(
              icon: Icon(Icons.business),
              onPressed: () {},
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.home,
      //       ),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.business,
      //       ),
      //       label: 'Business',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.school,
      //       ),
      //       label: 'School',
      //     ),
      //   ],
      //   currentIndex: _selectIndex,
      //   fixedColor: Colors.yellow,
      //   onTap: (index) {
      //     setState(() {
      //       _selectIndex = index;
      //     });
      //   },
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, 'list_view_page');
        },
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return TextButton(
            onPressed: () {
              clickList(index);
            },
            child: Text(
              _items[index],
              style: TextStyle(
                color: Colors.black54,
                fontSize: 16,
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            height: 1.0,
            indent: 10,
            endIndent: 10,
            color: Colors.grey,
          );
        },
        itemCount: _items.length,
      ),
    );
  }
}
