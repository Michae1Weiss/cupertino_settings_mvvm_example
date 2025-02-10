import 'package:flutter/cupertino.dart';

void main() {
  runApp(
    CupertinoApp(
      home: Home(),
      theme: CupertinoThemeData(brightness: Brightness.light),
    ),
  );
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Example'),
      ),
      child: SafeArea(
        child: CupertinoFormSection.insetGrouped(
          header: Text('Example Form Field Row With Suffix'),
          children: [
            // CupertinoTextFormFieldRow(),
            Row(
              children: [
                Expanded(
                  child: CupertinoTextFormFieldRow(
                    prefix: Text('Name'),
                    placeholder: 'Required',
                  ),
                ),
                // if (false)
                LimitedBox(
                  // width: 50.0,
                  // fit: BoxFit.cover,
                  maxWidth: 34,

                  child: CupertinoListTile(
                    padding: EdgeInsets.zero,
                    title: Icon(
                      CupertinoIcons.add,
                      // size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
