// ignore_for_file: public_member_api_docs, sort_constructors_first

import '/core/export/export.dart';
import '/data/models/multiple_new_item.dart';
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
                text: kDebugMode ? "License" : null,
              ),
              majorController: TextEditingController(
                text: kDebugMode ? "Mechatronics Engineering" : null,
              ),
              universityController: TextEditingController(
                text: kDebugMode ? "Bursa Technical University" : null,
              ),
              startDateController: TextEditingController(
                text: kDebugMode ? "2019" : null,
              ),
              endDateController: TextEditingController(
                text: kDebugMode ? "2025" : null,
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
