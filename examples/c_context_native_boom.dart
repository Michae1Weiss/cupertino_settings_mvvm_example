import 'package:flutter/cupertino.dart';
import 'package:super_context_menu/super_context_menu.dart';

var longText = '''
Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.''';

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
                  deferredPreviewBuilder: (context, child, cancellationToken) {
                    return DeferredMenuPreview(
                      Size(350, 400),
                      Future.delayed(
                        const Duration(seconds: 1),
                        () {
                          return CupertinoPopupWithMessage(
                            message: longText,
                            title: 'M',
                          );
                        },
                      ),
                    );
                  },
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

class CupertinoPopupWithMessage extends StatelessWidget {
  final String message;
  final String title;

  CupertinoPopupWithMessage({
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPopupSurface(
      isSurfacePainted: true,
      child: CupertinoScrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitle(context),
                const SizedBox(height: 12),
                _buildMessage(context),
                const SizedBox(height: 16),
                _buildCloseButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      title,
      style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
  }

  Widget _buildMessage(BuildContext context) {
    return Text(
      message,
      style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontSize: 16),
      softWrap: true,
      textAlign: TextAlign.start,
    );
  }

  Widget _buildCloseButton(BuildContext context) {
    return CupertinoButton(
      color: CupertinoColors.systemBlue,
      onPressed: () => Navigator.pop(context),
      child: Text(
        'Close', // Assumes you have a localization key for 'close'
        style: TextStyle(color: CupertinoColors.white),
      ),
    );
  }
}
