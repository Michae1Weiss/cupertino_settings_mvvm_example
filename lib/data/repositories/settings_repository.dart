import 'package:async/async.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsRepository extends ChangeNotifier {
  SettingsRepository() {
    readUseMockApiFlag();
  }

  bool _useMockApiFlag = false;

  bool get useMockApiFlag => _useMockApiFlag;

  Future<Result<void>> setUseMockApiFlag(bool flag) async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool("useMockApi", flag);
    _useMockApiFlag = flag;
    notifyListeners();

    return Result.value(null);
  }

  Future<Result<bool>> getUseMockApiFlag() async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    bool? flag = prefs.getBool("useMockApi");

    if (flag == null) {
      return Result.error("No flag in the local storage :(");
    }

    return Result.value(flag);
  }

  Future<void> readUseMockApiFlag() async {
    var result = await getUseMockApiFlag();

    if (result.isValue) {
      _useMockApiFlag = result.asValue!.value;
      notifyListeners();
    }
  }
}
