
import 'package:shared_preferences/shared_preferences.dart';

Future<String>getUser()async{
  SharedPreferences pref= await SharedPreferences.getInstance();
  String x= pref.getString('user');
  return x;
}