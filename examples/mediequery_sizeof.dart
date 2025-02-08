import 'package:flutter/cupertino.dart';
import 'package:sheet/route.dart' as sheet;

import 'cupertino_form_sheet.dart';

void main() {
  return runApp(CupertinoApp(
    theme: CupertinoThemeData(brightness: Brightness.light),
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();

  int couter = 0;
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.sizeOf(context);
    widget.couter += 1;
    return CupertinoPageScaffold(
      child: Center(
        child: Column(
          children: [
            Text('Counter: ${widget.couter}'),
            CupertinoButton(
              child: Text('Open a Sheet'),
              onPressed: () => _openSheet(context),
            ),
          ],
        ),
      ),
    );
  }

  void _openSheet(context) {
    Size size = MediaQuery.sizeOf(context);

    Navigator.of(context).push(
      size.width > 650
          ? CupertinoFormSheetRoute(
              builder: (context) => Child(),
            )
          : sheet.CupertinoSheetRoute(
              builder: (context) => Child(),
            ),
    );
  }

  // void _openFormSheet(context) {
  //   Navigator.of(context).push(
  //     CupertinoFormSheetRoute(
  //       builder: (context) => Child(),
  //     ),
  //   );
  // }
}

class Child extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Child'),
      ),
      child: SafeArea(
        child: Center(
          child: CupertinoFormSection(
            children: [
              CupertinoTextFormFieldRow(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                placeholder: 'Name',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
