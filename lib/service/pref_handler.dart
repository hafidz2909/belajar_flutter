import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHandler {
  static const String _registeredEmail = 'registeredEmail';
  static const String _registeredPassword = 'registeredPassword';

  // for saving email and password
  static void saveId(String email, String password) {
    print('registered email: $email');
    print('registered password: $password');
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString(_registeredEmail, email);
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

  // for removing email and password
  static void removeId() {
    SharedPreferences.getInstance().then((prefs) {
      prefs.remove(PreferenceHandler._registeredEmail);
      prefs.remove(PreferenceHandler._registeredPassword);
    });
  }
}
