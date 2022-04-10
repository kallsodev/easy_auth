part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class LogoutRequested extends AuthenticationEvent {}

class PasswordResetRequested extends AuthenticationEvent {}

class UserChanged extends AuthenticationEvent {
  @visibleForTesting
  const UserChanged(this.user);

  final User user;

  @override
  List<Object> get props => [user];
}
