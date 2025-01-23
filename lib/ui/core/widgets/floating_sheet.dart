import 'package:flutter/material.dart';
import 'package:sheet/route.dart';
import 'package:sheet/sheet.dart';

class FloatingModal extends StatelessWidget {
  const FloatingModal({super.key, required this.child, this.backgroundColor});
  final Widget child;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    // DisplayFeatureSubScreen allows to display the modal in just
    // one sub-screen of a foldable device.
    return DisplayFeatureSubScreen(
      anchorPoint: Offset.infinite,
      child: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 147),
        child: Material(
          color: backgroundColor,
          clipBehavior: Clip.antiAlias,
          // See: https://github.com/jamesblasco/modal_bottom_sheet/blob/a87f82b4872042ca0ff2f5d5ab75c432532b94b5/sheet/lib/src/route/cupertino/sheet_route.dart#L20
          borderRadius: BorderRadius.circular(10.0),
          child: child,
        ),
      ),
    );
  }
}

class FloatingSheetRoute<T> extends SheetRoute<T> {
  FloatingSheetRoute({
    required WidgetBuilder builder,
  }) : super(
          builder: (BuildContext context) {
            return FloatingModal(
              child: Builder(builder: builder),
            );
          },
          // See: https://github.com/jamesblasco/modal_bottom_sheet/blob/a87f82b4872042ca0ff2f5d5ab75c432532b94b5/sheet/lib/src/route/cupertino/sheet_route.dart#L39
          animationCurve: Curves.easeOutExpo,
          fit: SheetFit.loose,
        );
}
