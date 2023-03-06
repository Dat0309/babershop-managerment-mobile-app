import 'package:hive_flutter/hive_flutter.dart';

class LocalSrorageHelper {
  LocalSrorageHelper._internal();
  static final LocalSrorageHelper _shared = LocalSrorageHelper._internal();

  factory LocalSrorageHelper() {
    return _shared;
  }

  Box<dynamic>? hiveBox;

  static initLocalStorageHelper() async {
    _shared.hiveBox = await Hive.openBox('food_recipe_app');
  }

  static dynamic getValues(String key) {
    print(_shared.hiveBox?.get(key));
    return _shared.hiveBox?.get(key);
  }

  static setValue(String key, dynamic val) {
    _shared.hiveBox?.put(key, val);
    print(_shared.hiveBox?.get(key));
  }
}
