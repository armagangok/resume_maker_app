import 'package:resume_maker_app/core/export/export.dart';

import '../../../../data/user_data_provider.dart';

class PdfRepo {
  PdfRepo._();
  static final instance = PdfRepo._();

  final UserDataUsecase usecase = UserDataUsecase.instance;

  UserData get getUserData => UserDataProvider.instance.getUserData;
}
