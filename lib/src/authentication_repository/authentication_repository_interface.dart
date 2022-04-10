import '../models/user.dart';

abstract class IAuthenticationRepository {
  IAuthenticationRepository();

  Stream<User> get user;

  Future<void> register({required String email, required String password});

  Future<void> logInWithGoogle();

  Future<void> passwordReset({required String email});

  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> logOut();
}
