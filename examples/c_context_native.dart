// Source: https://pub.dev/packages/super_context_menu

import 'package:flutter/cupertino.dart';
import 'package:super_context_menu/super_context_menu.dart';

void main() => runApp(const CupertinoApp(
      home: ContextMenuExample(),
      theme: CupertinoThemeData(brightness: Brightness.light),
    ));

class ContextMenuExample extends StatefulWidget {
  const ContextMenuExample({super.key});

  @override
  State<ContextMenuExample> createState() => _ContextMenuExampleState();
}

class _ContextMenuExampleState extends State<ContextMenuExample> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: ContextMenuWidget(
          // force to use dark brightness
          // mobileMenuWidgetBuilder: DefaultMobileMenuWidgetBuilder(brightness: Brightness.dark),
          child: Text('Base Context Menu'),
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
      ),
    );
  }
}
