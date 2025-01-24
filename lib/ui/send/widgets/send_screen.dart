import 'package:flutter/cupertino.dart';

class SendScreen extends StatelessWidget {
  const SendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          minSize: 0,
          onPressed: null,
          child: Text("Send"),
        ),
        middle: Text("Send"),
      ),
      child: SafeArea(
        child: CupertinoFormSection.insetGrouped(
          margin: EdgeInsets.all(16.0),
          children: [
            CupertinoFormRow(
              child: CupertinoTextField(
                autofillHints: [AutofillHints.username],
                padding: EdgeInsets.only(left: 13, top: 8, bottom: 8, right: 8),
                prefix: Text("Username"),
                placeholder: "Required",
                keyboardType: TextInputType.name,
                decoration: BoxDecoration(),
              ),
            ),
            CupertinoFormRow(
              child: CupertinoTextField(
                autofillHints: [AutofillHints.password],
                padding: EdgeInsets.only(left: 16, top: 8, bottom: 8, right: 8),
                prefix: Text("Password"),
                placeholder: "Required",
                obscureText: true,
                decoration: BoxDecoration(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}