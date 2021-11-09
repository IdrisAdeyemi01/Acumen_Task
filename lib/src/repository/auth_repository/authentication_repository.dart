import 'package:acumen_task/src/repository/auth_repository/i_auth_repository.dart';
import 'package:acumen_task/src/services/network_service/i_network_service.dart';

class AuthenticationRepository implements IAuthenticationRepo {
  final INetworkService networkService;
  AuthenticationRepository({required this.networkService});
  @override
  Future<void> signup({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    final uri = networkService.getAPI.signup;
    await networkService.post(uri, inputJson: {
      "email": email,
      "password": password,
      "firstname": firstName,
      "lastname": lastName
    });
  }

  @override
  Future<void> signin({
    required String email,
    required String password,
  }) async {
    final uri = networkService.getAPI.signin;
    await networkService.post(uri, inputJson: {
      "email": email,
      "password": password,
    });
  }
}
