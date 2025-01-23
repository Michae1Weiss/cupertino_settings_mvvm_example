import 'package:flutter/cupertino.dart';

class CupertinoExampleForm extends StatelessWidget {
  const CupertinoExampleForm({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Example"),
      ),
      child: SafeArea(
        child: CupertinoFormSection.insetGrouped(
          header: Text("Section"),
          children: [
            CupertinoFormRow(
              prefix: Text("Disabled Switch"),
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
