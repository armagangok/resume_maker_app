import 'package:flutter/cupertino.dart';
import 'package:resume_maker_app/core/extension/context_extension.dart';

import '../../export/export.dart';

class NewItemWidget extends StatelessWidget {
  const NewItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Injection.newItemCubit.addNewItem();
        
      },
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
