import 'package:acumen_task/src/content/utilities/base_change_notifiers.dart';
import 'package:acumen_task/src/repository/auth_repository/i_auth_repository.dart';
import 'package:acumen_task/src/services/navigation_service/i_navigation_service.dart';
import 'package:acumen_task/src/services/snackbar_service/snackbar_service.dart';
import 'package:acumen_task/src/shared/models/failure.dart';
import 'package:acumen_task/src/shared/routing/routes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignupNotifier extends BaseChangeNotifier {
  SignupNotifier(this.read);
  final Reader read;

  Future<Object?>? navigateToHomeView() {
    read(navigationService).pushReplace(Routes.home);
  }

  Future<void> signup({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    setState(state: AppState.loading);
    try {
      await read(authenticationRepository).signup(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
      );

      read(snackbarService).showSnackbar(
        'Registration successful',
      );

      navigateToHomeView();
    } on Failure catch (error) {
      read(snackbarService).showSnackbar(error.message);
    } finally {
      setState(state: AppState.idle);
    }
  }
}

final signupNotifier = ChangeNotifierProvider(
  (ref) => SignupNotifier(ref.read),
);
