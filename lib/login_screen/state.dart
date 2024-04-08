abstract class LoginStates {}
class LoginInitialStates extends LoginStates{}

class PasswordStates extends LoginInitialStates {}

class LoginLoadingStates extends LoginInitialStates {}
class LoginSuccessStates extends LoginInitialStates {
  late final String uId;

  LoginSuccessStates ({
    required this.uId,
  });


}

class LoginErrorStates extends LoginInitialStates {}
