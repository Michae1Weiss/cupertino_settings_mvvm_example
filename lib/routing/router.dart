import 'package:cupertino_settings_mvvm_example/ui/home/view_model/home_view_model.dart';
import 'package:cupertino_settings_mvvm_example/ui/home/widgets/home_screen.dart';
import 'package:cupertino_settings_mvvm_example/ui/settings/view_model/settings_view_model.dart';
import 'package:cupertino_settings_mvvm_example/ui/settings/widgets/settings_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        HomeViewModel viewModel = HomeViewModel();
        return HomeScreen(viewModel: viewModel,);
      },
      routes: [
        GoRoute(
          path: '/settings',
          builder: (context, state) {
            SettingsViewModel viewModel =
                SettingsViewModel(settingsRepository: context.read());
            return SettingsScreen(viewModel: viewModel);
          },
        ),
      ],
    ),
  ],
);
