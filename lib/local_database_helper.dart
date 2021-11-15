import 'package:shared_preferences/shared_preferences.dart';

class LocalDatabseHelper {
  static String isLogIn = "isLoggin";
  static String saveEmail = "userEmail";
  static String saveName="userName";
  static String saveMobileNumber = "userNumber";

  // saving Data to the Shared Prefernce

  static Future<bool> saveUserLoggedInLocalStorage(bool isUserLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(isLogIn, isUserLoggedIn);
  }

  static Future<bool> saveUserNameInLocalStorage(String userName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(saveName, userName);
  }

  static Future<bool> saveUserEmail(String userEmail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(saveEmail, userEmail);
  }


  static Future<bool> saveUserPhoneInLocalStorage(String phonenumber) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(saveMobileNumber, phonenumber);
  }

  // getting data from the Local Storage

  static Future<void> getUserLoggedInLocalStorage(bool isUserLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getBool(isLogIn,);
  }


  static Future<void> getUserNameInLocalStorage(String userName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getString(saveName);
  }
  static Future<void> getUserEmail(String userEmail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getString(saveEmail);
  }

    static Future<void> getUserPhoneInLocalStorage(String phonenumber) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getString(saveMobileNumber);
  }

}
