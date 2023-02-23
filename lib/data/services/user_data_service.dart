import 'package:resume_maker_app/core/util/hive/hive_helper.dart';
import 'package:resume_maker_app/core/util/hive/hive_keys.dart';
import 'package:resume_maker_app/core/util/logger.dart';

class UserDataServiceImp {
  UserDataServiceImp._();
  static final instance = UserDataServiceImp._();

  Future<void> saveUserData(String userData) async {
    var response = await HiveHelper.shared.addData<String>(
      HiveBoxes.userDataBox,
      userData,
    );

    LogHelper.shared.debugPrint("$response");
  }

  Future<dynamic> fetchUserData() async {
    var response = await HiveHelper.shared.getAll<String>(HiveBoxes.userDataBox);

    LogHelper.shared.debugPrint("$response");
    return response;
  }

  Future<dynamic> deleteUserData(int index) async {
    await HiveHelper.shared.deleteDataAt<String>(
      HiveBoxes.userDataBox,
      index,
    );
  }
}
