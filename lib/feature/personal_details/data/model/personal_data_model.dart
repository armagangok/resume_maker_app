import 'package:hive/hive.dart';

part 'personal_data_model.g.dart';

@HiveType(typeId: 1)
class PersonalDataModel extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String location;
  @HiveField(2)
  final String phoneNumber;
  @HiveField(3)
  final String email;
  @HiveField(4)
  final String linkedin;
  @HiveField(5)
  final String birthday;
  @HiveField(6)
  final String imagePath;

  PersonalDataModel({
    required this.name,
    required this.location,
    required this.phoneNumber,
    required this.email,
    required this.linkedin,
    required this.birthday,
    required this.imagePath,
  });
}
