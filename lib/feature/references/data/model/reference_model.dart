import 'package:hive/hive.dart';

part 'reference_model.g.dart';

@HiveType(typeId: 4)
class ReferenceModel extends HiveObject {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? profession;
  @HiveField(2)
  String? recentCompany;
  @HiveField(3)
  String? email;
  @HiveField(4)
  String? phoneNumber;

  ReferenceModel({
    required this.name,
    required this.profession,
    required this.email,
    required this.phoneNumber,
    required this.recentCompany,
  });
}
