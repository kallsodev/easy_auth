import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'authentication_bloc/authentication_bloc.dart';

class EasyAuthLayer extends StatelessWidget {
  final Widget authenticated;
  final Widget unauthenticated;
  const EasyAuthLayer({Key? key, required this.authenticated, required this.unauthenticated,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, authState) {
        switch (authState.status) {
          case AuthenticationStatus.authenticated:
            return authenticated;
          case AuthenticationStatus.unauthenticated:
            return unauthenticated;
        }
      },
    );
  }
}