import '/core/export/export.dart';
import '../widgets/data_category_pageview.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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

  Widget _userDataTabBar() {
    return CustomTabBarWidget(
      itemList: Injection.profileCubit.categoryList,
      onTap: (int index) async => await Injection.profileCubit.selectCategory(
        index,
      ),
      itemCount: Injection.profileCubit.categoryList.length,
    );
  }
}
