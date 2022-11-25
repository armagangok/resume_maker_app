abstract class FirebaseRepository {
  Future<void> saveData<T>({
    required String collection,
    dynamic data,
  });

  Future<void> deleteData<T>({
    required String collection,
    dynamic data,
  });

  Future<void> fetchData<T>({
    required String collection,
    dynamic data,
  });

  Future<void> updateData<T>({
    required String collection,
    dynamic data,
  });
}
