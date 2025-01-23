import 'package:cupertino_settings_mvvm_example/ui/settings/view_model/settings_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key, required this.viewModel});

  final SettingsViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Settings"),
      ),
      child: ListenableBuilder(
        listenable: viewModel,
        builder: (context, _) {
          return SafeArea(
            child: CupertinoFormSection.insetGrouped(
              header: Text("General"),
              children: [
                CupertinoFormRow(
                  prefix: Text("Mock Mode"),
                  child: CupertinoSwitch(
                    value: viewModel.useMockApi,
                    onChanged: (value) async {
                      await viewModel.toggleUseMockApiFlag();
                    },
                  ),
                ),
                CupertinoFormRow(
                  prefix: Text("Use Dark Theme"),
                  child: CupertinoSwitch(
                    value: viewModel.useDarkTheme,
                    onChanged: (value) async {
                      await viewModel.toggleUseDarkTheme();
                    },
                  ),
                ),
                CupertinoFormRow(
                  prefix: Text("Advanced Settings"),
                  child: CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Icon(
                      CupertinoIcons.chevron_forward,
                      size: 25.0,
                    ),
                    onPressed: () {
                      context.go('/settings/advanced');
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  color: CupertinoTheme.brightnessOf(context) == Brightness.dark
                      ? CupertinoColors.inactiveGray
                      : CupertinoColors.black,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
