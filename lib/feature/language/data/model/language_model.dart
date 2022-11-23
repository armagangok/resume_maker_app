import 'package:hive/hive.dart';

part 'language_model.g.dart';
@HiveType(typeId: 3)
class LanguageModel extends HiveObject{
  @HiveField(0)
  final String language;
  LanguageModel({required this.language});
}
