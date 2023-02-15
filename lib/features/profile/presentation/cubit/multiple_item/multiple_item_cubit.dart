// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../../../core/export/export.dart';
import '../../../../../data/models/multiple_new_item.dart';
import '../../widgets/remove_new_item.dart';

part 'multiple_item_state.dart';

class MultipleItemCubit extends Cubit<MultipleItemState> {
  MultipleItemCubit() : super(MultipleItemInitial());

  List<MultipleNewItem> newItems = [];

  void addNewItem() {
    String itemId = "${DateTime.now()}";
    newItems.add(
      MultipleNewItem(
        degreeController: TextEditingController(),
        schoolController: TextEditingController(),
        universityController: TextEditingController(),
        startDateController: TextEditingController(),
        endDateController: TextEditingController(),
        itemID: itemId,
        deleteWidget: RemoveNewItemWidget(
          itemID: itemId,
        ),
      ),
    );

    emit(MultipleItemAdded());
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
