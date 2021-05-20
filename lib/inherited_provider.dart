import 'package:flutter/material.dart';

class InheritedProvider<T> extends InheritedWidget {
  InheritedProvider({Key key, this.child, this.data})
      : super(key: key, child: child);

  final Widget child;

  final T data;

  static InheritedProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedProvider>();
  }

  @override
  bool updateShouldNotify(InheritedProvider oldWidget) {
    return true;
  }
}

class ChangeNotifier implements Listenable {
  List listeners = [];

  @override
  void addListener(listener) {
    // TODO: implement addListener
    listeners.add(listener);
  }

  @override
  void removeListener(listener) {
    // TODO: implement removeListener
    listeners.remove(listener);
  }

  void notifyListeners() {
    listeners.forEach((element) {
      return element();
    });
  }
}

class ChangeNotifierProvider<T extends ChangeNotifier> extends StatefulWidget {
  ChangeNotifierProvider({Key key, this.data, this.child}) : super(key: key);

  final Widget child;
  final T data;

  static T of<T>(BuildContext context, {bool listen = true}) {
    final provider = listen
        ? context.dependOnInheritedWidgetOfExactType<InheritedProvider<T>>()
        : context
            .getElementForInheritedWidgetOfExactType<InheritedProvider<T>>()
            ?.widget as InheritedProvider<T>;
    return provider.data;
  }

  @override
  _ChangeNotifierProviderState<T> createState() =>
      _ChangeNotifierProviderState<T>();
}

class _ChangeNotifierProviderState<T extends ChangeNotifier>
    extends State<ChangeNotifierProvider<T>> {
  void update() {
    setState(() {});
  }

  @override
  void didUpdateWidget(ChangeNotifierProvider<T> oldWidget) {
    if (widget.data != oldWidget.data) {
      oldWidget.data.removeListener(update);
      widget.data.addListener(update);
    }
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    widget.data.addListener(update);
    super.initState();
  }

  @override
  void dispose() {
    widget.data.removeListener(update);
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InheritedProvider<T>(
      data: widget.data,
      child: widget.child,
    );
  }
}
