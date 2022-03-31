import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../register/register_cubit.dart';

class RegisterButton extends StatelessWidget {
  final Widget child;
  final Widget? loadingWidget;

  const RegisterButton({Key? key, required this.child, this.loadingWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? (loadingWidget ?? const CircularProgressIndicator())
            : GestureDetector(
          key: const Key('register_button'),
          onTap: state.status.isValidated
              ? () => context.read<RegisterCubit>().registerFormSubmitted()
              : null, child: child,);
      },
    );
  }
}
