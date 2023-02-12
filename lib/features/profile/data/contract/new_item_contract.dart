import '../../../../core/export/export.dart';
import '../../presentation/cubit/new_item/new_item_cubit.dart';

abstract class NewItemContract extends Cubit {
  List<NewItemModel> newItems = [];

  int indexID = 0;

  NewItemContract(super.initialState);

  void addNewItem();

  void removeItem(int index);
}
