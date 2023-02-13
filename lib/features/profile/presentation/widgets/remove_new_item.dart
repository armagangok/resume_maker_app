import 'package:flutter/cupertino.dart';

import '../../../../core/export/export.dart';

class RemoveNewItemWidget extends StatelessWidget {
  const RemoveNewItemWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Injection.educationCubit.removeItem(0),
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
          bloc: Injection.educationCubit,
          builder: (context, state) => Row(
            children: [
              _downWidget(),
              _upWidget(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _upWidget() => Visibility(
        visible: Injection.educationCubit.checkIfOnlyUp(index),
        child: Row(
          children: [
            SizedBox(width: KPadding.width5),
            GestureDetector(
              onTap: () {},
              child: const RotatedBox(
                quarterTurns: 0,
                child: Icon(CupertinoIcons.triangle_fill),
              ),
            ),
          ],
        ),
      );

  Widget _downWidget() => Visibility(
        visible: Injection.educationCubit.checkIfOnlyDown(index),
        child: GestureDetector(
          onTap: () {},
          child: const RotatedBox(
            quarterTurns: 2,
            child: Icon(CupertinoIcons.triangle_fill),
          ),
        ),
      );
}




        // UnderlinedTextField(
        //   hintText: "Degree",
        //   controller: TextEditingController(),
        // ),
        // UnderlinedTextField(
        //   hintText: "School",
        //   controller: TextEditingController(),
        // ),
        // UnderlinedTextField(
        //   hintText: "University",
        //   controller: TextEditingController(),
        // ),
        // UnderlinedTextField(
        //   hintText: "Start Date",
        //   controller: TextEditingController(),
        // ),
        // UnderlinedTextField(
        //   hintText: "End Date",
        //   controller: TextEditingController(),
        // ),