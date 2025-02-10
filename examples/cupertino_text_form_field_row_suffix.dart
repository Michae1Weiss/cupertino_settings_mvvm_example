import 'package:flutter/cupertino.dart';

void main() {
  runApp(
    CupertinoApp(
      home: Home(),
      theme: CupertinoThemeData(brightness: Brightness.light),
    ),
  );
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: CupertinoTextFormFieldRow(
                  prefix: Text('Name'),
                  placeholder: 'Required',
                ),
              ),
              SizedBox(
                width: 50.0,
                child: CupertinoListTile(
                  title: Icon(
                    CupertinoIcons.add,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
