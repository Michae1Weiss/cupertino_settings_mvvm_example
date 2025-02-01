/*

Hello. I am developing a flutter app only with cupertino.dart.
The app is implemented with MVVM.
I have implemented a view with a form with two CupertinoTextFormFieldRows.
The first text fiels is intended for customer name.
The second text field is intended for prices.
The customer field is fully implemented.
**The price field implementation is not ready yet and I need your help with it.**
Now, consider the list:
```dart
final List testList = [("John",1),("Max",2),("Alex",3),("Anna",4),("Philipp",5),("Bob",null),("Carl",null)];
```
Most of the time user will tip the new price but he want have a feature to see the last prises for the specific customer. 
Now I want some beautiful and user-friendly and clean implementation for price suggestions in the price text field.
There can be price suggestions but not always.
I have thought about `pull_down_button` package
Example usage:
```dart
PullDownButton(
  itemBuilder: (context) => [
    PullDownMenuItem(
      title: 'Menu item',
      onTap: () {},
    ),
    const PullDownMenuDivider(),
    PullDownMenuItem(
      title: 'Menu item 2',
      onTap: () {},
    ),
  ],
  buttonBuilder: (context, showMenu) => CupertinoButton(
    onPressed: showMenu,
    padding: EdgeInsets.zero,
    child: const Icon(CupertinoIcons.ellipsis_circle),
  ),
);
```

You are free to suggest some solutions for me.
Please think about Human Interface Ideas and that the app is for iPad and the input field will be inside a FormSheet.
I want you to impelent a minimalistic flutter app that demonstrates your best ideas.
*/

import 'package:flutter/cupertino.dart';
import 'package:pull_down_button/pull_down_button.dart';

void main() {
  runApp(const MyApp());
}

/// The top‑level Cupertino app.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Price Suggestion Demo',
      home: HomePage(),
    );
  }
}

/// A simple home page with a button that opens the form sheet.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Customer Form'),
      ),
      child: Center(
        child: CupertinoButton.filled(
          child: const Text('Open Form'),
          onPressed: () {
            // Display the form sheet as a modal popup.
            showCupertinoModalPopup(
              context: context,
              builder: (context) => const FormSheet(),
            );
          },
        ),
      ),
    );
  }
}

/// A simple model holding a customer’s name and a (possibly null) price.
class CustomerPrice {
  final String name;
  final int? price;
  CustomerPrice(this.name, this.price);
}

/// Sample data; in a real MVVM app, this might come from a repository.
final List<CustomerPrice> testList = [
  CustomerPrice("John", 1),
  CustomerPrice("Max", 2),
  CustomerPrice("Alex", 3),
  CustomerPrice("Anna", 4),
  CustomerPrice("Philipp", 5),
  CustomerPrice("Bob", null),
  CustomerPrice("Carl", null),
];

/// A simple view-model that manages text editing controllers and suggestion filtering.
class FormViewModel extends ChangeNotifier {
  final TextEditingController customerController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  /// Returns a list of past prices for the customer (if any).
  List<int> getPriceSuggestions() {
    final customerName = customerController.text.trim().toLowerCase();
    if (customerName.isEmpty) return [];
    return testList
        .where((cp) => cp.name.toLowerCase() == customerName && cp.price != null)
        .map((cp) => cp.price!)
        .toSet() // Remove duplicates.
        .toList();
  }

  @override
  void dispose() {
    customerController.dispose();
    priceController.dispose();
    super.dispose();
  }
}

/// The form sheet is displayed as a centered modal popup.
class FormSheet extends StatefulWidget {
  const FormSheet({super.key});

  @override
  State<FormSheet> createState() => _FormSheetState();
}

class _FormSheetState extends State<FormSheet> {
  late final FormViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = FormViewModel();
    // Listen for changes in the customer name so we can update suggestions.
    _viewModel.customerController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final suggestions = _viewModel.getPriceSuggestions();

    // A centered container to mimic a form sheet for iPad.
    return CupertinoPopupSurface(
      isSurfacePainted: true,
      child: Container(
        width: 400,
        padding: const EdgeInsets.all(20),
        child: CupertinoFormSection.insetGrouped(
          header: const Text('Customer Information'),
          children: [
            // Customer field using CupertinoTextFormFieldRow.
            CupertinoTextFormFieldRow(
              prefix: const Text('Customer'),
              placeholder: 'Enter name',
              controller: _viewModel.customerController,
            ),
            // Price field using a CupertinoFormRow and a CupertinoTextField that supports a suffix.
            CupertinoFormRow(
              prefix: const Text('Price'),
              child: CupertinoTextField.borderless(
                controller: _viewModel.priceController,
                placeholder: 'Enter new price',
                // Only show the pull‑down button if there are suggestions.
                suffixMode: OverlayVisibilityMode.always,
                suffix: suggestions.isNotEmpty
                    ? SizedBox(
                        height: 34, // Constrains button height to fit within the row
                        child: PullDownButton(
                          itemBuilder: (context) {
                            return suggestions
                                .map(
                                  (price) => PullDownMenuItem(
                                    title: price.toString(),
                                    onTap: () {
                                      _viewModel.priceController.text = price.toString();
                                    },
                                  ),
                                )
                                .toList();
                          },
                          buttonBuilder: (context, showMenu) => CupertinoButton(
                            onPressed: showMenu,
                            padding: EdgeInsets.zero,
                            child: const Icon(CupertinoIcons.search, size: 20), // Reduce icon size if necessary
                          ),
                        ),
                      )
                    : null,
              ),
            ),
            CupertinoSearchTextField()
          ],
        ),
      ),
    );
  }
}
