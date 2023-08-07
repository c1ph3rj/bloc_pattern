import 'dart:async';

class Validator {
  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    RegExp emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!emailRegex.hasMatch(email.trim())) {
      sink.add("");
      sink.addError("Please enter a valid Email Address!");
    } else {
      sink.add(email);
    }
  });

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
        if(password.trim().length >= 8) {
          sink.add(password);
        }else {
          sink.add("");
          sink.addError("Please enter a valid Password!");
        }
      }
  );
}
