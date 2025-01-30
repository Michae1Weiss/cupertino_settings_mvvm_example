import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import 'mediequery_sizeof.dart';

GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => App(),
    ),
    GoRoute(
      path: 'detail',
      builder: (_, __) => Detail(),
    ),
  ],
);

void main() {
  runApp(CupertinoApp.router(routerConfig: router));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
