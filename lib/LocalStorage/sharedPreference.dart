import 'package:shared_preferences/shared_preferences.dart';


class Shared {


  Future<SharedPreferences> getPrefs() async {
    return await SharedPreferences.getInstance();
  }
  static String tokenId = 'token';
}

