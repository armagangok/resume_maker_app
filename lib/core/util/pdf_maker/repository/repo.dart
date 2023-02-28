import 'package:resume_maker_app/core/export/export.dart';

import '../../../../data/user_data_provider.dart';

class PdfRepo {
  PdfRepo._();
  static final instance = PdfRepo._();

  final UserDataUsecase usecase = UserDataUsecase.instance;

  UserData get getUserData {
    print(UserDataProvider.getUserData);
    return UserDataProvider.getUserData;
  }

  void _userData() {
    UserData model = UserDataProvider.getUserData;
  }

  // Future<void> get initializeRepositories async {
  //   var a = UserDataProvider.getUserData;
  //   print(a);

  //   var response = await usecase.fetchUserData();

  //   response.when(
  //     success: (data) {
  //       for (var element in data) {
  //         var model = UserData.fromJson(jsonDecode(element));

  //         _userDataList.add(model);
  //       }
  //     },
  //     failure: (failure) {},
  //   );
  // }
}
