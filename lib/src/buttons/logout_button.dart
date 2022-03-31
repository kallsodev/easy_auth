import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../authentication_bloc/authentication_bloc.dart';

class LogoutButton extends StatelessWidget {
  final Widget child;

  const LogoutButton({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<AuthenticationBloc>().add(LogoutRequested()),
      child: child,
    );
  }
}
