import 'package:personal_expense/models/app_theme/app_theme_enum.dart';

abstract class BaseThemeHandlerService {
  Future<AppThemeEnum> getAppTheme();

  Future<AppThemeEnum> changeAppTheme(AppThemeEnum appThemeEnum);
}
