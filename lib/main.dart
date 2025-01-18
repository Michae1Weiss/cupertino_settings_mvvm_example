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
      ChangeNotifierProvider<SettingsRepository>(
        create: (context) => SettingsRepository(),
        //lazy: false,
      ),
      ProxyProvider<SettingsRepository, FruitRepository>(
        update: (context, settingsRepository, _) {
          if (settingsRepository.useMockApiFlag) {
            return FruitRepository(apiService: context.read<MockApiService>());
          } else {
            return FruitRepository(apiService: context.read<RealApiService>());
          }
        },
        //lazy: false,
      )
      // Provider(create: (context) => FruitRepository(apiService: context.watch()),)
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    var settings = context.watch<SettingsRepository>();
    var brightness = settings.useDarkTheme ? Brightness.dark : Brightness.light;
    return CupertinoApp.router(
      theme: CupertinoThemeData(brightness: brightness),
      routerConfig: router,
    );
  }
}
