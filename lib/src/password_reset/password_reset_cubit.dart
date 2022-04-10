import 'package:bloc/bloc.dart';
import 'package:easy_auth/src/authentication_repository/exceptions.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../authentication_repository/authentication_repository_interface.dart';
import '../models/email.dart';

part 'password_reset_state.dart';

class PasswordResetCubit extends Cubit<PasswordResetState> {
  PasswordResetCubit(this._authenticationRepository) : super(const PasswordResetState());

  final IAuthenticationRepository _authenticationRepository;

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        status: Formz.validate([email]),
      ),
    );
  }

  Future<void> requestReset() async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await _authenticationRepository.passwordReset(
        email: state.email.value,
      );
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on PasswordResetFailure catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.message,
          status: FormzStatus.submissionFailure,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
