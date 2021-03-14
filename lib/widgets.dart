import 'package:auto_route/auto_route.dart';
import 'package:auto_route_example/auth_service.dart';
import 'package:auto_route_example/router.gr.dart';
import 'package:flutter/material.dart';

import 'getit.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Row(
          children: [
            Spacer(),
            OutlinedButton(
              onPressed: () {
                context.router.push(PublicARoute());
              },
              child: Text('Public A'),
            ),
            Spacer(),
            OutlinedButton(
              onPressed: () {
                context.router.root.push(ProtectedRoute());
                // context.router.root.pushPath('/protected');
              },
              child: Text('Protected'),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

class PublicAPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Public A'),
      ),
      body: Center(
        child: OutlinedButton(
          onPressed: () {
            context.router.push(HomeRoute());
          },
          child: Text('Home'),
        ),
      ),
    );
  }
}

class PublicBPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Public B'),
      ),
      body: Center(
        child: OutlinedButton(
          onPressed: () {
            context.router.push(HomeRoute());
          },
          child: Text('Home'),
        ),
      ),
    );
  }
}

class PublicCPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Public C'),
      ),
      body: Center(
        child: OutlinedButton(
          onPressed: () {
            context.router.push(HomeRoute());
          },
          child: Text('Home'),
        ),
      ),
    );
  }
}

class PublicHPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Public H'),
      ),
      body: const Center(
        child: Text('Public H'),
      ),
    );
  }
}

class ProtectedPage extends StatelessWidget {
  ProtectedPage();

  final _authService = get<AuthService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Protected'),
      ),
      body: Center(
        child: OutlinedButton(
          onPressed: () async {
            await _authService.logout();
            if (!_authService.authenticated) {
              // context.router.root.push(HomeRouter());
              // context.router.root.push(PublicRoute());
              // context.router.root.navigate(PublicARoute());
              // context.router.root.pushPath('/a');
              context.router.pushPath('/b');
            }
          },
          child: Text('Logout'),
        ),
      ),
    );
  }
}

class AuthPage extends StatelessWidget {
  AuthPage({@required this.onSuccessAuthenticated});

  final void Function(bool success) onSuccessAuthenticated;

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
              context.router.pop();
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
      ),
      body: const Center(
        child: Text('404 - Page Not Found!'),
      ),
    );
  }
}
