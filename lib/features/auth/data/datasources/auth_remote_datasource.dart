
import 'package:challenge/app/data/success_response_model.dart';
import 'package:challenge/app/presentation/env/env.dart';
import 'package:challenge/features/auth/data/model/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<SuccessResponseModel> login(String username, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<SuccessResponseModel> login(String username, String password) async {
    try {
      await Future.delayed(const Duration(milliseconds: 1000));
      final user = UserModel(name: username, token: Env.accessToken, apiKey: Env.apiKey);
          return SuccessResponseModel(success: true, message: "Login success", responseObj: user);

    } catch (e) {
      return const SuccessResponseModel(success: false, message: "Login failed");
    }
  }

}
