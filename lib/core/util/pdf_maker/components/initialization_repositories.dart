import '../../../../feature/education/education_export.dart';
import '../../../../feature/experience/data/model/experience_model.dart';
import '../../../../feature/language/data/model/language_model.dart';
import '../../../../feature/personal_details/data/model/personal_data_model.dart';
import '../../../../feature/references/data/model/reference_model.dart';
import '../../../../feature/skills/data/model/skill_model.dart';
import '../../../../data/contracts/database_contract.dart';
import '../../hive/hive_keys.dart';
import '../../logger.dart';

void initializeRepositories({
  required DatabaseContract repo,
  required List<ExperienceModel>? experienceList,
  required List<EducationDataModel>? academicDataList,
  required List<ReferenceModel>? referenceDataList,
  required List<LanguageModel>? languageList,
  required List<SkillModel>? skillsList,
  required PersonalDataModel? personalDataModel,
}) {
  repo.fetchData(boxName: HiveBoxes.personalDataBox).then(
        (value) => value.fold(
          (failure) => LogHelper.shared.debugPrint("$failure"),
          (data) {
            personalDataModel = data;
          },
        ),
      );

  repo.fetchData(boxName: HiveBoxes.experienceDataBox).then(
        (value) => value.fold(
          (failure) async =>
              (failure) => LogHelper.shared.debugPrint("$failure"),
          (data) => experienceList = data,
        ),
      );

  repo.fetchData(boxName: HiveBoxes.academicDataBox).then(
        (value) => value.fold(
          (failure) => LogHelper.shared.debugPrint("$failure"),
          (r) => academicDataList = r,
        ),
      );

  repo.fetchData(boxName: HiveBoxes.referenceDataBox).then(
        (value) => value.fold(
          (failure) => LogHelper.shared.debugPrint("$failure"),
          (r) => referenceDataList = r,
        ),
      );

  repo.fetchData(boxName: HiveBoxes.languageDataBox).then(
        (value) => value.fold(
          (failure) => LogHelper.shared.debugPrint("$failure"),
          (data) => languageList = data,
        ),
      );

  repo.fetchData(boxName: HiveBoxes.skillDataBox).then(
        (value) => value.fold(
          (failure) => LogHelper.shared.debugPrint("$failure"),
          (r) => skillsList = r,
        ),
      );
}
