import 'package:resume_maker_app/features/profile/presentation/widgets/multiple_item_builder.dart';

import '../../../../../../core/export/export.dart';
import '../../../../../../core/widget/buttons/add_new_item.dart';

class EducationView extends StatelessWidget {
  const EducationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        UnderlinedTextField(
          hintText: "Degree",
          controller: TextEditingController(),
        ),
        UnderlinedTextField(
          hintText: "School",
          controller: TextEditingController(),
        ),
        UnderlinedTextField(
          hintText: "University",
          controller: TextEditingController(),
        ),
        UnderlinedTextField(
          hintText: "Start Date",
          controller: TextEditingController(),
        ),
        UnderlinedTextField(
          hintText: "End Date",
          controller: TextEditingController(),
        ),
        MultipleNewItemBuilder(
          cubit: Injection.educationCubit,
        ),
        NewItemWidget(
          onTap: () {
            Injection.educationCubit.addNewItem();
          },
        ),
      ],
    );
  }
}
