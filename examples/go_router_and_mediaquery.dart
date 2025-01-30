import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:sheet/route.dart';

import 'cupertino_form_sheet.dart';

bool isWideScreen(BuildContext context) {
  final double width = MediaQuery.sizeOf(context).width;
  print("Hey, rebuild here!");
  return width > 750; // Adjust breakpoint as needed
}

GoRouter router = GoRouter(
  initialLocation: '/',
  redirect: (context, state) {
    if (isWideScreen(context)) {
      return '/big/';
    } else {
      return '/';
    }
  },
  routes: [
    // small screen
    GoRoute(
      path: '/',
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
    // big screen
    GoRoute(
      path: '/big/',
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

// GoRouter routerWide = GoRouter(
//   initialLocation: '/',
//   routes: [
//     GoRoute(
//       path: '/',
//       pageBuilder: (_, __) => CupertinoExtendedPage(child: App()),
//       routes: [
//         GoRoute(
//           path: 'detail',
//           pageBuilder: (context, __) {
//             return CupertinoFormSheetPage(child: Detail());
//           },
//         ),
//       ],
//     ),
//   ],
// );

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
      isWideScreen(context)
          ? CupertinoFormSheetRoute(builder: (context) => SubDetail()) // Wide screen: Form Sheet
          : CupertinoSheetRoute(builder: (context) => SubDetail()), // Small screen: Bottom Sheet
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
