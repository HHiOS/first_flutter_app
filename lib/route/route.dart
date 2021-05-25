import 'package:flutter/material.dart';
import '../main.dart';

// 可滚动组件
import '../scroll/scroll_page.dart';
import '../scroll/scroll_single_child_page.dart';
import '../scroll/scroll_list_page.dart';
import '../scroll/scroll_grid_page.dart';
import '../scroll/scroll_custom_page.dart';

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

// 自定义组件
import '../custom/custom_page.dart';
import '../custom/custom_gradient_button_page.dart';
import '../custom/custom_turn_box_page.dart';
import '../custom/custom_paint_page.dart';
import '../custom/custom_indicator_page.dart';

final Map<String, WidgetBuilder> routes = {
  "new_page": (context) => NewRoute(text: '123'),
  "scroll_page": (context) => ScrollTestPage(),
  "scroll_single_child_page": (context) => ScrollSingleChildTestPage(),
  "scroll_list_page": (context) => ScrollListTestPage(),
  "scroll_grid_page": (context) => ScrollGridTestPage(),
  "scroll_custom_page": (context) => ScrollCustomTestPage(),
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
  "custom_page": (context) => CustomTestPage(),
  "custom_gradient_button_page": (context) => CustomGradientButtonPage(),
  "custom_turn_box_page": (context) => CustomTurnBoxTestPage(),
  "custom_paint_page": (context) => CustomPaintTestPage(),
  "custom_indicator_page": (context) => CustomIndicatorTestPage(),
};
