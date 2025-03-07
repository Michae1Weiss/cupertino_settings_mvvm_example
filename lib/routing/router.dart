import 'package:cupertino_settings_mvvm_example/ui/create/widgets/create_screen.dart';
import 'package:cupertino_settings_mvvm_example/ui/home/view_model/home_view_model.dart';
import 'package:cupertino_settings_mvvm_example/ui/home/widgets/home_screen.dart';
import 'package:cupertino_settings_mvvm_example/ui/scroll_screen/widgets/scroll_screen.dart';
import 'package:cupertino_settings_mvvm_example/ui/send/widgets/send_screen.dart';
import 'package:cupertino_settings_mvvm_example/ui/settings/view_model/settings_view_model.dart';
import 'package:cupertino_settings_mvvm_example/ui/settings/widgets/settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sheet/route.dart';

import '../ui/core/widgets/floating_sheet.dart';
import '../ui/new_position/widgets/new_position_screen.dart';
import '../ui/settings/widgets/advanced_settings_screen.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final nestedNavigationKey = GlobalKey<NavigatorState>();

GoRouter router = GoRouter(
  initialLocation: '/',
  navigatorKey: rootNavigatorKey,
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) {
        HomeViewModel viewModel =
            HomeViewModel(fruitRepository: context.watch());
        return CupertinoExtendedPage(
          key: state.pageKey,
          child: HomeScreen(
            viewModel: viewModel,
          ),
        );
      },
      routes: [
        ShellRoute(
          navigatorKey: nestedNavigationKey,
          parentNavigatorKey: rootNavigatorKey,
          pageBuilder: (context, state, child) =>
              cupertinoSheetPageBuilder(context, state, child),
          routes: [
            GoRoute(
              path: 'settings',
              parentNavigatorKey: nestedNavigationKey,
              pageBuilder: (context, state) {
                var viewModel =
                    SettingsViewModel(settingsRepository: context.read());
                return CupertinoExtendedPage<void>(
                    key: state.pageKey,
                    child: SettingsScreen(viewModel: viewModel));
              },
              routes: [
                GoRoute(
                  path: 'advanced',
                  parentNavigatorKey: nestedNavigationKey,
                  pageBuilder: (context, state) {
                    return CupertinoExtendedPage(
                      key: state.pageKey,
                      child: AdvancedSettingsScreen(),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          path: 'create', // TODO: rename
          pageBuilder: (context, state) {
            return CupertinoExtendedPage(
              key: state.pageKey,
              child: CreateScreen(),
            );
          },
          routes: [
            GoRoute(
              path: 'new',
              pageBuilder: (context, state) => cupertinoSheetPageBuilder(
                  context, state, NewPositionScreen()),
            ),
          ],
        ),
        GoRoute(
          path: 'scroll', // TODO: rename
          pageBuilder: (context, state) {
            return CupertinoExtendedPage(
              key: state.pageKey,
              child: ScrollScreen(),
            );
          },
        ),
        GoRoute(
          path: 'send',
          pageBuilder: (context, state) =>
              cupertinoSheetPageBuilder(context, state, SendScreen()),
        ),
        GoRoute(
          path: 'form-example',
          pageBuilder: (context, state) =>
              cupertinoSheetPageBuilder(context, state, SendScreen()),
        ),
      ],
    ),
  ],
);

Page cupertinoSheetPageBuilder(
    BuildContext context, GoRouterState state, Widget child) {
  // Redirect based on screen size
  final screenWidth = MediaQuery.of(context).size.width;
  if (screenWidth < 650) {
    return CupertinoSheetPage(
      key: state.pageKey,
      child: child,
    );
  } else {
    return CupertinoFormSheetPage(
      key: state.pageKey,
      child: child,
    );
  }
}
