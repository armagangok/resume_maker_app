import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:resume_maker_app/data/models/experience/experience.dart';
import 'package:resume_maker_app/data/models/qualifications/qualifications.dart';
import 'package:resume_maker_app/data/models/skills/skills.dart';
import 'package:resume_maker_app/domain/usecases/user_data_usecase.dart';

import '../../../../core/export/export.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: _bottomDivider(),
      leading: _menuButton(),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Visibility(
            visible: false,
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.menu_rounded,
                size: 45.h,
              ),
            ),
          ),
          Text(
            _getDate,
            style: context.bodyLarge.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
          GestureDetector(
            onTap: () async {
              context.cupertinoDialog(
                widget: IosChoiceDialog(
                  title: "Warning",
                  message: "Do you wish to save your changes?",
                  dialogAction: () {
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
                    for (NewItemModel phoneController
                        in Injection.phoneItemCubit.newItems) {
                      phones.add(phoneController.controller.text);
                    }
                    for (NewItemModel emailController
                        in Injection.emailItemCubit.newItems) {
                      emails.add(emailController.controller.text);
                    }
                    for (NewItemModel element
                        in Injection.linkItemCubit.newItems) {
                      links.add(element.controller.text);
                    }
                    Personal personalDataModel = Personal(
                      title: Injection
                          .personalDataCubit.professionTitleController.text,
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
                        startDate: element.startDateController!.text,
                      );
                      experiencesData.add(experienceModel);
                    }
                    List<Qualifications> qualificationData = [];

                    for (var element
                        in Injection.qualificationsCubit.newItems) {
                      var qualificationModel = Qualifications(
                        title: element.jobTitleController!.text,
                        school: element.schoolController!.text,
                        details: element.details!.text,
                      );
                      qualificationData.add(qualificationModel);
                    }

                    UserData userData = UserData(
                      personal: personalDataModel,
                      education: educationData,
                      languages: languageData,
                      skills: skillData,
                      experiences: experiencesData,
                      qualifications: qualificationData,
                    );

                    var encodedJson = json.encode(userData.toJson());

                    
                  },
                ),
              );
            },
            child: CircleAvatar(
              backgroundColor: selectedItemColor,
              child: Center(
                child: Icon(
                  CupertinoIcons.checkmark_alt,
                  color: white,
                  size: 35.h,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  PreferredSize _bottomDivider() {
    return PreferredSize(
      preferredSize: Size.fromHeight(4.0.h),
      child: Container(
        color: iconBackground,
        height: 0.5.h,
      ),
    );
  }

  GestureDetector _menuButton() {
    return GestureDetector(
      onTap: () {},
      child: Icon(
        Icons.menu_rounded,
        size: 45.h,
      ),
    );
  }

  String get _getDate {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('MMMM dd, yyyy');
    final String formatted = formatter.format(now);

    return formatted;
  }

  @override
  Size get preferredSize => Size.fromHeight(50.h);
}
