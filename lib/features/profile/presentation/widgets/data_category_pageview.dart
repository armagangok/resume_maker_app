import '../../../../core/export/export.dart';

class DataCategoryPageView extends StatefulWidget {
  const DataCategoryPageView({
    super.key,
  });

  @override
  State<DataCategoryPageView> createState() => _DataCategoryPageViewState();
}

class _DataCategoryPageViewState extends State<DataCategoryPageView> {
  final profileCubit = Injection.profileCubit;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600.h,
      child: BlocBuilder<ProfileCubit, ProfileState>(
        bloc: Injection.profileCubit,
        builder: (context, state) {
          return PageView.builder(
            controller: profileCubit.controller,
            itemBuilder: (context, position) => profileCubit.widgets[position],
            itemCount: profileCubit.widgets.length, // Can be null
          );
        },
      ),
    );
  }
}
