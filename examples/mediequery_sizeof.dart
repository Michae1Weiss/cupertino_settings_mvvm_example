import 'package:flutter/cupertino.dart';
import 'package:sheet/route.dart';

import 'cupertino_form_sheet.dart';

void main() {
  return runApp(CupertinoApp(
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
    Size size = MediaQuery.sizeOf(context);
    widget.couter += 1;
    return CupertinoPageScaffold(
      child: Center(
        child: Column(
          children: [
            Text('Counter: ${widget.couter}'),
            CupertinoButton(
              child: Text('Open a Sheet'),
              onPressed: () => size.width > 650 ? _openFormSheet(context) : _openSheet(context),
            ),
          ],
        ),
      ),
    );
  }

  void _openSheet(context) {
    Navigator.of(context).push(
      CupertinoSheetRoute(
        builder: (context) => Child(),
      ),
    );
  }

  void _openFormSheet(context) {
    Navigator.of(context).push(
      CupertinoFormSheetRoute(
        builder: (context) => Child(),
      ),
    );
  }
}

class Child extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: CupertinoTextField(
          placeholder: 'Name',
        ),
      ),
    );
  }
}
