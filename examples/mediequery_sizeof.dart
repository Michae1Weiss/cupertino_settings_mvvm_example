import 'package:flutter/cupertino.dart';

void main() {
  return runApp(CupertinoApp(home: Home(),));
}

class Home extends StatefulWidget{
  @override
  State<Home> createState() => _HomeState();

  int couter = 0;
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    widget.couter += 1;
    return Text('Hello World! Counter value: ${widget.couter}');
  }
}