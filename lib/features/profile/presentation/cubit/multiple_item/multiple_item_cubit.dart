import 'package:resume_maker_app/data/entities/entity.dart';

import '../../../../../core/export/export.dart';

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

class LanguageCubit extends MultipleItemCubit {
  LanguageCubit() : super();

  String speaking = "1";
  String reading = "1";
  String writing = "0";

  setSpeaking(String value) {
    speaking = value;
    emit(MultipleItemInitial());
  }

  setReading(String value) {
    reading = value;
    emit(MultipleItemInitial());
  }

  setWriting(String value) {
    writing = value;
    emit(MultipleItemInitial());
  }
}
