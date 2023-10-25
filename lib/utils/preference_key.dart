import '../main.dart';

class SharedpreferenceKey {
  static const String userId = 'userId';
  static const String firstTimeAppOpen = 'firstTimeAppOpen';
  static const String loggedIn = 'loggedIn';

  static int getUserId() {
    return prefs.getInt(userId) ?? -1;
  }
}
