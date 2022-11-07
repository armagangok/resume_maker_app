import 'package:flutter/material.dart';

import '../../../../core/extension/context_extension.dart';
import '../../widget/resume_item_widget.dart';

class CreateResumePage extends StatelessWidget {
  CreateResumePage({super.key});

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
    const ResumeItem(
      text: "Personal Data",
      iconData: Icons.person,
    ),
    const ResumeItem(
      text: "Academic",
      iconData: Icons.electric_bolt,
    ),
    const ResumeItem(
      text: "Experience",
      iconData: Icons.star_purple500_outlined,
    ),
    const ResumeItem(
      text: "Reference",
      iconData: Icons.explore_outlined,
    ),
    const ResumeItem(
      text: "Skills",
      iconData: Icons.settings_accessibility_outlined,
    ),
    const ResumeItem(
      text: "Language",
      iconData: Icons.language,
    ),
  ];
}
