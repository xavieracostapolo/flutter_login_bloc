import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body:  Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              const Text('Login Page en construccion'),
              ElevatedButton(
                child: const Text('Button label'),
                onPressed: () {

                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
