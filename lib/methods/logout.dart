

import 'package:shared_preferences/shared_preferences.dart';

void logout() async{
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.clear();
}