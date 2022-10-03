import 'package:hive_flutter/hive_flutter.dart';
import 'package:personal_expense/utils/utility.dart';

part 'box_name.dart';

class Database {
  static Future<void> initHive() async {
    await Hive.initFlutter();
    registerAdapterHive();
  }

  static void registerAdapterHive() {
    logger.i('Start Register Adapter');
    ///TODO Start Register Adapter
    /*Hive
      ..registerAdapter(ModelNameAdapter())
    ;*/
  }

  static void closeBox() {
    logger.i('Closing Box Hive');
    Hive.deleteFromDisk();
  }
}
