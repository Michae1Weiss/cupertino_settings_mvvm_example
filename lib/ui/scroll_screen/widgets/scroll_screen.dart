import 'package:flutter/cupertino.dart';

class ScrollScreen extends StatelessWidget {
  const ScrollScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Placeholder(),
      ),
      child: Column(
        children: [
          Expanded(
            child: CustomScrollView(),
          ),
          bottomAppBar(context),
        ],
      ),
    );
  }

  Widget bottomAppBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 0.5,
            color: CupertinoColors.separator.resolveFrom(context),
          ),
        ),
        color: CupertinoTheme.of(context).barBackgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CupertinoButton(
            onPressed: null,
            minSize: 0,
            child: Icon(
              CupertinoIcons.chevron_up,
              size: 25,
            ),
          ),
          CupertinoButton(
            onPressed: null,
            minSize: 0,
            child: Icon(CupertinoIcons.pause_fill, size: 25),
          )
        ],
      ),
    );
  }
}
