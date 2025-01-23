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
    return SafeArea(
      minimum: const EdgeInsets.symmetric(vertical: 147),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 650,
          ),
          child: Material(
            color: backgroundColor,
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.circular(10.0),
            child: child,
          ),
        ),
      ),
    );
  }
}

class CupertinoFloatingSheetRoute<T> extends SheetRoute<T> {
  CupertinoFloatingSheetRoute({
    required WidgetBuilder builder,
    super.stops,
    double initialStop = 1,
    super.settings,
    Color? backgroundColor,
    super.maintainState = true,
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

class CupertinoFormSheetPage<T> extends Page<T> {
  /// Creates a material page.
  const CupertinoFormSheetPage({
    required this.child,
    super.key,
  });

  /// The content to be shown in the [Route] created by this page.
  final Widget child;

  @override
  Route<T> createRoute(BuildContext context) {
    return _PageBasedCupertinoSheetRoute<T>(page: this);
  }
}

class _PageBasedCupertinoSheetRoute<T> extends CupertinoFloatingSheetRoute<T> {
  _PageBasedCupertinoSheetRoute({
    required CupertinoFormSheetPage<T> page,
  }) : super(
          settings: page,
          builder: (BuildContext context) {
            return (ModalRoute.of(context)!.settings
                    as CupertinoFormSheetPage<T>)
                .child;
          },
        );
}
