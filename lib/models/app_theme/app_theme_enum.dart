import 'package:hive/hive.dart';

part 'app_theme_enum.g.dart';

@HiveType(typeId: 1)
enum AppThemeEnum {
  @HiveField(0)
  light,
  @HiveField(1)
  dark
}
