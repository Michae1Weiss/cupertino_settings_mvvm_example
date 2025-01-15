import 'package:async/async.dart';
import 'package:cupertino_settings_mvvm_example/data/models/fruit_api_model.dart';
import 'package:cupertino_settings_mvvm_example/data/services/api_service.dart';
import 'package:flutter/cupertino.dart';

class MockApiService extends ApiService {
  @override
  Result<FruitApiModel> getFruit() {
    String systemYellow = CupertinoColors.systemYellow.value.toString();
    FruitApiModel banana = FruitApiModel(name: "banana", color: systemYellow);
    return Result.value(banana);
  }
}
