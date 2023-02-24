import 'package:flutter/cupertino.dart';

import '../../../../core/export/export.dart';
import '../widgets/root_appbar.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  void initState() {
    super.initState();
  }

  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const DesignPage(),
    const ProfilePage(),
    const PreviewPage(),
    const ExportPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      bottomNavigationBar: _bottomNavBar(),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }

  Widget _bottomNavBar() => SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BottomNavigationBar(
              backgroundColor: Colors.black.withOpacity(0.1),
              type: BottomNavigationBarType.fixed,
              currentIndex: _selectedIndex,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.photo_on_rectangle),
                  label: 'Design',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.person_crop_circle_fill),
                  label: 'Profile',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.eye_fill),
                  label: 'Preview',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.square_arrow_down_on_square_fill),
                  label: 'Export',
                ),
              ],
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ],
        ),
      );
}

// print(personalDataModel.birthday);
// print(personalDataModel.city);
// print(personalDataModel.country);
// print(personalDataModel.fullName);
// print(personalDataModel.emails);
// print(personalDataModel.links);
// print(personalDataModel.phones);
// print(personalDataModel.street);
// print(personalDataModel.title);
// print(personalDataModel.summary);