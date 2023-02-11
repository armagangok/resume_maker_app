// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resume_maker_app/core/widget/custom_divider.dart';

import '../widgets/color_picker.dart';
import '../widgets/resume_list_view.dart';

class DesignPage extends StatefulWidget {
  const DesignPage({super.key});

  @override
  State<DesignPage> createState() => _DesignPageState();
}

class _DesignPageState extends State<DesignPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        children: const [
          ColorPickerWidget(),
          CustomDivider(),
          ResumeListViewBuilder(),
        ],
      ),
    );
  }
}
