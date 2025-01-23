import 'package:flutter/cupertino.dart';

class AdvancedSettingsScreen extends StatelessWidget {
  const AdvancedSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Advanced"),
      ),
      child: SafeArea(
        child: CupertinoFormSection.insetGrouped(
          header: Text("Experimental"),
          children: [
            CupertinoFormRow(
              prefix: Text("Advanced Switch"),
              child: CupertinoSwitch(
                value: false,
                onChanged: null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
