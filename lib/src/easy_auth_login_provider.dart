import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import 'authentication_repository/authentication_repository_interface.dart';
import 'login/login_cubit.dart';

class EasyAuthLoginProvider extends StatelessWidget {
  final Widget child;
  final Function(String)? onFailure;
  final Function()? onSuccess;
  final Function()? onLoading;

  const EasyAuthLoginProvider(
      {Key? key, required this.child, this.onFailure, this.onSuccess, this.onLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(
        context.read<IAuthenticationRepository>(),
      ),
      child: _LoginListenerLayer(
        child: child,
        onFailure: onFailure,
        onSuccess: onSuccess,
        onLoading: onLoading,
      ),
    );
  }
}

class _LoginListenerLayer extends StatelessWidget {
  final Widget child;
  final Function(String)? onFailure;
  final Function()? onSuccess;
  final Function()? onLoading;

  const _LoginListenerLayer(
      {Key? key, required this.child, this.onFailure, this.onSuccess, this.onLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status == FormzStatus.submissionFailure && onFailure != null) {
          onFailure!(state.errorMessage!);
        }
        if (state.status == FormzStatus.submissionSuccess && onSuccess != null) {
          onSuccess!();
        }
        if (state.status == FormzStatus.submissionInProgress && onLoading != null) {
          onLoading!();
        }
      },
      child: child,
    );
  }
}
