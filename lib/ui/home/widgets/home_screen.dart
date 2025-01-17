import 'package:cupertino_settings_mvvm_example/ui/home/view_model/home_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.viewModel});

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, _) {
        return CupertinoPageScaffold(
          child: CustomScrollView(
            slivers: [
              CupertinoSliverNavigationBar(
                //leading: Icon(CupertinoIcons.settings),
                leading: CupertinoButton(
                  padding: EdgeInsets.zero,
                  minSize: 0,
                  child: Icon(CupertinoIcons.settings, size: 25,),
                  onPressed: () {
                    context.go('/settings');
                  },
                ),
                largeTitle: Text("Fruit Deluxe"),
                trailing: CupertinoButton(
                  padding: EdgeInsets.zero,
                  minSize: 0,
                  child: Icon(CupertinoIcons.plus, size: 25,),
                  onPressed: () {
                    // ...
                    context.go('/create');
                  }
                ),
              ),
              // This widget fills the remaining space in the viewport.
              // Drag the scrollable area to collapse the CupertinoSliverNavigationBar.
              SliverFillRemaining(
                child: Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: Builder(
                          builder: (context) {
                            if (viewModel.fruit != null) {
                              String fruitName = viewModel.fruit!.name;
                              return Text("Hey, $fruitName!");
                            }
                            if (viewModel.error != null) {
                              String error = viewModel.error!;
                              return Text("Error: $error");
                            }
                            return Text("Huh? Poor writen app! Contact support!");
                          }
                        ),
                      ),
                    ),
                    bottomAppBar(context),
                  ],
                ),
              ),
            ],
          ),
        );
      }
    );
  }

  Widget bottomAppBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 0.5,
            color: CupertinoColors.separator.resolveFrom(context),
          ),
        ),
        color: CupertinoTheme.of(context).barBackgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CupertinoButton(
            onPressed: () {},
            minSize: 0,
            child: Icon(
              CupertinoIcons.arrow_clockwise,
              size: 25,
            ),
          ),
          /*
          CupertinoButton(
            onPressed: () {},
            minSize: 0,
            child: Icon(CupertinoIcons.heart, size: 25),
          ),
          */
          CupertinoButton(
            onPressed: () {
              context.go('/send');
            },
            minSize: 0,
            child: Icon(
              CupertinoIcons.paperplane,
              size: 25
            ),
          )
        ],
      ),
    );
  }
}
