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
      backgroundColor: Colors.white,
      bottomNavigationBar: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BottomNavigationBar(
              currentIndex: _selectedIndex,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.design_services_outlined,
                  ),
                  label: 'Design',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.remove_red_eye_outlined,
                  ),
                  label: 'Preview',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.import_export_rounded,
                  ),
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
