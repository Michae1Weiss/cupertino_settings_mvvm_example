import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:sheet/route.dart';

var router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (_, __) => CupertinoExtendedPage(child: Home()),
      routes: [
        GoRoute(
          path: 'detail',
          pageBuilder: (_, __) => CupertinoSheetPage(child: Detail()),
        ),
      ],
    )
  ],
);

void main() {
  final app = CupertinoApp.router(
    routerConfig: router,
    theme: CupertinoThemeData(brightness: Brightness.light),
    localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: [
      Locale('de'), // German
      Locale('en'), // English
    ],
    locale: Locale('de'),
  );
  runApp(app);
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: CupertinoButton(
          onPressed: () => context.go('./detail'),
          child: Text('Open Sheet'),
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
      child: Center(
        child: Text('Detail'),
      ),
    );
  }
}
