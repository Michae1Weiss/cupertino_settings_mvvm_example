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
        child: CupertinoFormSection(
          children: [
            CupertinoFormRow(
              prefix: Text("Advanced Switch"),
              child: CupertinoSwitch(
                value: false, 
                onChanged: (value) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}