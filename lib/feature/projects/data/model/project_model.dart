// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';
part 'project_model.g.dart';

@HiveType(typeId: 30)
class ProjectModel extends HiveObject {
  @HiveField(0)
  final String projectName;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final String sourceLink;

  ProjectModel({
    required this.projectName,
    required this.description,
    required this.sourceLink,

  });
}
