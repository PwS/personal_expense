import 'package:hive_flutter/hive_flutter.dart';
import 'package:personal_expense/db/database.dart';
import 'package:personal_expense/services/theme_handler/base_theme_handler_service.dart';
import 'package:personal_expense/models/app_theme/app_theme_enum.dart';

class ThemeHandlerService implements BaseThemeHandlerService {
  ///SingleTon
  ThemeHandlerService._privateConstructor();

  static final ThemeHandlerService _instance =
      ThemeHandlerService._privateConstructor();

  factory ThemeHandlerService() {
    return _instance;
  }

  @override
  Future<AppThemeEnum> getAppTheme() async {
    try {
      var dataBox = await Hive.openBox<AppThemeEnum>(BoxName.themeBox);
      if (dataBox.values.isEmpty) {
        return AppThemeEnum.light;
      } else {
        return dataBox.values.first;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<AppThemeEnum> changeAppTheme(AppThemeEnum appTheme) async {
    try {
      var dataBox = await Hive.openBox<AppThemeEnum>(BoxName.themeBox);
      dataBox.clear();
      dataBox.add(appTheme);
      return appTheme;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
