import 'package:flutter/cupertino.dart';
import 'package:pull_down_button/pull_down_button.dart';

void main() {
  runApp(CupertinoApp(home: App()));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Center(
          child: Column(
            children: [CupertinoButton(onPressed: () => _open(context), child: Text('Click Me!'))],
          ),
        ),
      ),
    );
  }

  void _open(context) {
    var pullDownMenu = PullDownMenu(
      items: [
        PullDownMenuItem(
          title: 'Menu item',
          onTap: () {},
        ),
        const PullDownMenuDivider(),
        PullDownMenuItem(
          title: 'Menu item 2',
          onTap: () {},
        ),
      ],
    );
  }
}
