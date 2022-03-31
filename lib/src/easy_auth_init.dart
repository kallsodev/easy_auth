import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'authentication_bloc/authentication_bloc.dart';
import 'authentication_repository/authentication_repository_interface.dart';
import 'authentication_repository/firebase_authentication_repository.dart';

class EasyAuthInit extends StatelessWidget {
  final Widget child;
  final IAuthenticationRepository? authenticationRepository;

  const EasyAuthInit({Key? key, required this.child, this.authenticationRepository})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (_) => AuthenticationBloc(
        authenticationRepository: authenticationRepository ?? FirebaseAuthenticationRepository(),
      ),
      child: RepositoryProvider.value(
        value: authenticationRepository ?? FirebaseAuthenticationRepository(),
        child: child,
      ),
    );
  }
}
