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
  const Detail({Key? key}) : super(key: key);

  /// Shows a Cupertino confirmation dialog and resolves to true if the user
  /// confirms that they want to pop the page.
  Future<bool?> _showBackDialog(BuildContext context) {
    return showCupertinoDialog<bool>(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Are you sure?'),
        content: const Text('Do you really want to leave this sheet?'),
        actions: [
          CupertinoDialogAction(
            child: const Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(false),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            child: const Text('Leave'),
            onPressed: () => Navigator.of(context).pop(true),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope<Object?>(
      // Prevent the system from automatically popping the route.
      canPop: false,
      // This callback is invoked when a pop gesture or programmatic pop is attempted.
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        // If didPop is true, then the Navigator already popped the route.
        if (didPop) return;
        // Show the confirmation dialog.
        final bool shouldPop = await _showBackDialog(context) ?? false;
        // If the user confirmed, manually pop the route.
        if (shouldPop && context.mounted) {
          Navigator.of(context).pop();
        }
      },
      child: CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Detail'),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                const Text('Detail'),
                const CupertinoTextField(
                  placeholder: 'Name',
                ),
                CupertinoButton(
                  onPressed: () => _openSubSheet(context),
                  child: const Text('Show More Details...'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _openSubSheet(BuildContext context) {
    Navigator.of(context).push(
      CupertinoSheetRoute(builder: (context) => const SubDetail()),
    );
  }
}

class SubDetail extends StatelessWidget {
  const SubDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('More Details'),
      ),
      child: SafeArea(
        child: Center(
          child: const Text('More Details'),
        ),
      ),
    );
  }
}
