import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:sheet/route.dart' as sheet;

import 'cupertino_form_sheet.dart';

bool isWideScreen(double width) {
  print("Screen size is $width");
  return width > 750; // Set breakpoint
}

final rootNavigatorKey = GlobalKey<NavigatorState>();
final nestedNavigationKey = GlobalKey<NavigatorState>();

GoRouter routerSmall = GoRouter(
  navigatorKey: rootNavigatorKey,
  // initialLocation: '/',
  routes: [
    // small screen
    GoRoute(
      path: '/',
      name: 'smallHome',
      pageBuilder: (_, __) => sheet.CupertinoExtendedPage(child: App()),
      routes: [
        GoRoute(
          path: 'detail',
          pageBuilder: (context, __) {
            return sheet.CupertinoSheetPage(child: Detail()); // Small screen: Bottom Sheet
          },
        ),
        ShellRoute(
          navigatorKey: nestedNavigationKey,
          parentNavigatorKey: rootNavigatorKey,
          pageBuilder: (context, state, child) => sheet.CupertinoSheetPage(key: state.pageKey, child: child),
          routes: [
            GoRoute(
              path: 'shell-detail',
              pageBuilder: (context, state) {
                return CupertinoFormSheetPage(
                  child: Detail(),
                );
              },
              routes: [
                GoRoute(
                  path: 'subdetail',
                  pageBuilder: (context, state) {
                    return CupertinoFormSheetPage(
                      child: SubDetail(),
                    );
                  },
                ),
              ],
            ),
          ],
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
      pageBuilder: (_, __) => sheet.CupertinoExtendedPage(child: App()),
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

class DetailNice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // This callback is called when the user attempts to pop the route.
      onWillPop: () async {
        final shouldLeave = await showCupertinoDialog<bool>(
          context: context,
          builder: (context) => CupertinoAlertDialog(
            title: Text('Are you sure?'),
            content: Text('Do you really want to leave this sheet?'),
            actions: [
              CupertinoDialogAction(
                child: Text('Cancel'),
                onPressed: () => Navigator.of(context).pop(false),
              ),
              CupertinoDialogAction(
                child: Text('Leave'),
                isDestructiveAction: true,
                onPressed: () => Navigator.of(context).pop(true),
              ),
            ],
          ),
        );
        // If user taps outside or presses back, treat it as a cancel.
        return shouldLeave ?? false;
      },
      child: CupertinoPageScaffold(
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
      ),
    );
  }

  void _openSubSheet(BuildContext context) {
    Navigator.of(context).push(
      CupertinoSheetRoute(builder: (context) => SubDetail()),
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
      /*
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
      */

      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        // This is where you show your confirmation dialog:
        if (!didPop) {
          final bool shouldPop = await showCupertinoDialog<bool>(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                  title: const Text('Are you sure?'),
                  content: const Text('Do you really want to close this sheet?'),
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
              ) ??
              false;
          if (shouldPop && context.mounted) {
            Navigator.pop(context);
          }
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
      CupertinoFormSheetRoute(builder: (context) => const SubDetail()),
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
