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
                LayoutBuilder(
                  builder: (context, constraints) {
                    return CupertinoContextMenu(
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
                      child: Container(
                        width: constraints.maxWidth, // Match original tile width

                        child: CupertinoListTile(
                          backgroundColor: CupertinoColors.secondarySystemGroupedBackground.resolveFrom(context),
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                          title: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              "name",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          subtitle: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              "formatted date",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          trailing: CupertinoListTileChevron(),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
