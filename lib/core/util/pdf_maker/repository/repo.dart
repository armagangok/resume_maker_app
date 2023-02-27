import 'dart:convert';

import 'package:resume_maker_app/core/export/export.dart';

import '../../../../data/user_data_provider.dart';

class PdfRepo {
  PdfRepo._() {
    _initializeRepositories;
  }
  static final instance = PdfRepo._();

  final UserDataUsecase usecase = UserDataUsecase.instance;

  List<UserData> userDataList = [];

  UserData get getUserData => UserDataProvider.getUserData ?? const UserData();

  Future<void> get _initializeRepositories async {
    usecase.fetchUserData().then(
          (value) => value.when(
            success: (data) {
              for (var element in data) {
                var model = UserData.fromJson(jsonDecode(element));
                userDataList.add(model);
              }
            },
            failure: (failure) => print(failure),
          ),
        );
  }
}
