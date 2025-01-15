import 'package:async/async.dart';
import 'package:cupertino_settings_mvvm_example/data/models/fruit_api_model.dart';
import 'package:cupertino_settings_mvvm_example/data/services/api_service.dart';
import 'package:cupertino_settings_mvvm_example/domain/models/fruit.dart';

class FruitRepository {
  FruitRepository({required ApiService apiService})
    : _apiService = apiService;
  
  final ApiService _apiService;

  Result<Fruit> getFruit() {
    var result = _apiService.getFruit();

    if (result.isValue) {
      FruitApiModel fruitApi = result.asValue!.value;
      Fruit fruit = Fruit(name: fruitApi.name, color: fruitApi.color);
      return Result.value(fruit);
    } else {
      return Result.error("No fruit :(");
    }
  }
}