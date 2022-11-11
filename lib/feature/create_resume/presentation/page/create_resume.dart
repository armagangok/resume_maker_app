import 'package:flutter/material.dart';

import '../../../../core/extension/context_extension.dart';
import '../../../../core/navigation/constant/routes.dart';
import '../../../../core/navigation/navigation_service.dart';
import '../../../../injection_container.dart';
import '../../widget/resume_item_widget.dart';

class CreateResumePage extends StatelessWidget {
  CreateResumePage({super.key});

  // final navigation = getIt<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Resume Maker"),
      ),
      body: ListView.separated(
        padding: context.mediumPadding,
        itemCount: items.length,
        separatorBuilder: (context, index) => SizedBox(
          height: context.height(0.03),
        ),
        itemBuilder: (context, index) => items[index],
      ),
    );
  }

  final items = [
    ResumeItem(
      text: "Personal Data",
      iconData: Icons.person,
      onTap: () => getIt<NavigationService>()
          .navigateTo(path: KRoute.personalDetailPage),
    ),
    ResumeItem(
      text: "Academic",
      iconData: Icons.electric_bolt,
      onTap: () =>
          getIt<NavigationService>().navigateTo(path: KRoute.academicPage),
    ),
    ResumeItem(
      text: "Experience",
      iconData: Icons.star_purple500_outlined,
      onTap: () {},
    ),
    ResumeItem(
      text: "Reference",
      iconData: Icons.explore_outlined,
      onTap: () {},
    ),
    ResumeItem(
      text: "Skills",
      iconData: Icons.settings_accessibility_outlined,
      onTap: () =>
          getIt<NavigationService>().navigateTo(path: KRoute.skillsPage),
    ),
    ResumeItem(
      text: "Language",
      iconData: Icons.language,
      onTap: () =>
          getIt<NavigationService>().navigateTo(path: KRoute.languagePage),
    ),
  ];
}
