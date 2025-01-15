import 'package:async/async.dart';
import 'package:cupertino_settings_mvvm_example/data/models/fruit_api_model.dart';
import 'package:cupertino_settings_mvvm_example/data/services/api_service.dart';
import 'package:flutter/cupertino.dart';

class RealApiService extends ApiService {
  @override
  Result<FruitApiModel> getFruit() {
    String activeGreen = CupertinoColors.activeGreen.value.toString();
    FruitApiModel apple = FruitApiModel(name: "apple", color: activeGreen);
    return Result.value(apple);
  }
}
