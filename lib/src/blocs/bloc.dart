import 'dart:async';

import 'package:bloc_pattern/src/blocs/validator.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Validator {
  final _emailFieldController = BehaviorSubject<String>();
  final _passwordFieldController = BehaviorSubject<String>();

  Function(String) get addEmail => _emailFieldController.sink.add;

  Function(String) get addPassword => _passwordFieldController.sink.add;

  Stream<String> get email =>
      _emailFieldController.stream.transform(validateEmail);

  Stream<String> get password =>
      _passwordFieldController.stream.transform(validatePassword);

  Stream<bool> get submitValid => Rx.combineLatest2(email, password, (a, b) {
    return true;
  });

  submit() {
    final String emailValue = _emailFieldController.value;
    final String passwordValue = _passwordFieldController.value;

    print("email : $emailValue\npassword : $passwordValue");
  }

  dispose() {
    _emailFieldController.close();
    _passwordFieldController.close();
  }
}
