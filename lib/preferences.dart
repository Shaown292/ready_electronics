import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences {
  static void setStringData({required String key,required String data}) async{
    final ref  = await  SharedPreferences.getInstance();
    ref.setString(key, data);
  }


  static void setBoolData({required String key,required bool data}) async{
    final ref  = await  SharedPreferences.getInstance();
    bool initialData = false;
    initialData = data;
    ref.setBool(key, data);
  }

  static Future<String?> getStringData({required String key}) async{
    final ref  = await  SharedPreferences.getInstance();
    return ref.getString(key);
  }

  static Future<bool?> getBoolData({required String key}) async{
    final ref  = await  SharedPreferences.getInstance();
    return ref.getBool(key);
  }


  static void removeData({required String key}) async{
    final ref = await SharedPreferences.getInstance();
    ref.remove(key);
  }

}