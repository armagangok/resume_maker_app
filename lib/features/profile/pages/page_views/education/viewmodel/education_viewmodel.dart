import '/core/export/export.dart';
part 'education_state.dart';

class EducationCubit extends Cubit<EducationState> {
  EducationCubit() : super(EducationInitial());

  List<UserDataEntity> newItems = [];

  void addNewItem(UserDataEntity data) {
    newItems.add(data);

    emit(EducationAdded());
  }

  String getUniqeID() {
    String itemId = "${DateTime.now()}";
    return itemId;
  }

  void removeItem(String id) {
    newItems.removeWhere(
      (element) => element.itemID == id,
    );

    emit(EducationRemoved());
  }

  bool checkIfOnlyUp(index) {
    if (index == 0) {
      if (index == 0) {
        return false;
      } else {
        return false;
      }
    } else {
      return true;
    }
  }

  bool checkIfOnlyDown(index) {
    if (index == newItems.length - 1) {
      if (index == newItems.length - 1) {
        return false;
      } else {
        return false;
      }
    } else {
      return true;
    }
  }
}