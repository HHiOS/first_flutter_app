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

// 动画
import '../animation/animation_page.dart';
import '../animation/animation_basic_page.dart';
import '../animation/animation_route_page.dart';
import '../animation/animation_hero_page.dart';
import '../animation/animation_stagger_page.dart';
import '../animation/animation_switcher_page.dart';
import '../animation/animation_custom_page.dart';

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
  "animation_page": (context) => AnimationTestPage(),
  "animation_basic_page": (context) => AnimationBasicTestPage(),
  "animation_route_page": (context) => AnimationRouteTestPage(),
  "animation_hero_page": (context) => AnimationHeroTestPage(),
  "animation_stagger_page": (context) => AnimationStaggerTestPage(),
  "animation_switcher_page": (context) => AnimationSwitcherTestPage(),
  "animation_custom_page": (context) => AnimationCustomTestPage(),
};
