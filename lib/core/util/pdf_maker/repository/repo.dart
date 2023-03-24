import '/core/export/export.dart';

class PdfRepository {
  PdfRepository._();
  static final instance = PdfRepository._();

  

  UserData get getUserData => UserDataProvider.userData;
}
