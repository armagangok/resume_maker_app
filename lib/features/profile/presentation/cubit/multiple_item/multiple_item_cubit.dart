// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../../../core/export/export.dart';

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
        indexID: indexID,
      ),
    );

    emit(MultipleItemAdded());
    indexID++;
  }

  void removeItem(int index) {
    newItems.removeAt(index);
    emit(MultipleItemRemoved());
  }
}

class MultipleNewItem {
  final TextEditingController degreeController;
  final TextEditingController schoolController;
  final TextEditingController universityController;
  final TextEditingController startDateController;
  final TextEditingController endDateController;
  final int indexID;

  MultipleNewItem({
    required this.degreeController,
    required this.schoolController,
    required this.universityController,
    required this.startDateController,
    required this.endDateController,
    required this.indexID,
  });
}
