import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:sheet/route.dart';

import 'cupertino_form_sheet.dart';

bool isWideScreen(double width) {
  print("Screen size is $width");
  return width > 750; // Set breakpoint
}

GoRouter routerSmall = GoRouter(
  // initialLocation: '/',
  routes: [
    // small screen
    GoRoute(
      path: '/',
      name: 'smallHome',
      pageBuilder: (_, __) => CupertinoExtendedPage(child: App()),
      routes: [
        GoRoute(
          path: 'detail',
          pageBuilder: (context, __) {
            return CupertinoSheetPage(child: Detail()); // Small screen: Bottom Sheet
          },
        ),
      ],
    ),
  ],
);

GoRouter routerWide = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (_, __) => CupertinoExtendedPage(child: App()),
      routes: [
        GoRoute(
          path: 'detail',
          pageBuilder: (context, __) {
            return CupertinoFormSheetPage(child: Detail());
          },
        ),
      ],
    ),
  ],
);

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure media query is available
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  late final GoRouter router;

  MyApp({super.key}) {
    final double screenWidth = WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.width /
        WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio;

    router = isWideScreen(screenWidth) ? routerWide : routerSmall;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp.router(
      theme: CupertinoThemeData(brightness: Brightness.light),
      routerConfig: router,
    );
  }
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
                onPressed: () => context.go('./detail'),
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
              CupertinoTextField(
                placeholder: 'Name',
              ),
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

  void _openSubSheet(BuildContext context) {
    Navigator.of(context).push(
      CupertinoSheetRoute(builder: (context) => SubDetail()), // Small screen: Bottom Sheet
    );
    // Navigator.of(context).push(
    //   isWideScreen(context)
    //       ? CupertinoFormSheetRoute(builder: (context) => SubDetail()) // Wide screen: Form Sheet
    //       : CupertinoSheetRoute(builder: (context) => SubDetail()), // Small screen: Bottom Sheet
    // );
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
