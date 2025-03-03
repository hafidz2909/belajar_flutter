import 'package:flutter/material.dart';

class parcing extends StatelessWidget {
  final String username;
  final String email;
  final String password;
  parcing({
    required this.username,
    required this.email,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Hello World App')),
        body: Center(
          child: Column(
            children: <Widget>[
              Text('Username: $username'),
              Text('Email: $email'),
              Text('Password: $password'),
            ],
          ),
        ),
      ),
    );
  }
}
