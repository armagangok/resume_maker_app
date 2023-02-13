import 'package:resume_maker_app/features/profile/presentation/pages/page_views/personal/components/email_new_item_builder.dart';


import '../../../../../../core/export/export.dart';
import '../../../../../../core/widget/buttons/add_new_item.dart';
import '../../../../../../core/widget/buttons/text_field/text_field.dart';

class EducationDataView extends StatelessWidget {
  const EducationDataView({super.key});

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
        EmailNewItemBuilder(
          cubit: Injection.linkItemCubit,
        ),
        NewItemWidget(
          onTap: () {
            Injection.linkItemCubit.addNewItem();
          },
        ),
      ],
    );
  }
}
