import 'package:flutter/cupertino.dart';
import 'package:super_context_menu/super_context_menu.dart';

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
                // ---------------------------------------
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
                  child: CupertinoListTile(title: Text('Test Me!')),
                ),
                // ----------------------------------------
                ContextMenuWidget(
                  // force to use dark brightness
                  // mobileMenuWidgetBuilder: DefaultMobileMenuWidgetBuilder(brightness: Brightness.dark),
                  child: CupertinoListTile(
                    title: Text('Test Me (native)!'),
                    backgroundColor: CupertinoColors.secondarySystemGroupedBackground.resolveFrom(context),
                  ),
                  menuProvider: (_) {
                    return Menu(
                      children: [
                        MenuAction(title: 'Menu Item 2', callback: () {}),
                        MenuAction(title: 'Menu Item 3', callback: () {}),
                        MenuSeparator(),
                        Menu(
                          title: 'Submenu',
                          children: [
                            MenuAction(title: 'Submenu Item 1', callback: () {}),
                            MenuAction(title: 'Submenu Item 2', callback: () {}),
                            Menu(
                              title: 'Nested Submenu',
                              children: [
                                MenuAction(title: 'Submenu Item 1', callback: () {}),
                                MenuAction(title: 'Submenu Item 2', callback: () {}),
                              ],
                            ),
                          ],
                        ),
                      ],
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
