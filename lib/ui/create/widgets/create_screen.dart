import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class CreateScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Placeholder(),
        trailing: CupertinoAddButton(),
        //trailing: CupertinoButton(
        //  padding: EdgeInsets.zero, // Add appropriate padding
        //  child: Icon(CupertinoIcons.gobackward),
        //  onPressed: () {
        //    // TODO
        //  },
        //),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Placeholder(),
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
            onPressed: () {
              context.go('/create/new');
            },
            minSize: 0,
            child: Icon(
              CupertinoIcons.add,
              size: 25,
            ),
          ),
          /*
          CupertinoButton(
            onPressed: () {},
            minSize: 0,
            child: Icon(CupertinoIcons.heart, size: 25),
          ),
          */
          CupertinoButton(
            onPressed: () {},
            minSize: 0,
            child: Icon(
              CupertinoIcons.qrcode,
              size: 25
            ),
          )
        ],
      ),
    );
  }

}

class CupertinoAddButton extends StatelessWidget {
  const CupertinoAddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {},
      minSize: 0,
      child: Icon(
        CupertinoIcons.add,
        color: CupertinoTheme.of(context).primaryColor,
        size: 25,
      ),
    );
  }
}