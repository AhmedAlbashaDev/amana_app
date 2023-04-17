
class LoginEvents {}

class Login extends LoginEvents {
  String? username;
  String? password;
  Login({this.username, this.password});
}

class PasswordVisibility extends LoginEvents {
  bool? visibility;
  PasswordVisibility({this.visibility});
}

class LoginStats {}

class Idle extends LoginStats {}

class Loading extends LoginStats {}

class PasswordVisibilityState extends LoginStats {
  bool? visibility;
  PasswordVisibilityState({this.visibility});
}

class LoginSuccess extends LoginStats {
  String? token;
  String? username;
  LoginSuccess({this.token , this.username});
}

class LoginFailed extends LoginStats {
  String? message;
  LoginFailed({this.message});
}