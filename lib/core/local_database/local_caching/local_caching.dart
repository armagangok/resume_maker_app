import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalCache {
  static Future storage() async {}
}

class SharedPrefImp extends LocalCache {
  SharedPrefImp._();

  static Future<SharedPreferences> get storage async =>
      await SharedPreferences.getInstance();
}
