import 'package:flutter/material.dart';

import '../../../../core/extension/context_extension.dart';
import '../../../../core/navigation/constant/routes.dart';
import '../../../../core/navigation/navigation_service.dart';
import '../widget/export.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const HomeContainerWidget(),
          const Spacer(),
          Padding(
            padding: context.normalPadding,
            child: Column(
              children: [
                _createResumeButton,
                SizedBox(height: context.height(0.05)),
                _viewResumeButton,
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  MenuItemWidget get _viewResumeButton {
    return MenuItemWidget(
      text: "View Resume",
      iconData: Icons.search,
      onTap: () {},
    );
  }

  MenuItemWidget get _createResumeButton {
    return MenuItemWidget(
      text: "Create Resume",
      iconData: Icons.contact_page,
      onTap: () {
        NavigationService.instance.navigateTo(path: KRoute.createResumePage);
      },
    );
  }
}
