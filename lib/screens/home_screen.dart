import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_bloc/blocs/authentication/authentication_bloc.dart';
import 'package:flutter_login_bloc/models/user.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              const Text('Home Page en construccion'),
              ElevatedButton(
                child: const Text('Button label'),
                onPressed: () async {
                  BlocProvider.of<AuthenticationBloc>(context).add(
                      const AuthenticationUserChanged(User(
                          email: 'xx', id: 'xx', name: 'xx', photo: 'xx')));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
