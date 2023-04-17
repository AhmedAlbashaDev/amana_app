
import 'package:amana/screens/login/login_extras.dart';
import 'package:bloc/bloc.dart';

import '../../repositories/login_repository.dart';

class LoginBLoc extends Bloc<LoginEvents, LoginStats> {
  final LoginRepository loginRepository;

  LoginBLoc(super.initialState, {required this.loginRepository}){
    on<Login>(_login);
    on<PasswordVisibility>(_passwordVisibility);
  }
  _login(Login event, Emitter<LoginStats> emit) async {
    emit(Loading());

    await loginRepository.login(username: event.username, password: event.password).then((value) {
      emit(value);
    });

  }

  _passwordVisibility(PasswordVisibility event, Emitter<LoginStats> emit) {
    emit(PasswordVisibilityState(visibility: event.visibility));
  }
}