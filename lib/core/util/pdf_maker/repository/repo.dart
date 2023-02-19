import 'dart:convert';

import 'package:resume_maker_app/core/export/export.dart';
import 'package:resume_maker_app/domain/usecases/user_data_usecase.dart';

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
        value.fold(
          (l) => null,
          (r) {
            for (var element in r) {
              var model = UserData.fromJson(jsonDecode(element));
              userDataList.add(model);
            }
          },
        );
      },
    );
  }
}
