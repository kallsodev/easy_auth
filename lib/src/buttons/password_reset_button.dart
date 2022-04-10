import 'package:easy_auth/src/password_reset/password_reset_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class PasswordResetButton extends StatelessWidget {
  final Widget child;
  final Widget? loadingWidget;

  const PasswordResetButton({Key? key, required this.child, this.loadingWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PasswordResetCubit, PasswordResetState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? (loadingWidget ?? const CircularProgressIndicator())
            : GestureDetector(
                key: const Key('password_reset_button'),
                onTap: state.status.isValidated
                    ? () => context.read<PasswordResetCubit>().requestReset()
                    : null,
                child: child,
              );
      },
    );
  }
}
