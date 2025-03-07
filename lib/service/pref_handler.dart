import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHandler {
  static const String _registeredEmail = 'registeredEmail';
  static const String _registeredPassword = 'registeredPassword';
  static const String _lookWellcoming = 'lookWellcoming';

  // for saving email and password
  static void saveId(String email, String password) {
    print('registered email: $email');
    print('registered password: $password');
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString(_registeredEmail, email);
    });
  }

  // savelook
  static void saveLookWellcoming(bool look) {
    print('look: $look');
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool('_lookWellcoming', look);
    });
  }

  // for getting email and password
  static Future getId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = prefs.getString(PreferenceHandler._registeredEmail) ?? '';
    String password =
        prefs.getString(PreferenceHandler._registeredPassword) ?? '';
    return email;
    return password;
  }

  // getlook
  static Future getLookWelcoming() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool look = prefs.getBool(_lookWellcoming) ?? false;
    return look;
  }

  // for removing email and password
  static void removeId() {
    SharedPreferences.getInstance().then((prefs) {
      prefs.remove(PreferenceHandler._registeredEmail);
      prefs.remove(PreferenceHandler._registeredPassword);
    });
  }
}
