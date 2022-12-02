import '../../../../feature/education/education_export.dart';
import '../../../../feature/experience/data/model/experience_model.dart';
import '../../../../feature/language/data/model/language_model.dart';
import '../../../../feature/personal_details/data/contract/personal_data_repository.dart';
import '../../../../feature/personal_details/data/model/personal_data_model.dart';
import '../../../../feature/references/data/model/reference_model.dart';
import '../../../../feature/skills/data/model/skill_model.dart';

void initializeRepositories({
  required PersonalDataRepository personalDataRepo,
  required experienceRepo,
  required academicDataRepo,
  required referenceRepo,
  required languageRepo,
  required skillRepo,
  required List<ExperienceModel>? experienceList,
  required List<EducationDataModel>? academicDataList,
  required List<ReferenceModel>? referenceDataList,
  required List<LanguageModel>? languageList,
  required List<SkillModel>? skillsList,
  required PersonalDataModel? personalDataModel,
}) {
  personalDataRepo.fetchPersonalData().then(
        (value) => value.fold(
          (failure) => LogHelper.shared.debugPrint("$failure"),
          (data) {
            personalDataModel = data;
          },
        ),
      );

  experienceRepo.fetchExperienceData().then(
        (value) => value.fold(
          (failure) async =>
              (failure) => LogHelper.shared.debugPrint("$failure"),
          (data) => experienceList = data,
        ),
      );

  academicDataRepo.fetchData().then(
        (value) => value.fold(
          (failure) => LogHelper.shared.debugPrint("$failure"),
          (r) => academicDataList = r,
        ),
      );

  referenceRepo.fetchReferenceData().then(
        (value) => value.fold(
          (failure) => LogHelper.shared.debugPrint("$failure"),
          (r) => referenceDataList = r,
        ),
      );

  languageRepo.fetchLanguageData().then(
        (value) => value.fold(
          (failure) => LogHelper.shared.debugPrint("$failure"),
          (data) => languageList = data,
        ),
      );

  skillRepo.fetchSkillData().then(
        (value) => value.fold(
          (failure) => LogHelper.shared.debugPrint("$failure"),
          (r) => skillsList = r,
        ),
      );
}
