import 'package:hive_flutter/hive_flutter.dart';

import '../../../../feature/academic/academic_export.dart';
import '../../../../feature/experience/data/model/experience_model.dart';
import '../../../../feature/language/data/model/language_model.dart';
import '../../../../feature/personal_details/data/model/personal_data_model.dart';
import '../../../../feature/references/data/model/reference_model.dart';
import '../../../../feature/skills/data/model/skill_model.dart';

class HiveHelper {
  HiveHelper._();

  static final shared = HiveHelper._();

  Future<void> initializeHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(AcademicDataModelAdapter());
    Hive.registerAdapter(PersonalDataModelAdapter());
    Hive.registerAdapter(ExperienceModelAdapter());
    Hive.registerAdapter(LanguageModelAdapter());
    Hive.registerAdapter(ReferenceModelAdapter());
    Hive.registerAdapter(SkillModelAdapter());

    await Hive.openBox<AcademicDataModel>(HiveBoxes.academicDataBox);
    await Hive.openBox<ExperienceModel>(HiveBoxes.experienceDataBox);
    await Hive.openBox<PersonalDataModel>(HiveBoxes.personalDataBox);
    await Hive.openBox<LanguageModel>(HiveBoxes.languageDataBox);
    await Hive.openBox<ReferenceModel>(HiveBoxes.referenceDataBox);
    await Hive.openBox<SkillModel>(HiveBoxes.skillDataBox);
  }

  Future<T?> getData<T>(String boxName, dynamic key) async {
    var box = Hive.box<T>(boxName);
    return box.get(key);
  }

  Future<void> deleteData<T>(String boxName, dynamic key) async {
    var box = Hive.box<T>(boxName);
    await box.delete(key);
  }

  Future<void> deleteDataAt<T>(String boxName, int index) async {
    var box = Hive.box<T>(boxName);
    await box.deleteAt(index);
  }

  Future<void> deleteAll<T>(String boxName, Iterable<dynamic> keys) async {
    var box = Hive.box<T>(boxName);
    await box.deleteAll(keys);
  }

  Future<void> putData<T>(String boxName, dynamic key, T data) async {
    var box = Hive.box<T>(boxName);
    await box.put(key, data);
  }

  Future<void> putAllData<T>(String boxName, Map<dynamic, T> data) async {
    var box = Hive.box<T>(boxName);
    await box.putAll(data);
  }

  Future<List<T>> getAll<T>(String boxName) async {
    var box = Hive.box<T>(boxName);
    return box.values.toList();
  }

  Future<int> addData<T>(String boxName, T dataToAdd) async {
    var box = Hive.box<T>(boxName);
    return box.add(dataToAdd);
  }

  Future<void> clearBox<T>(String boxName) async {
    var box = Hive.box<T>(boxName);
    await box.clear();
  }
}
