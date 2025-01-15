import 'package:cupertino_settings_mvvm_example/data/repositories/fruit_repository.dart';
import 'package:cupertino_settings_mvvm_example/data/repositories/settings_repository.dart';
import 'package:cupertino_settings_mvvm_example/data/services/mock_api_service.dart';
import 'package:cupertino_settings_mvvm_example/data/services/real_api_service.dart';
import 'package:flutter/cupertino.dart';

import 'package:cupertino_settings_mvvm_example/routing/router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      // --- services ---
      Provider(create: (context) => MockApiService(),),
      Provider(create: (context) => RealApiService(),),
      // --- repositories ---
      Provider(create: (context) => SettingsRepository(),),
      Provider(create: (context) => FruitRepository(apiService: RealApiService()),)
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp.router(
      theme: CupertinoThemeData(brightness: Brightness.light),
      routerConfig: router,
    );
  }
}
