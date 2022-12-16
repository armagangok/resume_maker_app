import 'package:flutter/material.dart';

import '../../../../core/constant/padding_constant.dart';
import '../../../../core/constant/shape_constant.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../core/widget/export.dart';
import '../../model/academic_data_model.dart';

class AcademicItemWidget extends StatelessWidget {
  const AcademicItemWidget({
    super.key,
    required this.academicData,
    required this.index,
    required this.onLongPress,
  });

  final int index;
  final AcademicDataModel academicData;
  final Function onLongPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () => onLongPress(),
      child: Container(
        decoration: decorationRadius13,
        // height: context.height(0.1),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ItemPadding(
              widget: Text(
                "${index + 1}th Education",
                style: context.textTheme.headline5,
              ),
            ),
            const CustomDivider(),
            ItemPadding(widget: Text("University: ${academicData.university}")),
            const CustomDivider(),
            ItemPadding(widget: Text("Major: ${academicData.major}")),
            const CustomDivider(),
            ItemPadding(
                widget: Text("Scholarship: ${academicData.scholarship}")),
            const CustomDivider(),
            ItemPadding(widget: Text("Academic data: ${academicData.grade}")),
            const CustomDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ItemPadding(
                  widget: Text(
                    "Start date: ${academicData.schoolStartDate}",
                  ),
                ),
                const Spacer(),
                // const CustomDivider(),
                ItemPadding(
                  widget: Text(
                    "End date: ${academicData.schoolEndDate}",
                  ),
                ),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}