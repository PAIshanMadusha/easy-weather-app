import 'package:shared_preferences/shared_preferences.dart';

class ThemeDataPersistence {
  //Store User's Saved Theme in SharedPreferences
  Future <void> storeTheme(bool isDark) async{
    SharedPreferences pref = await SharedPreferences.getInstance();

    pref.setBool("isDark", isDark);
  }

  //Load the User's Saved Theme from SharedPreferences
  Future <bool> loadTheme() async{
    SharedPreferences pref = await SharedPreferences.getInstance();

    return pref.getBool("isDark") ?? false;
  }
}