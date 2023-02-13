// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';

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

class RemoveNewItemWidget extends StatelessWidget {
  const RemoveNewItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Injection.educationCubit.removeItem(0),
      child: Row(
        children: [
          const Icon(
            CupertinoIcons.minus_circle_fill,
            color: deleteRedColor,
          ),
          SizedBox(
            width: KPadding.width20,
          ),
          Text(
            "Delete",
            style: context.bodyLarge.copyWith(color: white),
          )
        ],
      ),
    );
  }
}
