import 'package:async/async.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsRepository extends ChangeNotifier {
  SettingsRepository() {
    readSettings();
  }

  bool _useMockApiFlag = false;
  bool _useDarkTheme = false;

  bool get useMockApiFlag => _useMockApiFlag;
  bool get useDarkTheme => _useDarkTheme;

  Future<Result<void>> setUseMockApiFlag(bool flag) async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    _useMockApiFlag = await prefs.setBool("useMockApi", flag);
    notifyListeners();

    return Result.value(null);
  }

  Future<Result<void>> setUseDarkTheme(bool flag) async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    _useDarkTheme = await prefs.setBool("useDarkTheme", flag);
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

  Future<Result<bool>> getUseDarkTheme() async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    bool? flag = prefs.getBool("useDarkTheme");

    if (flag == null) {
      return Result.error("No flag in the local storage :(");
    }

    return Result.value(flag);
  }

  Future<void> readSettings() async {
    var result = await getUseMockApiFlag();
    var resultUDT = await getUseDarkTheme();

    if (result.isValue) {
      _useMockApiFlag = result.asValue!.value;
    }

    if (resultUDT.isValue) {
      _useDarkTheme = resultUDT.asValue!.value;
    }

    if (result.isValue || resultUDT.isValue) {
      notifyListeners();
    } 
  }
}
