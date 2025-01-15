import 'package:cupertino_settings_mvvm_example/ui/home/view_model/home_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.viewModel});

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, _) {
        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            leading: CupertinoButton(
              child: Icon(CupertinoIcons.settings),
              onPressed: () {
                context.go('/settings');
              },
            ),
            middle: Text("Fruit Deluxe"),
          ),
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
        );
      }
    );
  }
}
