// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';

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
          cubit: Injection.educationCubit,
        ),
        SizedBox(
          height: KPadding.height5,
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

