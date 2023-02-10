import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume_maker_app/features/design/presentation/pages/design_page.dart';
import 'package:resume_maker_app/features/export/presentation/pages/export_page.dart';

import '../../../preview/presentation/pages/preview_page.dart';
import '../../../profile/presentation/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      bottomNavigationBar: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BottomNavigationBar(
              backgroundColor: Colors.black,
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
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
