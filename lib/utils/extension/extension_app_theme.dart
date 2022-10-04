import 'package:personal_expense/models/app_theme/app_theme_enum.dart';

extension AppThemeString on AppThemeEnum {
  String get valueAsString => toString().split('.').last;

  String asString() => toString().split('.').last;
}
