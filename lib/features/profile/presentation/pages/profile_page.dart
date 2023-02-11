import 'package:resume_maker_app/core/export/export.dart';
import 'package:resume_maker_app/core/widget/custom_tab_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          _userDataTabBar(),
          const DataCategoryPageView(),
        ],
      ),
    );
  }

  Widget _userDataTabBar() => CustomTabBarWidget(
        itemList: Injection.profileCubit.categoryList,
        onTap: (int index) => Injection.profileCubit.selectCategory(index),
        itemCount: Injection.profileCubit.categoryList.length,
      );
}

class DataCategoryPageView extends StatefulWidget {
  const DataCategoryPageView({
    super.key,
  });

  @override
  State<DataCategoryPageView> createState() => _DataCategoryPageViewState();
}

class _DataCategoryPageViewState extends State<DataCategoryPageView> {
  final profileCubit = Injection.profileCubit;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();

    currentPage = 0;
    profileCubit.controller.addListener(() {
      setState(() {
        currentPage = profileCubit.controller.page!.toInt();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400.h,
      child: BlocBuilder<ProfileCubit, ProfileState>(
        bloc: Injection.profileCubit,
        builder: (context, state) {
          return PageView.builder(
            controller: profileCubit.controller,
            itemBuilder: (context, position) {
              return profileCubit.widgets[position];
            },
            itemCount: profileCubit.widgets.length, // Can be null
          );
        },
      ),
    );
  }
}
