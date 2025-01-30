

import 'package:flutter/cupertino.dart';

void main() {
  return runApp(CupertinoApp(home: Home(),));
}

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Text("Hello World!");
  }
}