import '/core/export/export.dart';

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
