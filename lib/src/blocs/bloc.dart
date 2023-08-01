import 'dart:async';

class Bloc {
  final emailFieldController = StreamController<String>();
  final passwordFieldController = StreamController<String>();
}