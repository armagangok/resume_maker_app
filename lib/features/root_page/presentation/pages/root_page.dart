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
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: KPadding.width15,
        ),
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }

  Widget _bottomNavBar() => SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.w),
              child: BottomNavigationBar(
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
                onTap: (index) async {
                  setState(() {
                    _selectedIndex = index;
                  });

                  if (index == 0 || index == 2 || index == 3) {
                    Injection.profileCubit.selectCategory(0);
                  }

                  if (_selectedIndex == 2) {
                    await Injection.previewCubit.loadPreview(
                      pdfId: "preview_pdf",
                    );
                  }

                  if (_selectedIndex == 3) {
                    await Injection.exportCubit.exportPdf();
                  }
                },
              ),
            ),
          ],
        ),
      );
}
