import 'package:flutter/cupertino.dart';

class ScrollScreen extends StatelessWidget {
  const ScrollScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Placeholder(),
      ),
      child: SafeArea(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
