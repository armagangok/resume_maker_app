// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:resume_maker_app/core/export/export.dart';

import 'package:resume_maker_app/features/profile/data/models/data_tabbar_model.dart';

class CategoryTextWidget extends StatelessWidget {
  const CategoryTextWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  final ResumeDataCategoryModel model;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      bloc: Injection.profileCubit,
      builder: (context, state) {
        return Center(
          child: Text(
            model.categoryName,
            style: context.bodyLarge.copyWith(
              color: model.isSelected ? selectedItemColor : null,
              fontWeight: model.isSelected ? FontWeight.w900 : null,
            ),
          ),
        );
      },
    );
  }
}
