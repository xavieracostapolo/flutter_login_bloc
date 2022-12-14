import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_bloc/blocs/authentication/authentication_bloc.dart';
import 'package:flutter_login_bloc/injectable.dart';
import 'package:flutter_login_bloc/screens/home_screen.dart';
import 'package:flutter_login_bloc/screens/login_screen.dart';
import 'package:flutter_login_bloc/screens/splash_screen.dart';
import 'package:flutter_login_bloc/theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt.get<AuthenticationBloc>(),
        )
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  State<AppView> createState() => _AppState();
}

class _AppState extends State<AppView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/login':(context) => const LoginScreen()
      },
      /*
      builder: (context, child) {
        return BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            switch (state.status) {
              case AuthenticationStatus.authenticated:
                _navigator
                    .pushAndRemoveUntil(HomeScreen.route(), (route) => false);
                break;
              case AuthenticationStatus.unaunthenticated:
                _navigator
                    .pushAndRemoveUntil(LoginScreen.route(), (route) => false);
                break;
              default:
                _navigator
                    .pushAndRemoveUntil(LoginScreen.route(), (route) => false);
                break;
            }
          },
        ); 
      },*/
      onGenerateRoute: (settings) => SplashScreen.route(),
    );
  }
}
