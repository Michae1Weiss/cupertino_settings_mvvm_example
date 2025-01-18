import 'package:cupertino_settings_mvvm_example/data/repositories/settings_repository.dart';
import 'package:flutter/cupertino.dart';

class SettingsViewModel extends ChangeNotifier {
  SettingsViewModel({required SettingsRepository settingsRepository})
      : _settingsRepository = settingsRepository {
    readSettings();
  }

  final SettingsRepository _settingsRepository;

  bool _useMockApi = false;
  bool _useDarkTheme = false;
  bool get useMockApi => _useMockApi;
  bool get useDarkTheme => _useDarkTheme;

  Future<void> readSettings() async {
    var useMockApiFlag = await _settingsRepository.getUseMockApiFlag();
    var useDarkTheme = await _settingsRepository.getUseDarkTheme();

    if (useMockApiFlag.isValue) {
      _useMockApi = useMockApiFlag.asValue!.value;
    }

    if (useDarkTheme.isValue) {
      _useDarkTheme = useDarkTheme.asValue!.value;
    }

    if (useMockApiFlag.isValue || useDarkTheme.isValue) {
      notifyListeners();
    }
  }

  Future<void> toggleUseMockApiFlag() async {
    bool newFlag = !_useMockApi;
    var result = await _settingsRepository.setUseMockApiFlag(newFlag);
    if (result.isValue) {
      _useMockApi = newFlag;
      notifyListeners();
    }
  }

  Future<void> toggleUseDarkTheme() async {
    bool newFlag = !_useDarkTheme;
    var result = await _settingsRepository.setUseDarkTheme(newFlag);
    if (result.isValue) {
      _useDarkTheme = newFlag;
      notifyListeners();
    }
  }
}
