import 'package:easy_auth/easy_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import 'authentication_repository/authentication_repository_interface.dart';
import 'password_reset/password_reset_cubit.dart';

class EasyAuthResetPasswordProvider extends StatelessWidget {
  final Widget child;
  final Function(String)? onFailure;
  final Function()? onSuccess;
  final Function()? onLoading;

  const EasyAuthResetPasswordProvider(
      {Key? key, required this.child, this.onFailure, this.onSuccess, this.onLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PasswordResetCubit(
        context.read<IAuthenticationRepository>(),
      ),
      child: _ResetPasswordListenerLayer(
        child: child,
        onFailure: onFailure,
        onSuccess: onSuccess,
        onLoading: onLoading,
      ),
    );
  }
}

class _ResetPasswordListenerLayer extends StatelessWidget {
  final Widget child;
  final Function(String)? onFailure;
  final Function()? onSuccess;
  final Function()? onLoading;

  const _ResetPasswordListenerLayer(
      {Key? key, required this.child, this.onFailure, this.onSuccess, this.onLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<PasswordResetCubit, PasswordResetState>(
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
