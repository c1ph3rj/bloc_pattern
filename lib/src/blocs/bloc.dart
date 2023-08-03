import 'dart:async';

import 'package:bloc_pattern/src/blocs/validator.dart';

class Bloc extends Validator {
  final _emailFieldController = StreamController<String>();
  final _passwordFieldController = StreamController<String>();

  Function(String) get addEmail => _emailFieldController.sink.add;

  Function(String) get addPassword => _passwordFieldController.sink.add;

  Stream<String> get email =>
      _emailFieldController.stream.transform(validateEmail);

  Stream<String> get password =>
      _passwordFieldController.stream.transform(validatePassword);

  dispose() {
    _emailFieldController.close();
    _passwordFieldController.close();
  }
}

final bloc = Bloc();
