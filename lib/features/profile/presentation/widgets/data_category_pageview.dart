import '../../../../core/export/export.dart';

class DataCategoryPageView extends StatelessWidget {
  const DataCategoryPageView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600.h,
      child: BlocBuilder<ProfileCubit, ProfileState>(
        bloc: Injection.profileCubit,
        builder: (context, state) {
          return PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: Injection.profileCubit.controller,
            itemBuilder: (context, position) {
              return Injection.profileCubit.widgets[position];
            },
            itemCount: Injection.profileCubit.widgets.length, // Can be null
          );
        },
      ),
    );
  }
}
