import 'package:flutter/cupertino.dart';
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
      minimum: const EdgeInsets.symmetric(vertical: 60),
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
    this.maintainState = true,
    super.key,
    super.name,
    super.arguments,
  });

  /// The content to be shown in the [Route] created by this page.
  final Widget child;

  /// {@macro flutter.widgets.modalRoute.maintainState}
  final bool maintainState;

  @override
  Route<T> createRoute(BuildContext context) {
    return _PageBasedCupertinoSheetRoute<T>(page: this);
  }
}

class _PageBasedCupertinoSheetRoute<T> extends CupertinoFloatingSheetRoute<T> {
  _PageBasedCupertinoSheetRoute({
    required CupertinoFormSheetPage<T> page,
    super.stops,
    super.initialStop,
    super.backgroundColor,
    super.maintainState,
  }) : super(
          settings: page,
          builder: (BuildContext context) {
            return _CupertinoSheetDecorationBuilder(
              backgroundColor: backgroundColor,
              topRadius: Radius.circular(10.0),
              child: (ModalRoute.of(context)!.settings
                      as CupertinoFormSheetPage<T>)
                  .child,
            );
          },
        );

  CupertinoFormSheetPage<T> get _page => settings as CupertinoFormSheetPage<T>;

  @override
  bool get maintainState => _page.maintainState;

  @override
  String get debugLabel => '${super.debugLabel}(${_page.name})';
}

class _CupertinoSheetDecorationBuilder extends StatelessWidget {
  const _CupertinoSheetDecorationBuilder({
    required this.child,
    required this.topRadius,
    this.backgroundColor,
  });

  /// The child contained by the modal sheet
  final Widget child;

  /// The color to paint behind the child
  final Color? backgroundColor;

  /// The top corners of this modal sheet are rounded by this Radius
  final Radius topRadius;

  @override
  Widget build(BuildContext context) {
    return CupertinoUserInterfaceLevel(
      data: CupertinoUserInterfaceLevelData.elevated,
      child: Builder(
        builder: (BuildContext context) {
          return Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: topRadius),
              color: backgroundColor ??
                  CupertinoColors.systemBackground.resolveFrom(context),
            ),
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: child,
            ),
          );
        },
      ),
    );
  }
}
