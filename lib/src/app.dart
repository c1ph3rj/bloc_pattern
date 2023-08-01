import 'package:bloc_pattern/src/screens/login_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const MaterialApp(
      title: "Login Using Bloc Pattern",
      debugShowCheckedModeBanner: false,
      home: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
        body: LoginScreen(),
      )),
    );
  }
}
