import 'package:get_it/get_it.dart';

import 'auth_service.dart';
import 'router.dart';
import 'router.gr.dart';

final get = GetIt.instance;

void setupGetIt() {
  get.registerLazySingleton<AuthService>(() => AuthService());
  get.registerLazySingleton<AuthGuard>(
      () => AuthGuard(authService: get<AuthService>()));
  get.registerLazySingleton<NoAuthGuard>(
      () => NoAuthGuard(authService: get<AuthService>()));
  get.registerLazySingleton<AppRouter>(() => AppRouter(
        authGuard: get<AuthGuard>(),
        noAuthGuard: get<NoAuthGuard>(),
      ));
}
