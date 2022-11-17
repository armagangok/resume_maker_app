import 'package:flutter/material.dart';
import 'package:resume_maker_app/global/widget/custom_appbar.dart';

class AcademicPage extends StatelessWidget {
  const AcademicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
      body: _buidlBody,
    );
  }

  Widget get _buidlBody => ListView(
        children: const [],
      );

  CustomAppBar get _buildAppBar {
    return CustomAppBar(
      title: const Text("Academic"),
      onTapUpdate: () {},
    );
  }
}
