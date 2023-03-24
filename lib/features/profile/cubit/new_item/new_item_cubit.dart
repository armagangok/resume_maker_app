// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../../../core/export/export.dart';
import '../../../../../data/models/single_new_item_model.dart';

part 'new_item_state.dart';

class NewItemCubit extends Cubit<NewItemState> {
  NewItemCubit() : super(AddItemInitial());

  List<NewItemModel> newItems = [];

  int indexID = 0;

  void addNewItem() {
    newItems.add(
      NewItemModel(
        controller: TextEditingController(),
        index: indexID,
      ),
    );
    emit(ItemAdded());
    indexID++;
  }

  void removeItem(int index) {
    newItems.removeAt(index);
    emit(ItemRemoved());
  }
}
