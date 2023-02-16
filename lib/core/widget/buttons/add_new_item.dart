// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';

import '../../export/export.dart';

class NewItemWidget extends StatelessWidget {
  const NewItemWidget({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Row(
        children: [
          const Icon(
            CupertinoIcons.add_circled_solid,
            color: white,
          ),
          SizedBox(
            width: KPadding.width20,
          ),
          Text(
            "Add New Item",
            style: context.bodyLarge.copyWith(color: white),
          )
        ],
      ),
    );
  }
}
