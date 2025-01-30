import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:sheet/route.dart';

import 'mediequery_sizeof.dart';

GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (_, __) => CupertinoExtendedPage(child: App()),
      routes: [
        GoRoute(
          path: 'detail',
          pageBuilder: (_, __) => CupertinoSheetPage(child: Detail()),
        ),
      ],
    ),
  ],
);

void main() {
  runApp(CupertinoApp.router(
    theme: CupertinoThemeData(brightness: Brightness.light),
    routerConfig: router,
  ));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Master'),
      ),
      child: SafeArea(
        child: Center(
          child: Column(
            children: [
              CupertinoButton(
                onPressed: () => context.go('/detail'),
                child: Text('Open Detail Sheet'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Detail'),
      ),
      child: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text('Detail'),
              CupertinoButton(
                onPressed: () => _openSubSheet(context),
                child: Text('Show More Details...'),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _openSubSheet(context) {
    Navigator.of(context).push(
      CupertinoSheetRoute(builder: (context) => SubDetail()),
    );
  }
}

class SubDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('More Details'),
      ),
      child: SafeArea(
        child: Center(
          child: Text('More Details'),
        ),
      ),
    );
  }
}
