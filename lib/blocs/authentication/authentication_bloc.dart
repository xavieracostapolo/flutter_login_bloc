import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_login_bloc/models/user.dart';
import 'package:flutter_login_bloc/repository/authentication_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

@singleton
class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final IAuthenticationRepository _authenticationRepository;

  final _logger = Logger();

  AuthenticationBloc(this._authenticationRepository)
      : super(const AuthenticationState()) {
    on<AuthenticationUserChanged>(_onAuthenticationUserChanged);
    on<AuthenticationLogoutRequested>(_onAuthenticationLogoutRequested);
  }

  FutureOr<void> _onAuthenticationUserChanged(
      AuthenticationUserChanged event, Emitter<AuthenticationState> emit) async{
        _logger.i('hi');
        await _authenticationRepository.logInWithGoogle();
        emit(state.copyWith(user: event.user));
      }

  FutureOr<void> _onAuthenticationLogoutRequested(AuthenticationLogoutRequested event, Emitter<AuthenticationState> emit) async{
    await _authenticationRepository.logOut();
    emit(state.copyWith(status: AuthenticationStatus.unaunthenticated));
  }
}
