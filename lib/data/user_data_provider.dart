// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_final_fields

import 'dart:convert';

import 'package:resume_maker_app/core/export/export.dart';

class UserDataProvider {
  UserDataProvider._();
  static final instance = UserDataProvider._();

  final _resumeTemplateCubit = Injection.resumeTemplateCubit;
  final _personalDataCubit = Injection.personalDataCubit;

  UserData _userData = const UserData(
    personal: Personal(),
    education: [],
    languages: [],
    qualifications: [],
    skills: [],
    experiences: [],
    pdfPath: "",
    resumeTemplateID: 0,
  );

  UserData get getUserData => _userData;

  void prepareUserData({required String pdfPathToSave}) {
    List<Education> educationData = [];
    List<Language> languageData = [];
    List<Skills> skillData = [];
    List<Experience> experiencesData = [];
    List<Qualifications> qualificationData = [];

    Personal personalDataModel = Personal(
      title: _personalDataCubit.professionTitleController.text,
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
          // writing: element.writingSliderCubit!.getText,
          languageLevel: element.languageLevelSliderCubit!.getText,
          // speaking: element.speakingSliderCubit!.getText,
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

    _userData = UserData(
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

  encodeUserData() {
    var encodedJson = json.encode(_userData.toJson());
    return encodedJson;
  }
}
