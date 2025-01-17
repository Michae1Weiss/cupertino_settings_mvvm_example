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
            ],
          ),
        );
      }
    );
  }
}
