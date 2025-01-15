import 'package:async/async.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsRepository {
  Future<Result<void>> setUseMockApiFlag(bool flag) async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool("useMockApi", flag);

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
}
