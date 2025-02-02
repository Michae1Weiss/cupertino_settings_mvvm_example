import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(
    CupertinoApp(
      home: App(),
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
    ),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Center(
          child: Column(
            children: [
              CupertinoButton(
                onPressed: () => _open(context),
                child: Text('Open a CupertinoPageRoute'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _open(context) {
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (context) => Child(),
      ),
    );
  }
}

class Child extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Child'),
        trailing: CupertinoNavigationBarBackButton(),
      ),
      child: SafeArea(
        child: Placeholder(),
      ),
    );
  }
}
