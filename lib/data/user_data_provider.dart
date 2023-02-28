import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:resume_maker_app/core/export/export.dart';

class UserDataProvider {
  UserDataProvider._() {
    prepareUserData();
  }

  static UserData _userData = const UserData();
  static UserData get getUserData => _userData;

  static Future<String> prepareUserData() async {
    var personalData = Injection.personalDataCubit;
    List<String> phones = [];
    List<String> emails = [];
    List<String> links = [];
    phones.add(personalData.phoneController.text);
    emails.add(
      personalData.linkController.text,
    );
    links.add(
      personalData.linkController.text,
    );
    for (NewItemModel phoneController in Injection.phoneItemCubit.newItems) {
      phones.add(phoneController.controller.text);
    }
    for (NewItemModel emailController in Injection.emailItemCubit.newItems) {
      emails.add(emailController.controller.text);
    }
    for (NewItemModel element in Injection.linkItemCubit.newItems) {
      links.add(element.controller.text);
    }
    Personal personalDataModel = Personal(
      title: Injection.personalDataCubit.professionTitleController.text,
      fullName: personalData.fullNameController.text,
      birthday: personalData.birthDayController.text,
      country: personalData.countryController.text,
      zipCode: personalData.zipCodeController.text,
      city: personalData.cityController.text,
      street: personalData.streetController.text,
      phones: phones,
      emails: emails,
      links: links,
      summary: personalData.summaryController.text,
      imagePath: Injection.imageCubit.imagePath,
    );

    List<Education> educationData = [];

    for (var element in Injection.educationCubit.newItems) {
      educationData.add(Education(
        degree: element.degreeController!.text,
        school: element.schoolController!.text,
        university: element.universityController!.text,
        startDate: element.startDateController!.text,
        endDate: element.endDateController!.text,
      ));
    }

    List<Language> languageData = [];
    for (var element in Injection.languageCubit.newItems) {
      languageData.add(
        Language(
          languageName: element.languageController!.text,
          writing: element.writingSliderCubit!.getText,
          reading: element.readingSliderCubit!.getText,
          speaking: element.speakingSliderCubit!.getText,
        ),
      );
    }

    List<Skills> skillData = [];

    for (var element in Injection.skillsCubit.newItems) {
      var skillModel = Skills(
        skillName: element.skillsController!.text,
        description: "",
      );
      skillData.add(skillModel);
    }

    List<Experience> experiencesData = [];

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
    List<Qualifications> qualificationData = [];

    for (var element in Injection.qualificationsCubit.newItems) {
      var qualificationModel = Qualifications(
        title: element.jobTitleController!.text,
        details: element.details!.text,
      );
      qualificationData.add(qualificationModel);
    }

    DateTime now = DateTime.now();
    String pdfId = DateFormat('yyyy-MM-dd  kk:mm').format(now);

    var pdfPathToSave = await Injection.previewCubit.createPdf(pdfId);

    UserData userData = UserData(
      personal: personalDataModel,
      education: educationData,
      languages: languageData,
      skills: skillData,
      experiences: experiencesData,
      qualifications: qualificationData,
      resumeTemplateID:
          Injection.resumeTemplateCubit.selectedTemplate.resumeTemplateID,
      pdfPath: pdfPathToSave,
    );

    var encodedJson = json.encode(userData.toJson());

    return encodedJson;
  }
}
