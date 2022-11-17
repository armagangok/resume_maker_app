import 'package:flutter/material.dart';

import '../../../../core/extension/context_extension.dart';
import '../../../../global/constant/shape_constant.dart';
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
    required this.onLongTap,
  });

  final String thReference;
  final String name;
  final String profession;
  final String recentCompany;
  final String email;
  final String phoneNumber;
  final Function onLongTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () => onLongTap(),
      child: Container(
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
            padding(Text("Name: $name")),
            const CustomDivider(),
            padding(Text("Profession: $profession")),
            const CustomDivider(),
            padding(Text("Recent Company: $recentCompany")),
            const CustomDivider(),
            padding(Text("Email: $email")),
            const CustomDivider(),
            padding(Text("Phone Number: $phoneNumber")),
          ],
        ),
      ),
    );
  }

  Widget padding(Widget widget) => Builder(
        builder: (context) {
          return Padding(
            padding: context.normalPadding,
            child: widget,
          );
        },
      );

  BoxDecoration get _decoration => const BoxDecoration(
        borderRadius: BorderRadius.all(radius13),
        color: Colors.white,
      );
}
