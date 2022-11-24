abstract class RemoteDatabase {
  Future<void> saveData<T>();

  Future<void> deleteData<T>();

  Future<void> fetchData<T>();

  Future<void> updateData<T>();
}
