import 'package:flutter/cupertino.dart';

import 'package:cupertino_settings_mvvm_example/routing/router.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp.router(
      routerConfig: router,
    );
  }
}
