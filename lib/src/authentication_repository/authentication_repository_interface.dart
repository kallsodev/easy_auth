

import '../models/user.dart';

abstract class IAuthenticationRepository {
  IAuthenticationRepository();

  Stream<User> get user;

  User get currentUser;

  Future<void> register({required String email, required String password});

  Future<void> logInWithGoogle();

  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> logOut();
}