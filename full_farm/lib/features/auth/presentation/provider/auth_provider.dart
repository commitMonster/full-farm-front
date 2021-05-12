import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:full_farm/core/usecase/usecase.dart';
import 'package:full_farm/features/auth/domain/entities/user.dart';
import 'package:full_farm/features/auth/domain/usecases/check_email.dart';
import 'package:full_farm/features/auth/domain/usecases/sign_out.dart';
import 'package:full_farm/features/auth/domain/usecases/sign_in.dart';
import 'package:full_farm/features/auth/domain/usecases/sign_up.dart';

class AuthProvider with ChangeNotifier {
  final CheckInputValidationUseCase checkInputValidationUseCase;
  final SignUpUseCase signUpUseCase;
  final SignInUseCase signInUseCase;
  final SignOutUseCase signOutUseCase;

  AuthProvider({
    @required this.checkInputValidationUseCase,
    @required this.signInUseCase,
    @required this.signUpUseCase,
    @required this.signOutUseCase,
  });

  User _user;
  User get userEntity => _user;
  bool _userIdValidation = false;
  bool get userIdValidation => _userIdValidation;
  bool _emailValidation = false;
  bool get emailValidation => _emailValidation;

  Future<void> checkInputValidation({
    @required String inputType,
    @required String input,
  }) async {
    final response = await checkInputValidationUseCase(
      CheckInputValidationParams(
        inputType: inputType,
        input: input
      ),
    );
    response.fold(
      (failure) {
      },
      (success) {
        switch (inputType) {
          case "email":
            _emailValidation = success;
            break;
          case "userId":
            _userIdValidation = success;
            break;
        }
      },
    );
  }

  Future<void> signUp({
    @required String userId,
    @required String password,
    @required String name,
    @required String email,
    @required String address,
  }) async {
    final response = await signUpUseCase(
        SignUpParams(
          userId: userId,
          password: password,
          name: name,
          email: email,
          address: address,
        ),
    );
    response.fold(
      (failure) {
      },
      (success) {
      },
    );
  }

  Future<void> signIn({
    @required String userId,
    @required String password,
  }) async {
    final response = await signInUseCase(
      SignInParams(
        userId: userId,
        password: password,
      ),
    );
    response.fold(
      (failure) {
      },
      (success) {
        _user = success;
      },
    );
  }

  Future<void> signOut() async {
    final response = await signOutUseCase(
      NoParams()
    );
    response.fold(
      (failure) {
      },
      (success) {
      },
    );
  }
}