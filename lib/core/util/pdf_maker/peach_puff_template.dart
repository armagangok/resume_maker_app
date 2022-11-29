// ignoreforfile: avoidprint

import 'dart:io';

import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

import '../../../feature/academic/academic_export.dart';
import '../../../feature/experience/data/contract/experience_repository.dart';
import '../../../feature/experience/data/model/experience_model.dart';
import '../../../feature/language/data/contract/language_repository.dart';
import '../../../feature/language/data/model/language_model.dart';
import '../../../feature/personal_details/data/contract/personal_data_repository.dart';
import '../../../feature/personal_details/data/model/personal_data_model.dart';
import '../../../feature/references/data/contract/reference_repository.dart';
import '../../../feature/references/data/model/reference_model.dart';
import '../../../feature/skills/data/contract/language_repository.dart';
import '../../../feature/skills/data/model/skill_model.dart';

// const String path = 'assets/person.png';

class PeachPuffTemplate {
  PeachPuffTemplate({
    required ExperienceRepository experienceRepository,
    required PersonalDataRepository personalDataRepository,
    required AcademicDataRepository academicDataRepository,
    required ReferenceRepository referenceRepository,
    required LanguageRepository languageRepository,
    required SkillRepository skillRepository,
  }) {
    experienceRepo = experienceRepository;
    personalDataRepo = personalDataRepository;
    academicDataRepo = academicDataRepository;
    referenceRepo = referenceRepository;
    languageRepo = languageRepository;
    skillRepo = skillRepository;

    initializeRepositories();
  }

  late final ExperienceRepository experienceRepo;
  List<ExperienceModel>? experienceList;

  late final PersonalDataRepository personalDataRepo;
  late PersonalDataModel personalDataModel;

  late final AcademicDataRepository academicDataRepo;
  List<AcademicDataModel>? academicDataModel;

  late final ReferenceRepository referenceRepo;
  List<ReferenceModel>? referenceDataList;

  late final LanguageRepository languageRepo;
  List<LanguageModel>? languageList;

  late final SkillRepository skillRepo;
  List<SkillModel>? skillsList;

  final pdf = pw.Document();

  Future<Uint8List> createPdf() async {
    // pw.ThemeData myTheme = pw.ThemeData.withFont(
    //   base: Font.ttf(
    //     await rootBundle.load("assets/fonts/Lato/Lato-Regular.ttf"),
    //   ),
    // );

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.letter.copyWith(
          marginTop: 0,
          marginLeft: 0,
          marginRight: 0,
          marginBottom: 0,
        ),
        build: (pw.Context context) {
          return pw.Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              leftContainer(),
              rightContainer(),
            ],
          );
        },
      ),
    );
    return await pdf.save();
  }

  pw.Widget leftContainer() {
    return pw.Container(
      padding: pw.EdgeInsets.symmetric(
        horizontal: width * 0.02,
      ),
      width: width * 0.4,
      color: PdfColors.amber50,
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          personalDataModel.imagePath.isEmpty
              ? getPersonImage(uint8ListData)
              : getPersonImage1(personalDataModel.imagePath),
          sizedBox015,
          personalDataModel == null
              ? SizedBox()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    pw.Row(
                      children: [
                        head1Text("CONTACT"),
                      ],
                    ),
                    contactText(personalDataModel: personalDataModel),
                  ],
                ),
          sizedBox015,
          languageList == null
              ? SizedBox()
              : pw.Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    head1Text("LANGUAGES"),
                    languagesText(languageList: languageList!),
                    sizedBox015,
                  ],
                ),
          skillsList == null
              ? pw.SizedBox()
              : pw.Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    head1Text("SKILLS"),
                    skillText(skills: skillsList!),
                  ],
                ),
          sizedBox015,
        ],
      ),
    );
  }

  pw.Expanded rightContainer() {
    return pw.Expanded(
      child: pw.Container(
        padding: const pw.EdgeInsets.only(
          top: 20,
          right: 20,
          left: 20,
        ),
        color: PdfColors.white,
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            personalDataModel == null
                ? SizedBox()
                : nameText(personalDataModel.name),
            sizedBox015,
            personalDataModel == null
                ? pw.SizedBox()
                : pw.Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      head1Text("ABOUT ME"),
                      customDivider(),
                      aboutMeText(aboutMeText: personalDataModel.aboutMeText)
                    ],
                  ),
            sizedBox015,
            academicDataModel == null
                ? SizedBox()
                : pw.Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      head1Text("ACADEMIC"),
                      customDivider(),
                      academicText(academicDataList: academicDataModel!),
                    ],
                  ),
            sizedBox015,
            experienceList == null
                ? SizedBox()
                : pw.Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      head1Text("EXPERIENCE"),
                      customDivider(),
                      experienceText(experienceList: experienceList!),
                    ],
                  ),
            sizedBox015,
            referenceDataList == null
                ? SizedBox()
                : pw.Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      head1Text("REFERENCE"),
                      customDivider(),
                      referenceText(referenceList: referenceDataList!),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  Future<void> savePdfFile(
    String fileName,
    Uint8List byteList,
  ) async {
    final output = await getTemporaryDirectory();
    var filePath = "${output.path}/$fileName.pdf";

    final file = File(filePath);
    try {
      await file.writeAsBytes(byteList);
      await OpenFile.open(filePath);
    } catch (e) {
      print("$e");
    }
  }

  void initializeRepositories() {
    personalDataRepo.fetchPersonalData().then(
          (value) => value.fold(
            (failure) => LogHelper.shared.debugPrint("$failure"),
            (data) {
              personalDataModel = data;
              getImageBytes(data.imagePath)
                  .then((value) => uint8ListData = value);
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

    academicDataRepo.fetchAcademicData().then(
          (value) => value.fold(
            (failure) => LogHelper.shared.debugPrint("$failure"),
            (r) => academicDataModel = r,
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
}

// "I have been learning and implementing Flutter for the last year. I recently use Feature Based Clean Architecture and Cubit state management to deal with my projects."