import 'package:flutter/material.dart';

import '../../../../core/extension/context_extension.dart';
import '../../../../global/widget/custom_divider.dart';

class ReferenceItemWidget extends StatelessWidget {
  const ReferenceItemWidget({
    super.key,
    required this.thReference,
    required this.name,
    required this.profession,
    required this.recentCompany,
    required this.email,
    required this.phoneNumber,
  });

  final String thReference;
  final String name;
  final String profession;
  final String recentCompany;
  final String email;
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _decoration,
      width: context.width(1),
      // height: context.height(0.08),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          padding(Text(
            "$thReference. Reference",
            style: context.textTheme.headline5,
          )),
          const CustomDivider(),
          padding(Text(name)),
          const CustomDivider(),
          padding(Text(profession)),
          const CustomDivider(),
          padding(Text(recentCompany)),
          const CustomDivider(),
          padding(Text(email)),
          const CustomDivider(),
          padding(Text(phoneNumber)),
        ],
      ),
    );
  }

  Widget padding(Widget widget) => Builder(builder: (context) {
        return Padding(
          padding: context.lowPadding,
          child: widget,
        );
      });

  BoxDecoration get _decoration => const BoxDecoration(
        color: Colors.white,
      );
}
