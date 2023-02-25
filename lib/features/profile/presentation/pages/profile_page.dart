import '../../../../core/export/export.dart';

import '../widgets/data_category_pageview.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          _userDataTabBar(),
          const CustomDivider(),
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
