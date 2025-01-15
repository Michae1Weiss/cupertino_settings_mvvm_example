import 'package:cupertino_settings_mvvm_example/data/repositories/fruit_repository.dart';
import 'package:flutter/cupertino.dart';

import '../../../domain/models/fruit.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({required FruitRepository fruitRepository})
    : _fruitRepository = fruitRepository {
      load();
  }

  // --- privat attributes ---
  final FruitRepository _fruitRepository;
  Fruit ?_fruit;
  String ?_error;
  // --- getters ---
  Fruit? get fruit => _fruit;
  String? get error => _error;

  void load() {
    var result = _fruitRepository.getFruit();

    if (result.isValue) {
      _fruit = result.asValue!.value;
    } else {
      _error = result.asError!.asValue!.value;
    }
    notifyListeners();
  }
}
