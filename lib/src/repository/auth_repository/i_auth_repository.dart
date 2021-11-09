import 'package:acumen_task/src/repository/auth_repository/authentication_repository.dart';
import 'package:acumen_task/src/services/network_service/i_network_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class IAuthenticationRepo {
  Future<void> signup({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  });

  Future<void> signin({
    required String email,
    required String password,
  });
}

final authenticationRepository = Provider<IAuthenticationRepo>(
  (ref) => AuthenticationRepository(
    networkService: ref.read(networkService),
  ),
);
