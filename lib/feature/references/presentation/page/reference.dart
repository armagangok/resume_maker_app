import 'package:flutter/material.dart';
import 'package:resume_maker_app/global/widget/custom_appbar.dart';

class ReferencesPage extends StatelessWidget {
  const ReferencesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: const Text("References"),
        onTapUpdate: () {},
      ),
    );
  }
}
