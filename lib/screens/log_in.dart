import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var email, password;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'email',
                ),
                onSaved: (String value) {
                  email = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'senha',
                ),
                onSaved: (String value) {
                  password = value;
                },
              ),
              RaisedButton(
                onPressed: submit(),
              )
            ],
          ),
        )
      ],
    );
  }

  submit() {
    _auth.createUserWithEmailAndPassword(email: email, password: password);
  }
}
