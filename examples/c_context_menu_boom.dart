import 'package:flutter/cupertino.dart';

void main() {
  final app = CupertinoApp(home: CupertinoMenuExample());
  runApp(app);
}

class CupertinoMenuExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Column(
          children: [
            CupertinoListSection.insetGrouped(
              children: [
                CupertinoListTile(title: Text('Name')),
                CupertinoListTile(title: Text('Age')),
                CupertinoContextMenu(
                  actions: [
                    CupertinoContextMenuAction(
                      trailingIcon: CupertinoIcons.share,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Share"),
                    ),
                    CupertinoContextMenuAction(
                      trailingIcon: CupertinoIcons.delete,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Delete"),
                    ),
                  ],
                  child: SizedBox(
                    width: double.infinity, // Ensure proper width constraint
                    child: CupertinoListTile(title: Text('Expandable')),
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
