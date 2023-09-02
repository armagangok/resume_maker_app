import '../../core/export/export.dart';

abstract class NewItemContract extends Cubit {
  List<NewItemModel> newItems = [];

  int indexID = 0;

  NewItemContract(super.initialState);

  void addNewItem();

  void removeItem(int index);
}
