import 'package:flutter/material.dart';

import '../../../../core/constant/shape_constant.dart';
import '../../../../core/extension/context_extension.dart';
import '../../data/model/project_model.dart';

class ProjectItemWidget extends StatelessWidget {
  const ProjectItemWidget({
    super.key,
    required this.projectModel,
    required this.onLongPress,
  });

  final ProjectModel projectModel;
  final Function onLongPress;

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
            _projectNameText,
            SizedBox(height: context.normalHeight),
            _descriptionText,
            SizedBox(height: context.normalHeight),
            _sourceText,
            SizedBox(height: context.normalHeight),
          ],
        ),
      ),
    );
  }

  Text get _sourceText => Text("Source Link: ${projectModel.sourceLink}");

  Text get _descriptionText =>
      Text("Project Description: ${projectModel.description}");

  Text get _projectNameText => Text(
        "Project Name: ${projectModel.projectName}",
      );
}
