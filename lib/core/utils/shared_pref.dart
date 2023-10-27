import 'package:shared_preferences/shared_preferences.dart';

class Shared {
  static SharedPreferences? sharedPreferences;

  static initSharedPref() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static prefSetString({key, value}) {
    sharedPreferences?.setString(key, value);
  }

  static prefClear() {
    return sharedPreferences?.clear();
  }

  static prefSetInt({key, value}) {
    sharedPreferences?.setInt(key, value);
  }

  static prefSetBool({key, value}) {
    sharedPreferences?.setBool(key, value);
  }

  static prefGetString({key}) {
    return sharedPreferences?.getString(key);
  }

  static prefGetBool({key}) {
    sharedPreferences?.getBool(key);
  }

  static prefGetInt({key}) {
    return sharedPreferences?.getInt(key);
  }
}
