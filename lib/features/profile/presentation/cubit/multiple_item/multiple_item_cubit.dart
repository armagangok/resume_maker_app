// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../../../core/export/export.dart';
import '../../../../../data/models/multiple_new_item.dart';
import '../../pages/page_views/education/education_view.dart';

part 'multiple_item_state.dart';

class MultipleItemCubit extends Cubit<MultipleItemState> {
  MultipleItemCubit() : super(MultipleItemInitial());

  List<MultipleNewItem> newItems = [];

  int indexID = 0;

  void addNewItem() {
    newItems.add(
      MultipleNewItem(
        degreeController: TextEditingController(),
        schoolController: TextEditingController(),
        universityController: TextEditingController(),
        startDateController: TextEditingController(),
        endDateController: TextEditingController(),
        itemID: indexID,
        deleteWidget: RemoveNewItemWidget(
          index: indexID,
        ),
      ),
    );

    emit(MultipleItemAdded());
    indexID++;
  }

  void removeItem(int index) {
    newItems.removeAt(index);
    updateWidgetIndex();
    emit(MultipleItemRemoved());
  }

  updateWidgetIndex() {
    for (var i = 0; i < newItems.length; i++) {
      newItems[i].itemID = i;
    }
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
    if (index == Injection.educationCubit.newItems.length - 1) {
      if (index == Injection.educationCubit.newItems.length - 1) {
        return false;
      } else {
        return false;
      }
    } else {
      return true;
    }
  }
}
