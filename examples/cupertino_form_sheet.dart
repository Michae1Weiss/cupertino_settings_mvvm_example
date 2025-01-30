// See: https://github.com/jamesblasco/modal_bottom_sheet/issues/166
// Also: https://github.com/jamesblasco/modal_bottom_sheet/issues/30

// iPad 11 2420 x 1668 264 ppi
// iPad 13 2752 x 2064 264 ppi

// iPad 11 resolution (device-independent pixel): 1210 x 834
// iPad 11 portrait form sheet size 1006 x 712: height 1006; width 712;
// iPad 11 landscape form sheet size 746 x 712: height 746; width 712;

import 'package:flutter/cupertino.dart';
import 'package:sheet/route.dart';
import 'package:sheet/sheet.dart';

class CupertinoFormSheet extends StatelessWidget {
  const CupertinoFormSheet({super.key, required this.child, this.backgroundColor});
  final Widget child;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.symmetric(vertical: 60),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 712,
          ),
          child: CupertinoPopupSurface(
            isSurfacePainted: true,
            child: Container(
              decoration: BoxDecoration(
                color: backgroundColor ?? CupertinoColors.systemBackground,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}

class CupertinoFormSheetRoute<T> extends SheetRoute<T> {
  CupertinoFormSheetRoute({
    required WidgetBuilder builder,
    super.stops,
    double initialStop = 1,
    super.settings,
    Color? backgroundColor,
    super.maintainState = true,
  }) : super(
          builder: (BuildContext context) {
            return CupertinoFormSheet(
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

class _PageBasedCupertinoSheetRoute<T> extends CupertinoFormSheetRoute<T> {
  _PageBasedCupertinoSheetRoute({
    required CupertinoFormSheetPage<T> page,
    super.stops,
    super.initialStop,
    super.backgroundColor,
    super.maintainState,
  }) : super(
          settings: page,
          builder: (BuildContext context) {
            return _CupertinoFormSheetDecorationBuilder(
              backgroundColor: backgroundColor,
              topRadius: Radius.circular(10.0),
              child: (ModalRoute.of(context)!.settings as CupertinoFormSheetPage<T>).child,
            );
          },
        );

  CupertinoFormSheetPage<T> get _page => settings as CupertinoFormSheetPage<T>;

  @override
  bool get maintainState => _page.maintainState;

  @override
  String get debugLabel => '${super.debugLabel}(${_page.name})';
}

class _CupertinoFormSheetDecorationBuilder extends StatelessWidget {
  const _CupertinoFormSheetDecorationBuilder({
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
              color: backgroundColor ?? CupertinoColors.systemBackground.resolveFrom(context),
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
