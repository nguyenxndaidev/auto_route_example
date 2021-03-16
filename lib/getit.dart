import 'package:get_it/get_it.dart';

import 'app_router.dart';
import 'app_router.gr.dart';
import 'auth_service.dart';

final get = GetIt.instance;

void setupGetIt() {
  get.registerLazySingleton<AuthService>(() => AuthService());
  get.registerLazySingleton<AuthGuard>(() => AuthGuard());
  get.registerLazySingleton<NoAuthGuard>(() => NoAuthGuard());
  get.registerLazySingleton<AppRouter>(() => AppRouter(
        noAuthGuard: get<NoAuthGuard>(),
        authGuard: get<AuthGuard>(),
      ));
}
