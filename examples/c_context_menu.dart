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
        child: CupertinoContextMenu(
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
          child: Image.network(
              "https://images.unsplash.com/photo-1480044965905-02098d419e96?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"),
        ),
      ),
    );
  }
}
