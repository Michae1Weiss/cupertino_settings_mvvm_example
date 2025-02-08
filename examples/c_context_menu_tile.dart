// Source: https://github.com/flutter/flutter/issues/122951

import 'package:flutter/cupertino.dart';

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
        child: CupertinoContextMenu(
          actions: <Widget>[
            CupertinoContextMenuAction(
              onPressed: () {
                Navigator.pop(context);
              },
              isDefaultAction: true,
              trailingIcon: CupertinoIcons.doc_on_clipboard_fill,
              child: const Text('Copy'),
            ),
            CupertinoContextMenuAction(
              onPressed: () {
                Navigator.pop(context);
              },
              trailingIcon: CupertinoIcons.share,
              child: const Text('Share'),
            ),
            CupertinoContextMenuAction(
              onPressed: () {
                Navigator.pop(context);
              },
              trailingIcon: CupertinoIcons.heart,
              child: const Text('Favorite'),
            ),
            CupertinoContextMenuAction(
              onPressed: () {
                Navigator.pop(context);
              },
              isDestructiveAction: true,
              trailingIcon: CupertinoIcons.delete,
              child: const Text('Delete'),
            ),
          ],
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: const CupertinoListTile(
              backgroundColor: CupertinoColors.white,
              title: Text(
                'Title',
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text(
                'Subtitle',
                style: TextStyle(fontSize: 16),
              ),
              trailing: CupertinoListTileChevron(),
            ),
          ),
        ),
      ),
    );
  }
}
