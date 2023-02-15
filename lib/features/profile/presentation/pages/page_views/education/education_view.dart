// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../../../../core/export/export.dart';
import '../../../../../../core/widget/buttons/add_new_item.dart';
import '../../../widgets/multiple_item_builder.dart';

class EducationView extends StatelessWidget {
  const EducationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        MultipleNewItemBuilder(
          cubit: Injection.multipleItemCubit,
        ),
        SizedBox(height: KPadding.height5),
        NewItemWidget(
          onTap: () {
            Injection.multipleItemCubit.addNewItem();
          },
        ),
      ],
    );
  }
}
