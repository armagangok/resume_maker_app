import 'package:flutter/material.dart';

import '../../../../core/extension/context_extension.dart';

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
        children: [
          Text(
            thReference,
            style: context.textTheme.headline5,
          ),
          Text(name),
          Text(profession),
          Text(recentCompany),
          Text(email),
          Text(phoneNumber),
        ],
      ),
    );
  }

  BoxDecoration get _decoration => const BoxDecoration(
        color: Colors.white,
      );
}
