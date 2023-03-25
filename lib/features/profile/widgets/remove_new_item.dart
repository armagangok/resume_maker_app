// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';

import '../../../../core/export/export.dart';

class RemoveNewItemWidget extends StatelessWidget {
  const RemoveNewItemWidget({
    Key? key,
    required this.itemID,
    required this.cubit,
  }) : super(key: key);

  final String itemID;
  final dynamic cubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            cubit.removeItem(itemID);
          },
          child: Row(
            children: [
              const Icon(
                CupertinoIcons.minus_circle_fill,
                color: deleteRedColor,
              ),
              SizedBox(
                width: KPadding.width20,
              ),
              Text(
                "Delete",
                style: context.bodyLarge.copyWith(color: white),
              ),
            ],
          ),
        ),
        BlocBuilder<MultipleItemCubit, MultipleItemState>(
          bloc: cubit,
          builder: (context, state) {
            return Row(
              children: [
                _downWidget(),
                _upWidget(),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _upWidget() => Visibility(
        visible: cubit.checkIfOnlyUp(getIndex()),
        child: Row(
          children: [
            SizedBox(width: KPadding.width5),
            GestureDetector(
              onTap: () {},
              child: const Icon(CupertinoIcons.triangle_fill),
            ),
          ],
        ),
      );

  Widget _downWidget() => Visibility(
        visible: cubit.checkIfOnlyDown(getIndex()),
        child: GestureDetector(
          onTap: () {},
          child: const RotatedBox(
            quarterTurns: 2,
            child: Icon(CupertinoIcons.triangle_fill),
          ),
        ),
      );

  getIndex() {
    for (var element in cubit.newItems) {
      if (element.itemID == itemID) {
        int index = cubit.newItems.indexOf(element);
        return index;
      }
    }
  }
}