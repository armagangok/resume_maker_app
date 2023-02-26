import 'dart:convert';

import 'package:resume_maker_app/core/export/export.dart';

class PdfRepo {
  PdfRepo._() {
    initializeRepositories();
  }
  static final instance = PdfRepo._();

  final UserDataUsecase usecase = UserDataUsecase.instance;

  List<UserData> userDataList = [];

  UserData get getUserData => userDataList[0];

  void initializeRepositories() {
    usecase.fetchUserData().then(
      (value) {
        value.when(
          success: (data) {
            for (var element in data) {
              var model = UserData.fromJson(jsonDecode(element));
              userDataList.add(model);
            }
          },
          failure: (failure) {
            print(failure);
          },
        );
      },
    );
    // print(getUserData);
  }
}
