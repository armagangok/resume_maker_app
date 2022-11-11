import 'package:flutter/material.dart';

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

  AppBar get _buildAppBar {
    return AppBar(
      title: const Text("Academic"),
    );
  }
}
  