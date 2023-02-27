import 'package:resume_maker_app/core/export/export.dart';

class UserDataProvider {
  UserDataProvider._();

  static UserData? _userData = const UserData();
  static UserData? get getUserData => _userData;
  static set setUserData(UserData userData) => _userData = userData;
}
