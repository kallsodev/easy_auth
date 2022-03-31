import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../login/login_cubit.dart';

class GoogleLoginButton extends StatelessWidget {
  final Widget child;

  const GoogleLoginButton({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: const Key('google_button'),
      onTap: () => context.read<LoginCubit>().logInWithGoogle(),
      child: child,
    );
  }
}
