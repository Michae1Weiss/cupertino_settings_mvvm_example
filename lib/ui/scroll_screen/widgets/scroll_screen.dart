// Some examples
// 1. https://github.com/mathewthe2/immersion_reader/blob/7b12aa3c2c5635743797d7de0fab2a976dd272d2/lib/widgets/browser/bookmarks_sheet.dart#L48
// 2. https://github.com/simonkimi/CatWeb/blob/33f82313d76fe15b952256c709dafe57547211ff/lib/ui/pages/setting_page/setting_page.dart#L17
// 3. https://github.com/Arata1202/FlutterBlogApp/blob/c369235d78b0d35baaa582c5efc62dc1959377a2/lib/app/menu/index.dart#L56
// 4. https://github.com/andychucs/conning_tower/blob/2d5139d48a4a8f679283c4fb122250f810f178aa/lib/pages/log_viewer.dart#L81

import 'package:flutter/cupertino.dart';

class ScrollScreen extends StatelessWidget {
  const ScrollScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> elements = List.generate(20, (index) {
      return CupertinoListTile(
        title: Text("title ${index.toString()}"),
        subtitle: Text("subtitle"),
        leading: Text((index * 10).toString()),
        trailing: Text("trailing"),
        additionalInfo: Text("additional info"),
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
                child: ListView(
                  children: [
                    CupertinoListSection.insetGrouped(
                      children: elements,
                    )
                  ],
                ),
              ),
            ),
            bottomAppBar(context),
          ],
        ),
      ),
    );
  }

  Widget buildInsetGroupedTile(
      {required BuildContext context, required int index}) {
    const EdgeInsets tileMargin =
        EdgeInsets.symmetric(horizontal: 16, vertical: 4);

    final BorderRadius borderRadius = BorderRadius.circular(10);
    final Color tileBackgroundColor =
        CupertinoColors.secondarySystemGroupedBackground;
    final Color separatorColor = CupertinoColors.separator;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (index == 0) // Add a header for the first section
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                "Section Header",
                style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
              ),
            ),
          DecoratedBox(
            decoration: BoxDecoration(
              color: tileBackgroundColor,
              borderRadius: borderRadius,
            ),
            child: CupertinoListTile(
              title: Text("Item $index"),
              subtitle: const Text("Subtitle"),
              leading: const Icon(CupertinoIcons.circle),
              trailing: const Icon(CupertinoIcons.chevron_forward),
            ),
          ),
          // Add a divider unless it's the last item
          if (index < 19) // Replace 19 with the last item's index
            Container(
              height: 1,
              color: separatorColor,
              margin: tileMargin,
            ),
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
