import 'dart:convert';

import 'package:resume_maker_app/core/export/export.dart';

import '../../../../data/user_data_provider.dart';

class PdfRepo {
  PdfRepo._();
  static final instance = PdfRepo._();

  final UserDataUsecase usecase = UserDataUsecase.instance;

  List<UserData> userDataList = [];

  UserData get getUserData => UserDataProvider.getUserData ?? const UserData();

  Future<void> get initializeRepositories async {
    var a = UserDataProvider.getUserData;
    print(a);

    var response = await usecase.fetchUserData();

    response.when(
      success: (data) {
        for (var element in data) {
          var model = UserData.fromJson(jsonDecode(element));

          userDataList.add(model);
        }
      },
      failure: (failure) {},
    );
  }
}
