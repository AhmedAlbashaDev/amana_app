import 'package:amana/screens/login/login_extras.dart';
import 'package:dio/dio.dart';

import '../utils/globals.dart';

class LoginRepository {

  Future<LoginStats> login({String? username , dynamic password}) async {
    try {
      var response = await client.post('auth/login' , data: {
        "username" : username,
        "password" : password,
      });
      return LoginSuccess(token: response.data['access_token'] ?? '' , username: response.data['user']['username'] ?? '');
    } on DioError catch (e) {
      return LoginFailed(message: e.response?.data['message'] ?? 'غير معرف حاول مرة اخري');
    }
  }
}
