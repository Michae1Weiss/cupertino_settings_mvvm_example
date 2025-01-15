import 'package:cupertino_settings_mvvm_example/data/repositories/settings_repository.dart';
import 'package:flutter/cupertino.dart';

class SettingsViewModel extends ChangeNotifier {
  SettingsViewModel({required SettingsRepository settingsRepository})
      : _settingsRepository = settingsRepository;

  final SettingsRepository _settingsRepository;

  bool getUseMockApiFlag() {
    return false;
  }

  bool toggleUseMockApiFlag() {
    return false;
  }
}
