import 'package:async/async.dart';
import 'package:cupertino_settings_mvvm_example/data/models/fruit_api_model.dart';

abstract class ApiService {
  Result<FruitApiModel> getFruit();
}
