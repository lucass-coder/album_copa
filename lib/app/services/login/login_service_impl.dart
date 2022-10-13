// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fwc_album_app/app/repositoy/auth/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './login_service.dart';

class LoginServiceImpl implements LoginService {
  final AuthRepository authRepository;

  LoginServiceImpl({
    required this.authRepository,
  });
  @override
  Future<void> execute(
      {required String email, required String password}) async {
    final accessToken =
        await authRepository.login(email: email, password: password);
    final sharedPreference = await SharedPreferences.getInstance();
    sharedPreference.setString('accessToken', accessToken);
  }
}
