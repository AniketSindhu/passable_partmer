import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool>loginPartner(String user, String pass) async{
  final x= await FirebaseFirestore.instance.collection("partners").doc(user).get();
  if(x.exists)
    {
      if(x.data()['pass']==pass){
        SharedPreferences pref =await SharedPreferences.getInstance();
        pref.setBool('login', true);
        pref.setString('user', user);
        return true;
      }
      else 
        return false;
    }
  else
    return false;
}