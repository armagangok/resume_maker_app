import 'dart:io';

import '../../../../../core/export/export.dart';

part 'file_entity_state.dart';

class FileEntityCubit extends Cubit<FileEntityState> {
  FileEntityCubit({required HomeUsecase homeUsecase})
      : super(FileEntityInitial()) {
    _homeUsecase = homeUsecase;
    fetchFileEntityList();
  }

  late final HomeUsecase _homeUsecase;

  List<FileSystemEntity> fileList = [];

  Future<void> fetchFileEntityList() async {
    var response = await _homeUsecase.fetchFileEntityList();

    response.when(
      success: (data) {
        emit(FileEntityFetched(userDataList: data));
      },
      failure: (failure) {
        emit(FileEntityFetchFailure());
      },
    );
  }
}
