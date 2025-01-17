import 'package:cupertino_settings_mvvm_example/ui/home/view_model/home_view_model.dart';
import 'package:cupertino_settings_mvvm_example/ui/home/widgets/home_screen.dart';
import 'package:cupertino_settings_mvvm_example/ui/settings/view_model/settings_view_model.dart';
import 'package:cupertino_settings_mvvm_example/ui/settings/widgets/settings_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sheet/route.dart';

GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) {
        HomeViewModel viewModel = HomeViewModel(fruitRepository: context.watch());
        return CupertinoExtendedPage(
          child: HomeScreen(viewModel: viewModel,)
        );
      },
      routes: [
        GoRoute(
          path: '/settings',
          pageBuilder: (context, state) {
            var viewModel = SettingsViewModel(settingsRepository: context.read());
            return CupertinoSheetPage<void>(
              key: state.pageKey,
              name: "Haha",
              child: SettingsScreen(viewModel: viewModel)
            );
          },
        ),
      ],
    ),
  ],
);
