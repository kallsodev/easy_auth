import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../login/login_cubit.dart';

class LoginButton extends StatelessWidget {
  final Widget child;
  final Widget? loadingWidget;

  const LoginButton({Key? key, required this.child, this.loadingWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? (loadingWidget ?? const CircularProgressIndicator())
            : GestureDetector(
            key: const Key('login_button'),
            onTap: state.status.isValidated
                ? () => context.read<LoginCubit>().logInWithCredentials()
                : null, child: child,);
      },
    );
  }
}
