import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'authentication_bloc/authentication_bloc.dart';

class EasyAuthLayer extends StatelessWidget {
  final Widget authenticated;
  final Widget unauthenticated;
  final Widget unknown;
  final Widget? anonymouslyAuthenticated;
  const EasyAuthLayer({Key? key, required this.authenticated, required this.unauthenticated, required this.unknown, this.anonymouslyAuthenticated,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, authState) {
        switch (authState.status) {
          case AuthenticationStatus.authenticated:
            return authenticated;
          case AuthenticationStatus.unauthenticated:
            return unauthenticated;
          case AuthenticationStatus.unknown:
            return unknown;
          case AuthenticationStatus.anonymouslyAuthenticated:
            return anonymouslyAuthenticated ?? unauthenticated;
        }
      },
    );
  }
}