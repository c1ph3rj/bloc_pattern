import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 0.0),
            child: Text(
              "Login",
              style: GoogleFonts.aBeeZee(
                  color: Colors.black, fontSize: 58, fontWeight: FontWeight.bold),
            ),
          ),
          emailField(),
          passwordField(),
          const SizedBox(
            height: 20,
          ),
          submitButton()
        ],
      ),
    );
  }
}

Widget emailField() {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: TextField(
      style: GoogleFonts.aBeeZee(
          color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: "you@example.com",
          labelText: "Email Address"),
    ),
  );
}

Widget passwordField() {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: TextField(
      obscureText: true,
      style: GoogleFonts.aBeeZee(
          color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      decoration: const InputDecoration(border: OutlineInputBorder(),hintText: "Password", labelText: "Password"),
    ),
  );
}


Widget submitButton() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      width: double.infinity,
      height: 60,
      child: MaterialButton (onPressed: () {  },
        color: Colors.blue,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))
        ),
      child: Text("Log In", style: GoogleFonts.aBeeZee(
          color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),),
    ),
  );
}