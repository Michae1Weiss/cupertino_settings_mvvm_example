import 'package:cupertino_settings_mvvm_example/ui/settings/view_model/settings_view_model.dart';
import 'package:flutter/cupertino.dart';

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
            child: CupertinoFormSection(
              children: [
                CupertinoFormRow(
                  prefix: Text("Mock Mode"),
                  child: CupertinoSwitch(
                    value: viewModel.flag,
                    onChanged: (value) async {
                      await viewModel.toggleUseMockApiFlag();
                    },
                  )
                )
              ],
            ),
          );
        }
      ),
    );
  }
}
