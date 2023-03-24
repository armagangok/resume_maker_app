import '/core/export/export.dart';
import '/data/entities/entity.dart';

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




// double speaking = 1.0;
//   double reading = 1.0;
//   double writing = 1.0;

//   void setSpeaking(double value) {
//     speaking = value;
//     emit(MultipleItemInitial());
//   }

//   void setReading(double value) {
//     reading = value;
//     emit(MultipleItemInitial());
//   }

//   void setWriting(double value) {
//     writing = value;
//     emit(MultipleItemInitial());
//   }