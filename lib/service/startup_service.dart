import 'package:hive_ce_flutter/adapters.dart';

import '../data/constants.dart';

class StartupService {
  static Future<void> init() async {
    await _init();
  }

  static Future<void> _init() async {
    await _initHive();
    await _initDB();
  }

  static Future<void> _initHive() async {
    await Hive.initFlutter();
    await Hive.openBox(Constants.box);
  }

  static Future<void> _initDB() async {
    Box box = Hive.box(Constants.box);
  }
}
