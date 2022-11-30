part of 'authentication_bloc.dart';

enum AuthenticationStatus { authenticated, unaunthenticated, unknown }

class AuthenticationState extends Equatable {
  final User user;
  final AuthenticationStatus status;

  const AuthenticationState(
      {this.user = const User(email: '', id: '', name: '', photo: ''),
      this.status = AuthenticationStatus.unknown});

  AuthenticationState copyWith({User? user, AuthenticationStatus? status}) {
    return AuthenticationState(
        user: user ?? this.user, status: status ?? this.status);
  }

  @override
  List<Object> get props => [user, status];
}
