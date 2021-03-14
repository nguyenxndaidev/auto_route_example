import 'package:auto_route/auto_route.dart';
import 'package:auto_route_example/auth_service.dart';
import 'package:auto_route_example/router.gr.dart';
import 'package:flutter/widgets.dart';

import 'widgets.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      initial: true,
      name: 'HomeRouter',
      page: HomeRouterPage,
      children: [
        AutoRoute(path: '', page: HomePage),
        AutoRoute(path: 'a', page: PublicAPage),
        RedirectRoute(path: 'b', redirectTo: 'c'),
        AutoRoute(path: 'c', page: PublicCPage),
        // TODO: https://github.com/Milad-Akarie/auto_route_library/issues/393
        RedirectRoute(path: 'd', redirectTo: '/auth'),
      ],
    ),
    AutoRoute(path: '/auth', guards: [NoAuthGuard], page: AuthPage),
    AutoRoute(path: '/protected', guards: [AuthGuard], page: ProtectedPage),
    AutoRoute(path: '/*', page: NotFoundPage),
  ],
)
class $AppRouter {}

class HomeRouterPage extends AutoRouter with AutoRouteWrapper {
  const HomeRouterPage({Key key}) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) {
    return this;
  }
}

class NoAuthGuard extends AutoRouteGuard {
  NoAuthGuard({@required this.authService});

  final AuthService authService;

  @override
  Future<bool> canNavigate(
    List<PageRouteInfo> pendingRoutes,
    StackRouter router,
  ) async {
    bool isAuthenticated = authService.authenticated;

    if (!isAuthenticated) {
      return true;
    }

    router.root.push(ProtectedRoute());
    return false;
  }
}

class AuthGuard extends AutoRouteGuard {
  AuthGuard({@required this.authService});

  final AuthService authService;

  @override
  Future<bool> canNavigate(
    List<PageRouteInfo> pendingRoutes,
    StackRouter router,
  ) async {
    bool isAuthenticated = authService.authenticated;
    print('isAuthenticated $isAuthenticated');

    if (isAuthenticated) {
      return true;
    }

    router.root.push(AuthRoute(onSuccessAuthenticated: (success) {
      if (success) {
        print('pendingRoutes $pendingRoutes');
        router.replaceAll(pendingRoutes);
      }
    }));
    return false;
  }
}
