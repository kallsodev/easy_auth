part of 'authentication_bloc.dart';

enum AuthenticationStatus {
  unknown,
  anonymouslyAuthenticated,
  authenticated,
  unauthenticated,
}

class AuthenticationState extends Equatable {
  const AuthenticationState._({
    required this.status,
    this.user = User.empty,
  });

  const AuthenticationState.authenticated(User user)
      : this._(status: AuthenticationStatus.authenticated, user: user);

  const AuthenticationState.unauthenticated() : this._(status: AuthenticationStatus.unauthenticated);

  const AuthenticationState.unknown() : this._(status: AuthenticationStatus.unknown);

  const AuthenticationState.anonymouslyAuthenticated(User user) : this._(status: AuthenticationStatus.anonymouslyAuthenticated, user: user);

  final AuthenticationStatus status;
  final User user;

  @override
  List<Object> get props => [status, user];
}
