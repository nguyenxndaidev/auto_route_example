import 'package:auto_route/auto_route.dart';
import 'package:auto_route_example/router.gr.dart';
import 'package:flutter/material.dart';

class NavigationButtons extends StatelessWidget {
  const NavigationButtons({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        OutlinedButton(
          onPressed: () => context.router.push(HomeRoute()),
          child: Text('context.router.push(HomeRoute())'),
        ),
        Spacer(),
        OutlinedButton(
          onPressed: () => context.router.push(HomeARoute()),
          child: Text('context.router.push(HomeARoute())'),
        ),
        Spacer(),
        OutlinedButton(
          onPressed: () => context.router.push(HomeBRoute()),
          child: Text('context.router.push(HomeBRoute())'),
        ),
        Spacer(),
        OutlinedButton(
          onPressed: () => context.router.push(PublicRoute()),
          child: Text('context.router.push(PublicRoute())'),
        ),
        Spacer(),
        OutlinedButton(
          onPressed: () => context.router.push(PublicARoute()),
          child: Text('context.router.push(PublicARoute())'),
        ),
        Spacer(),
        OutlinedButton(
          onPressed: () => context.router.push(PublicBRoute()),
          child: Text('context.router.push(PublicBRoute())'),
        ),
        Spacer(),
        OutlinedButton(
          onPressed: () => context.router.push(ProtectedRoute()),
          child: Text('context.router.push(ProtectedRoute())'),
        ),
        Spacer(),
        OutlinedButton(
          onPressed: () => context.router.push(ProtectedARoute()),
          child: Text('context.router.push(ProtectedARoute())'),
        ),
        Spacer(),
        OutlinedButton(
          onPressed: () => context.router.push(ProtectedBRoute()),
          child: Text('context.router.push(ProtectedBRoute())'),
        ),
        Spacer(),
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
      ),
      body: Center(child: NavigationButtons()),
    );
  }
}

class HomeAPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home A'),
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
      ),
      body: Center(child: NavigationButtons()),
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
