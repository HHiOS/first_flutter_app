// 订阅者回调签名
typedef void EventCallBack(arg);

class EventBus {
  // 私有构造函数
  EventBus._internal();

  // 保存单例
  static EventBus _singleton = EventBus._internal();

  // 工厂构造函数
  factory EventBus() {
    return _singleton;
  }

  // 保存事件订阅者队列
  var _emap = Map<Object, List<EventCallBack>>();

  // 添加订阅者
  void on(eventName, EventCallBack b) {
    if (eventName == null || b == null) {
      return;
    }

    _emap[eventName] ??= List<EventCallBack>.empty();
    _emap[eventName].add(b);
  }

  // 移除订阅者
  void off(eventName, [EventCallBack f]) {
    var list = _emap[eventName];
    if (eventName == null || list == null) {
      return;
    }
    if (f == null) {
      _emap[eventName] = null;
    } else {
      list.remove(f);
    }
  }

  // 触发事件，事件触发后该事件所有订阅者会被调用
  void emit(eventName, [arg]) {
    var list = _emap[eventName];
    if (list == null) {
      return;
    }
    int len = list.length - 1;
    for (var i = len; i >= 0; i--) {
      list[i](arg);
    }
  }
}
