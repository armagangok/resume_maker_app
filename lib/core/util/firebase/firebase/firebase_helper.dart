import '../contract/firebase_repository.dart';

class FirebaseHelper implements FirebaseRepository {
  @override
  Future<void> deleteData<T>({required String collection, data}) {
    throw UnimplementedError();
  }

  @override
  Future<void> fetchData<T>({required String collection, data}) {
    throw UnimplementedError();
  }

  @override
  Future<void> saveData<T>({required String collection, data}) {
    throw UnimplementedError();
  }

  @override
  Future<void> updateData<T>({required String collection, data}) {
    throw UnimplementedError();
  }
}
