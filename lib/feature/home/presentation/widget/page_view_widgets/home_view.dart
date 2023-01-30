import 'package:flutter/material.dart';

class HomeViewWidget extends StatelessWidget {
  const HomeViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemBuilder: ((context, index) {
        return const ResumeItemWidget();
      }),
    );
  }
}

class ResumeItemWidget extends StatelessWidget {
  const ResumeItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
