// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../../../../core/export/export.dart';

import '../../../../../../core/widget/buttons/add_new_item.dart';
import '../../../../../../data/models/multiple_new_item.dart';
import 'widget/education_item_builder.dart';
import '../../../widgets/remove_new_item.dart';

class EducationView extends StatelessWidget {
  const EducationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const EducationNewItemBuilder(),
        SizedBox(height: KPadding.height5),
        NewItemWidget(
          onTap: () {
            String itemId = Injection.educationCubit.getUniqeID();
            var educationModel = MultipleNewItem(
              degreeController: TextEditingController(),
              schoolController: TextEditingController(),
              universityController: TextEditingController(),
              startDateController: TextEditingController(),
              endDateController: TextEditingController(),
              itemID: itemId,
              removeWidget: RemoveNewItemWidget(
                itemID: itemId,
                cubit: Injection.educationCubit,
              ),
            );
            Injection.educationCubit.addNewItem(educationModel);
          },
        ),
      ],
    );
  }
}
