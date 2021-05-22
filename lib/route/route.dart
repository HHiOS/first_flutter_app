import 'package:first_flutter_app/gesture/gesture_conflict_page.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import '../single_child_scroll_view_route.dart';
import '../list_view.dart';
import '../grid_view.dart';
import '../custom_scroll_view_page.dart';

// 事件
import '../gesture/gesture_page.dart';
import '../gesture/gesture_listener_page.dart';
import '../gesture/gesture_detector_page.dart';
import '../gesture/gesture_recognizer_page.dart';
import '../gesture/gesture_conflict_page.dart';

// 通知
import '../notification/notification_page.dart';

final Map<String, WidgetBuilder> routes = {
  "new_page": (context) => NewRoute(text: '123'),
  "single_scroll_page": (context) => SingleChildScrollViewRoute(),
  "list_view_page": (context) => InfiniteListView(),
  "grid_view_page": (context) => InfiniteGridView(),
  "custom_view_page": (context) => CustomScrollViewTestRoute(),
  "gesture_page": (context) => GestureTestPageRoute(),
  "gesture_listener_page": (context) => GestureListenerTestPage(),
  "gesture_detector_page": (context) => GestureDetectorTestPage(),
  "gesture_recognizer_page": (context) => GestureRecognizerTestRoute(),
  "gesture_conflict_page": (context) => GestureConflictTestPage(),
  "notification_page": (context) => NotificationTestPage(),
};
