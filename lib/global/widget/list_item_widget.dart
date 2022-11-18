import 'package:flutter/material.dart';

import '../../feature/home/presentation/widget/export.dart';

class ListItemWidget extends StatelessWidget {
  final String text;
  final int index;
  final Function onTap;

  const ListItemWidget({
    Key? key,
    required this.text,
    required this.index,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decorationRadius13,
      // color: Colors.grey[50],
      child: Row(
        children: [
          Checkbox(
            value: true,
            onChanged: (val) {},
          ),
          Text(text),
          const Spacer(),
          InkWell(
            child: const Icon(Icons.delete),
            onTap: () => onTap(),
          ),
        ],
      ),
    );
  }
}
