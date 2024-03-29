import '/core/export/export.dart';

part 'multiple_item_state.dart';

class MultipleItemCubit extends Cubit<MultipleItemState> {
  MultipleItemCubit() : super(MultipleItemInitial());

  List<UserDataEntity> newItems = [];

  void addNewItem(UserDataEntity data) {
    newItems.add(data);

    emit(MultipleItemAdded());
  }

  String getUniqeID() {
    String itemId = "${DateTime.now()}";
    return itemId;
  }

  void removeItem(String id) {
    newItems.removeWhere(
      (element) => element.itemID == id,
    );

    emit(MultipleItemRemoved());
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