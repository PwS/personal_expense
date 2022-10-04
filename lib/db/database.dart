import 'package:hive_flutter/hive_flutter.dart';
import 'package:personal_expense/models/app_theme/app_theme_enum.dart';
import 'package:personal_expense/utils/utils.dart';

part 'box_name.dart';

class Database {
  static Future<void> initHive() async {
    await Hive.initFlutter();
    registerAdapterHive();
  }

  static void registerAdapterHive() {
    logger.i('Start Register Adapter');
    Hive.registerAdapter(AppThemeEnumAdapter());
  }

  static void closeBox() {
    logger.i('Closing Box Hive');
    Hive.deleteFromDisk();
  }
}
