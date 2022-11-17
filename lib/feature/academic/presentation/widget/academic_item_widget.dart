import 'package:flutter/material.dart';
import 'package:resume_maker_app/feature/home/presentation/widget/export.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../global/widget/export.dart';

import '../../model/academic_data_model.dart';

class AcademicItemWidget extends StatelessWidget {
  const AcademicItemWidget({
    super.key,
    required this.academicData,
    required this.index,
  });

  final int index;
  final AcademicDataModel academicData;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          ItemPadding(widget: Text("University: ${academicData.university}")),
          const CustomDivider(),
          ItemPadding(widget: Text("Major: ${academicData.major}")),
          const CustomDivider(),
          ItemPadding(widget: Text("Scholarship: ${academicData.scholarship}")),
          const CustomDivider(),
          ItemPadding(widget: Text("Academic data: ${academicData.grade}")),
          const CustomDivider(),
          FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ItemPadding(
                  widget: Text(
                    "Start date: ${academicData.schoolCareerDate.startDate.year}",
                  ),
                ),
                // const CustomDivider(),
                ItemPadding(
                  widget: Text(
                      "End date: ${academicData.schoolCareerDate.endDate.year}"),
                ),
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}

class ItemPadding extends StatelessWidget {
  const ItemPadding({super.key, required this.widget});
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.lowPadding,
      child: widget,
    );
  }
}
