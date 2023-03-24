import 'dart:convert';

import 'package:resume_maker_app/core/export/export.dart';

class UserDataProvider {

  UserDataProvider._();
  

  static final _resumeTemplateCubit = Injection.resumeTemplateCubit;
  static final _personalDataCubit = Injection.personalDataCubit;

  static UserData userData = const UserData(
    personal: Personal(),
    education: [],
    languages: [],
    qualifications: [],
    skills: [],
    experiences: [],
    pdfPath: "",
    resumeTemplateID: 0,
  );

  // void setUserData(UserData data) => userData = data;

  static void prepareUserData({required String pdfPathToSave}) {
    List<Education> educationData = [];
    List<Language> languageData = [];
    List<Skills> skillData = [];
    List<Experience> experiencesData = [];
    List<Qualifications> qualificationData = [];

    Personal personalDataModel = Personal(
      title: _personalDataCubit.title.text,
      fullName: _personalDataCubit.fullNameController.text,
      birthday: _personalDataCubit.birthDayController.text,
      country: _personalDataCubit.countryController.text,
      zipCode: _personalDataCubit.zipCodeController.text,
      city: _personalDataCubit.cityController.text,
      street: _personalDataCubit.streetController.text,
      phone: _personalDataCubit.phoneController.text,
      email: _personalDataCubit.emailController.text,
      link: _personalDataCubit.linkController.text,
      summary: _personalDataCubit.summaryController.text,
      imagePath: Injection.imageCubit.imagePath,
    );

    for (var element in Injection.educationCubit.newItems) {
      educationData.add(Education(
        degree: element.degreeController!.text,
        major: element.majorController!.text,
        university: element.universityController!.text,
        startDate: element.startDateController!.text,
        endDate: element.endDateController!.text,
      ));
    }

    for (var element in Injection.languageCubit.newItems) {
      languageData.add(
        Language(
          languageName: element.languageController!.text,
          languageLevel: element.languageLevelSliderCubit!.getText,
        ),
      );
    }

    for (var element in Injection.skillsCubit.newItems) {
      var skillModel = Skills(
        skillName: element.skillsController!.text,
        description: "",
      );
      skillData.add(skillModel);
    }

    for (var element in Injection.experienceCubit.newItems) {
      var experienceModel = Experience(
        company: element.companyNameController!.text,
        jobDuties: element.jobDutiesController!.text,
        jobTitle: element.jobTitleController!.text,
        endDate: element.jobEndDateController!.text,
        startDate: element.jobStartDateController!.text,
      );
      experiencesData.add(experienceModel);
    }

    for (var element in Injection.qualificationsCubit.newItems) {
      var qualificationModel = Qualifications(
        title: element.jobTitleController!.text,
        details: element.details!.text,
      );
      qualificationData.add(qualificationModel);
    }

    userData = UserData(
      personal: personalDataModel,
      education: educationData,
      languages: languageData,
      skills: skillData,
      experiences: experiencesData,
      qualifications: qualificationData,
      resumeTemplateID: _resumeTemplateCubit.selectedTemplate.resumeTemplateID,
      pdfPath: pdfPathToSave,
    );
  }
static  String encodeUserData() => json.encode(userData.toJson());
}
