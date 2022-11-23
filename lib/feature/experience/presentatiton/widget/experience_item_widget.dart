import 'package:flutter/material.dart';

import '../../../../core/constant/shape_constant.dart';
import '../../../../core/extension/context_extension.dart';
import '../../data/model/experience_model.dart';

class ExperienceItemWidget extends StatelessWidget {
  const ExperienceItemWidget({
    super.key,
    required this.experienceModel,
    required this.onLongPress,
  });

  final ExperienceModel experienceModel;
  final onLongPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () => onLongPress(),
      child: Container(
        decoration: decorationRadius13,
        padding: context.normalPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _companyNameText,
            _jobRoleText,
            _professionText,
            _jobTypeText,
            _jobWorkDateTexts,
          ],
        ),
      ),
    );
  }

  Widget get _jobWorkDateTexts {
    return Builder(builder: (context) {
      return Row(
        children: [
          SizedBox(
            width: context.width(0.4),
            child: Text("Start date: ${experienceModel.jobStartDate}"),
          ),
          SizedBox(
            width: context.width(0.4),
            child: Text("End date: ${experienceModel.jobEndDate}"),
          ),
        ],
      );
    });
  }

  Text get _jobTypeText => Text("Job type: ${experienceModel.jobType}");

  Text get _professionText =>
      Text("Profession:  ${experienceModel.profession}");

  Text get _jobRoleText => Text("Job role: ${experienceModel.jobRole}");

  Text get _companyNameText => Text(
        "Company name: ${experienceModel.companyName}",
      );
}
