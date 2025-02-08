import 'package:flutter/material.dart';
import 'package:super_context_menu/super_context_menu.dart';

void main() async {
  runApp(const MainApp());
}

class Item extends StatelessWidget {
  const Item({
    super.key,
    this.color = Colors.blue,
    required this.child,
    this.padding = const EdgeInsets.all(14),
  });

  final EdgeInsets padding;
  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: DefaultTextStyle(
        style: const TextStyle(color: Colors.white),
        child: child,
      ),
    );
  }
}

class _PageLayout extends StatelessWidget {
  const _PageLayout({
    required this.itemZone,
  });

  final Widget itemZone;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Flex(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          // textDirection: TextDirection.rtl,
          direction: constraints.maxWidth > constraints.maxHeight ? Axis.horizontal : Axis.vertical,
          children: [
            Expanded(
              flex: 5,
              child: itemZone,
            ),
          ],
        ),
      );
    });
  }
}

class Section extends StatelessWidget {
  const Section({
    super.key,
    required this.description,
    required this.child,
  });

  final Widget description;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: child,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0).copyWith(top: 0),
            child: description,
          ),
        ],
      ),
    );
  }
}

class _BaseContextMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContextMenuWidget(
      child: const Item(
        child: Text('Base Context Menu'),
      ),
      menuProvider: (_) {
        return Menu(
          children: [
            MenuAction(title: 'Menu Item 1', callback: () {}),
            MenuAction(title: 'Menu Item 2', callback: () {}),
            MenuAction(title: 'Menu Item 3', callback: () {}),
            MenuSeparator(),
            Menu(title: 'Submenu', children: [
              MenuAction(title: 'Submenu Item 1', callback: () {}),
              MenuAction(title: 'Submenu Item 2', callback: () {}),
              Menu(title: 'Nested Submenu', children: [
                MenuAction(title: 'Submenu Item 1', callback: () {}),
                MenuAction(title: 'Submenu Item 2', callback: () {}),
              ]),
            ]),
          ],
        );
      },
    );
  }
}

class _Separator extends StatelessWidget {
  const _Separator();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 16);
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: _PageLayout(
            itemZone: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Section(
                    description: const Text('Base context menu, without drag & drop.'),
                    child: _BaseContextMenu(),
                  ),
                ].intersperse(const _Separator()).toList(growable: false),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

extension IntersperseExtensions<T> on Iterable<T> {
  Iterable<T> intersperse(T element) sync* {
    final iterator = this.iterator;
    if (iterator.moveNext()) {
      yield iterator.current;
      while (iterator.moveNext()) {
        yield element;
        yield iterator.current;
      }
    }
  }
}
