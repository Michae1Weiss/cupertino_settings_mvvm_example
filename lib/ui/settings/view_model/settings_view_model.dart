import 'package:cupertino_settings_mvvm_example/data/repositories/settings_repository.dart';
import 'package:flutter/cupertino.dart';

class SettingsViewModel extends ChangeNotifier {
  SettingsViewModel({required SettingsRepository settingsRepository})
      : _settingsRepository = settingsRepository {
    getUseMockApiFlag();
  }

  final SettingsRepository _settingsRepository;

  bool _flag = false;
  bool get flag => _flag;

  Future<void> getUseMockApiFlag() async {
    var useMockApiFlag = await _settingsRepository.getUseMockApiFlag();

    if (useMockApiFlag.isValue) {
      _flag = useMockApiFlag.asValue!.value;
      notifyListeners();
    }
  }

  Future<void> toggleUseMockApiFlag() async {
    bool newFlag = !_flag;
    var result = await _settingsRepository.setUseMockApiFlag(newFlag);
    if (result.isValue) {
      _flag = newFlag;
      notifyListeners();
    }
  }
}
