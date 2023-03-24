// ignore_for_file: public_member_api_docs, sort_constructors_first

import '/core/export/export.dart';
import '/data/models/multiple_new_item.dart';
import '../../../widgets/remove_new_item.dart';
import 'widget/education_item_builder.dart';

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
              degreeController: TextEditingController(
                text: checkIfDebugMode(text: "License"),
              ),
              majorController: TextEditingController(
                text: checkIfDebugMode(text: "Mechatronics Engineering"),
              ),
              universityController: TextEditingController(
                text: checkIfDebugMode(text: "Bursa Technical University"),
              ),
              startDateController: TextEditingController(
                text: checkIfDebugMode(text: "2019"),
              ),
              endDateController: TextEditingController(
                text: checkIfDebugMode(text: "2025"),
              ),
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
