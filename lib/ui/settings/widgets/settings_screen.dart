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
      child: CupertinoFormSection(
        children: [
          CupertinoFormRow(
            prefix: Text("Mock Mode"),
            child: CupertinoSwitch(
              value: false,
              onChanged: (value) {
                // TODO
              },
            )
          )
        ],
      ),
    );
  }
}
