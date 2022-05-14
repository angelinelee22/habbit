import 'package:flutter/material.dart';
import 'package:habbit/services/auth.dart';
import 'package:habbit/shared/constants.dart';
import 'package:habbit/shared/loading.dart';

class SignIn extends StatefulWidget {
  final toggleView;
  const SignIn({Key? key, this.toggleView}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  bool _errorVisible = false;

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.purple,
            body: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                child: Form(
                  key: _formKey,
                  child: Container(
                    width: 600,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 60.0),
                          child: Center(
                              child: Text('Habbit',
                                  style: TextStyle(
                                      fontFamily: 'Friends',
                                      fontSize: 70,
                                      color: Colors.white))),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: Text('Welcome back!',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontFamily: 'Hind'))),
                        Visibility(
                            visible: _errorVisible,
                            child: Container(
                                decoration: errorDecoration,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(error,
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 14.0)),
                                ))),
                        SizedBox(height: 12.0),
                        Container(
                            height: 20.0,
                            child: const Align(
                                alignment: Alignment.topLeft,
                                child: Text('Email',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Hind',
                                        fontWeight: FontWeight.bold)))),
                        TextFormField(
                            decoration: textInputDecoration,
                            validator: (String? val) {
                              if (val != null && val.isEmpty) {
                                return 'Enter an email';
                              }
                              return null;
                            },
                            onChanged: (val) {
                              setState(() => email = val);
                            }),
                        SizedBox(height: 12.0),
                        Container(
                            height: 20.0,
                            child: const Align(
                                alignment: Alignment.topLeft,
                                child: Text('Password',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Hind',
                                        fontWeight: FontWeight.bold)))),
                        TextFormField(
                            decoration: textInputDecoration,
                            validator: (String? val) {
                              if (val != null && val.length < 6) {
                                return 'Enter a password 6+ characters long';
                              }
                              return null;
                            },
                            obscureText: true,
                            onChanged: (val) {
                              setState(() => password = val);
                            }),
                        SizedBox(height: 20.0),
                        SizedBox(
                            width: double.infinity, // match parent width
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white, // background
                                  padding: EdgeInsets.symmetric(
                                      vertical: 15.0, horizontal: 10.0),
                                ),
                                child: Text('Sign in',
                                    style: TextStyle(color: Colors.purple)),
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    setState(() {
                                      loading = true;
                                      _errorVisible = false;
                                    });
                                    dynamic result =
                                        await _auth.signInWithEmailAndPassword(
                                            email, password);
                                    if (result == null) {
                                      setState(() {
                                        error =
                                            'Could not sign in with provided credentials';
                                        loading = false;
                                        _errorVisible = true;
                                      });
                                    }
                                  }
                                })),
                        SizedBox(height: 12.0),
                        TextButton(
                            style: TextButton.styleFrom(primary: Colors.white),
                            child: Text("Don't have an account?"),
                            onPressed: () {
                              widget.toggleView();
                            }),
                      ],
                    ),
                  ),
                )));
  }
}
