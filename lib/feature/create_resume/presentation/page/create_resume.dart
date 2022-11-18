import 'package:flutter/material.dart';

import '../../../../core/extension/context_extension.dart';
import '../../../../core/navigation/constant/routes.dart';
import '../../../../core/navigation/navigation_service.dart';
import '../../../../core/widget/custom_appbar.dart';
import '../../../../injection_container.dart';
import '../widget/resume_item_widget.dart';

class CreateResumePage extends StatefulWidget {
  const CreateResumePage({super.key});

  @override
  State<CreateResumePage> createState() => _CreateResumePageState();
}

class _CreateResumePageState extends State<CreateResumePage> {
  // final navigation = getIt<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
      body: _buildBody(),
    );
  }

  ListView _buildBody() {
    return ListView.separated(
      padding: context.mediumPadding,
      itemCount: items.length,
      separatorBuilder: (context, index) => SizedBox(
        height: context.height(0.03),
      ),
      itemBuilder: (context, index) => items[index],
    );
  }

  CustomAppBar get _buildAppBar => CustomAppBar(
        title: const Text("Resume Maker"),
        onTapUpdate: () {},
      );

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
      text: "Experiences",
      iconData: Icons.star_purple500_outlined,
      onTap: () =>
          getIt<NavigationService>().navigateTo(path: KRoute.experiencesPage),
    ),
    ResumeItem(
      text: "References",
      iconData: Icons.explore_outlined,
      onTap: () =>
          getIt<NavigationService>().navigateTo(path: KRoute.referencesPage),
    ),
    ResumeItem(
      text: "Skills",
      iconData: Icons.settings_accessibility_outlined,
      onTap: () =>
          getIt<NavigationService>().navigateTo(path: KRoute.skillsPage),
    ),
    ResumeItem(
      text: "Languages",
      iconData: Icons.language,
      onTap: () =>
          getIt<NavigationService>().navigateTo(path: KRoute.languagePage),
    ),
  ];
}
