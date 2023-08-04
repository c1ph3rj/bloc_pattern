import 'package:flutter/material.dart';
import 'bloc.dart';

class Provider extends InheritedWidget {
  Provider({super.key, required super.child});
  final bloc = Bloc();

  @override
  bool updateShouldNotify(oldWidget) => true;

  static Bloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>()!.bloc;
  }

  void dispose() {
    bloc.dispose();
  }
}