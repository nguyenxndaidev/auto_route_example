import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';

import 'app_router.gr.dart';

class HomeRouterPage extends StatefulWidget {
  HomeRouterPage({this.pageId});

  final String? pageId;

  @override
  _HomeRouterPageState createState() => _HomeRouterPageState();
}

class _HomeRouterPageState extends State<HomeRouterPage> {
  @override
  Widget build(BuildContext context) => AutoRouter.declarative(
        onGenerateRoutes: (context, routes) => [
          HomeRoute(),
          if (widget.pageId == 'a') HomeARoute(),
          if (widget.pageId == 'b') HomeBRoute(),
        ],
      );
}

class PublicRouterPage extends StatefulWidget {
  PublicRouterPage({this.pageId});

  final String? pageId;

  @override
  _PublicRouterPageState createState() => _PublicRouterPageState();
}

class _PublicRouterPageState extends State<PublicRouterPage> {
  @override
  Widget build(BuildContext context) => AutoRouter.declarative(
        onGenerateRoutes: (context, routes) => [
          PublicRoute(),
          if (widget.pageId == 'a') PublicARoute(),
          if (widget.pageId == 'b') PublicBRoute(),
        ],
      );
}

class ProtectedRouterPage extends StatefulWidget {
  ProtectedRouterPage({this.pageId});

  final String? pageId;

  @override
  _ProtectedRouterPageState createState() => _ProtectedRouterPageState();
}

class _ProtectedRouterPageState extends State<ProtectedRouterPage> {
  @override
  Widget build(BuildContext context) => AutoRouter.declarative(
        onGenerateRoutes: (context, routes) => [
          ProtectedRoute(),
          if (widget.pageId == 'a') ProtectedARoute(),
          if (widget.pageId == 'b') ProtectedBRoute(),
        ],
      );
}
