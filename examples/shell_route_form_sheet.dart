import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:sheet/route.dart' as sheet;
import 'cupertino_form_sheet.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final nestedNavigationKey = GlobalKey<NavigatorState>();

GoRouter router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (_, __) => sheet.CupertinoExtendedPage(child: Home()),
      routes: [
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

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure media query is available

  var app = CupertinoApp.router(
    theme: CupertinoThemeData(brightness: Brightness.light),
    routerConfig: router,
  );

  runApp(app);
}

class Home extends StatelessWidget {
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
                onPressed: () => context.go('./shell-detail'),
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
                onPressed: () => context.go('./subdetail'),
                child: Text('Show More Details...'),
              )
            ],
          ),
        ),
      ),
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
