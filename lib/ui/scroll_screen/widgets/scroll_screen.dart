import 'package:flutter/cupertino.dart';

class ScrollScreen extends StatelessWidget {
  const ScrollScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> elements = List.generate(20, (index) {
      return CupertinoListTile(
        title: Text(index.toString()),
        leading: Text("test"),
      );
    });

    return CupertinoPageScaffold(
      // Ref: https://stackoverflow.com/questions/52472220/child-widget-of-cupertinopagescaffold-is-behind-cupertinonavigationbar
      navigationBar: CupertinoNavigationBar(
        middle: Placeholder(),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: CupertinoScrollbar(
                /*
                child: CupertinoListSection(
                  header: Text("Elements"),
                  children: elements,
                ),
                */
                child: ListView.builder(
                  itemCount: 120,
                  itemBuilder: (BuildContext context, int index) {
                    /*
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Item $index'),
                      ),
                    );
                    */
                    return CupertinoListTile(
                      title: Text("title ${index.toString()}"),
                      subtitle: Text("subtitle"),
                      leading: Text("leading"),
                      trailing: Text("trailing"),
                      additionalInfo: Text("additional info"),
                    );
                  },
                ),
              ),
            ),
            bottomAppBar(context),
          ],
        ),
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
