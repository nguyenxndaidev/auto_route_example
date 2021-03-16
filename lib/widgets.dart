import 'package:auto_route/auto_route.dart';
import 'package:auto_route_example/app_router.gr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'auth_service.dart';
import 'getit.dart';

class NavigationButtons extends StatelessWidget {
  const NavigationButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        OutlinedButton(
          onPressed: () => context.router.root.push(HomeRouter()),
          child: Text('context.router.root.push(HomeRouter())'),
        ),
        OutlinedButton(
          onPressed: () => context.router.root.push(HomeRouter(pageId: 'a')),
          child: Text("context.router.root.push(HomeRouter(pageId: 'a'))"),
        ),
        OutlinedButton(
          onPressed: () => context.router.root.push(HomeRouter(pageId: 'b')),
          child: Text("context.router.root.push(HomeRouter(pageId: 'b'))"),
        ),
        OutlinedButton(
          onPressed: () => context.router.root.push(PublicRouter()),
          child: Text('context.router.root.push(PublicRouter())'),
        ),
        OutlinedButton(
          onPressed: () => context.router.root.push(PublicRouter(pageId: 'a')),
          child: Text("context.router.root.push(PublicRouter(pageId: 'a'))"),
        ),
        OutlinedButton(
          onPressed: () => context.router.root.push(PublicRouter(pageId: 'b')),
          child: Text("context.router.root.push(PublicRouter(pageId: 'b'))"),
        ),
        OutlinedButton(
          onPressed: () => context.router.root.push(ProtectedRouter()),
          child: Text('context.router.root.push(ProtectedRouter())'),
        ),
        OutlinedButton(
          onPressed: () =>
              context.router.root.push(ProtectedRouter(pageId: 'a')),
          child: Text("context.router.root.push(ProtectedRouter(pageId: 'a'))"),
        ),
        OutlinedButton(
          onPressed: () =>
              context.router.root.push(ProtectedRouter(pageId: 'b')),
          child: Text("context.router.root.push(ProtectedRouter(pageId: 'b'))"),
        ),
      ],
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [AuthButton()],
      ),
      body: Center(child: NavigationButtons()),
    );
  }
}

class AuthButton extends StatefulWidget {
  const AuthButton({Key? key}) : super(key: key);

  @override
  _AuthButtonState createState() => _AuthButtonState();
}

class _AuthButtonState extends State<AuthButton> {
  final _authService = get<AuthService>();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (!_authService.authenticated) {
          context.router.root.push(AuthRoute(onSuccessAuthenticated: (success) {
            context.router.pop();
          }));
        } else {
          // TODO: instead of redirect to a specific page, keep current page but check guards.
          _authService.logout().then((_) =>
              context.router.root.push(HomeRouter(children: [HomeRoute()])));
        }
      },
      icon: Icon(_authService.authenticated ? Icons.logout : Icons.login),
    );
  }
}

class HomeAPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home A'),
        actions: [AuthButton()],
      ),
      body: Center(child: NavigationButtons()),
    );
  }
}

class HomeBPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home B'),
        actions: [AuthButton()],
      ),
      body: Center(child: NavigationButtons()),
    );
  }
}

class PublicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Public'),
        actions: [AuthButton()],
      ),
      body: Center(child: NavigationButtons()),
    );
  }
}

class PublicAPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Public A'),
        actions: [AuthButton()],
      ),
      body: Center(child: NavigationButtons()),
    );
  }
}

class PublicBPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Public B'),
        actions: [AuthButton()],
      ),
      body: Center(child: NavigationButtons()),
    );
  }
}

class ProtectedPage extends StatelessWidget {
  ProtectedPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Protected'),
        actions: [AuthButton()],
      ),
      body: Center(child: NavigationButtons()),
    );
  }
}

class ProtectedAPage extends StatelessWidget {
  ProtectedAPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Protected A'),
        actions: [AuthButton()],
      ),
      body: Center(child: NavigationButtons()),
    );
  }
}

class ProtectedBPage extends StatelessWidget {
  ProtectedBPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Protected B'),
        actions: [AuthButton()],
      ),
      body: Center(child: NavigationButtons()),
    );
  }
}

class AuthPage extends StatelessWidget {
  AuthPage({this.onSuccessAuthenticated});

  final void Function(bool success)? onSuccessAuthenticated;

  final _authService = get<AuthService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auth'),
      ),
      body: Center(
        child: OutlinedButton(
          onPressed: () async {
            await _authService.login();
            if (_authService.authenticated) {
              onSuccessAuthenticated?.call(true);
            }
          },
          child: Text('Login'),
        ),
      ),
    );
  }
}

class NotFoundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PageNotFound'),
        actions: [AuthButton()],
      ),
      body: const Center(
        child: Text('404 - Page Not Found!'),
      ),
    );
  }
}
