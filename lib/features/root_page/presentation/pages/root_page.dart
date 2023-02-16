import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:resume_maker_app/core/export/export.dart';
import 'package:resume_maker_app/features/design/presentation/pages/design_page.dart';
import 'package:resume_maker_app/features/export/presentation/pages/export_page.dart';

import '../../../preview/presentation/pages/preview_page.dart';
import '../../../profile/presentation/pages/profile_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
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
      appBar: _appBar(),
      bottomNavigationBar: _bottomNavBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: KPadding.width10),
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }

  AppBar _appBar() => AppBar(
        leading: GestureDetector(
          onTap: () {},
          child: const Icon(
            Icons.menu_rounded,
            size: 45,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Visibility(
              visible: false,
              child: GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.menu_rounded,
                  size: 45,
                ),
              ),
            ),
            Text(
              _getDate(),
              style: context.bodyLarge.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            GestureDetector(
                onTap: () {},
                child: CircleAvatar(
                  backgroundColor: selectedItemColor,
                  child: Center(
                    child: Icon(
                      CupertinoIcons.checkmark_alt,
                      color: white,
                      size: 35.h,
                    ),
                  ),
                )
                // const Icon(
                //   CupertinoIcons.checkmark_alt_circle_fill,
                //   color: selectedItemColor,
                //   size: 45,
                // ),
                ),
          ],
        ),
      );

  String _getDate() {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('MMMM dd, yyyy');
    final String formatted = formatter.format(now);

    return formatted;
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
