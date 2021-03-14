import 'package:auto_route/auto_route.dart';
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
        AutoRoute(path: 'a', page: HomeAPage),
        AutoRoute(path: 'b', page: HomeBPage),
      ],
    ),
    AutoRoute(
      path: '/public',
      name: 'PublicRouter',
      page: PublicRouterPage,
      children: [
        AutoRoute(path: '', page: PublicPage),
        AutoRoute(path: 'a', page: PublicAPage),
        AutoRoute(path: 'b', page: PublicBPage),
      ],
    ),
    AutoRoute(
      path: '/protected',
      name: 'ProtectedRouter',
      page: ProtectedRouterPage,
      children: [
        AutoRoute(path: '', page: ProtectedPage),
        AutoRoute(path: 'a', page: ProtectedAPage),
        AutoRoute(path: 'b', page: ProtectedBPage),
      ],
    ),
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

class PublicRouterPage extends AutoRouter with AutoRouteWrapper {
  const PublicRouterPage({Key key}) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) {
    return this;
  }
}

class ProtectedRouterPage extends AutoRouter with AutoRouteWrapper {
  const ProtectedRouterPage({Key key}) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) {
    return this;
  }
}
