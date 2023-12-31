import 'package:bloc_pattern/src/blocs/bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import "package:bloc_pattern/src/blocs/provider.dart";

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 0.0),
            child: Text(
              "Login",
              style: GoogleFonts.aBeeZee(
                  color: Colors.black,
                  fontSize: 58,
                  fontWeight: FontWeight.bold),
            ),
          ),
          emailField(bloc: bloc),
          passwordField(bloc: bloc),
          const SizedBox(
            height: 20,
          ),
          submitButton(bloc: bloc)
        ],
      ),
    );
  }
}

Widget emailField({required Bloc bloc}) {
  return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: TextField(
            onChanged:bloc.addEmail,
            style: GoogleFonts.aBeeZee(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: "you@example.com",
              labelText: "Email Address",
              errorText: snapshot.hasError ? snapshot.error.toString() : null,
            ),
          ),
        );
      });
}

Widget passwordField({required Bloc bloc}) {
  return StreamBuilder(
    stream: bloc.password,
      builder: (context, snapshot) =>
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              obscureText: true,
              style: GoogleFonts.aBeeZee(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: "Password",
                  labelText: "Password",
                errorText: snapshot.hasError ? snapshot.error.toString() : null,
              ),
              onChanged: bloc.addPassword,
            ),
          ));
}

Widget submitButton({required Bloc bloc}) {
  return StreamBuilder<bool>(
    stream: bloc.submitValid,
    builder: (context, snapshot) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: double.infinity,
          height: 60,
          child: MaterialButton(
            onPressed: (snapshot.hasError) ? null : bloc.submit,
            color: Colors.blue,
            disabledColor: Colors.grey,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Text(
              "Log In",
              style: GoogleFonts.aBeeZee(
                  color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      );
    }
  );
}
