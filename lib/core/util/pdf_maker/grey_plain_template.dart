// ignoreforfile: avoidprint

import 'dart:io';
import 'dart:typed_data';

import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';
import 'package:resume_maker_app/core/util/hive/hive_keys.dart';

import '../../../data/contracts/database_contract.dart';
import '../../../feature/education/data/model/education_model.dart';
import '../../../feature/experience/data/model/experience_model.dart';
import '../../../feature/language/data/model/language_model.dart';
import '../../../feature/personal_details/data/model/personal_data_model.dart';
import '../../../feature/references/data/model/reference_model.dart';
import '../../../feature/skills/data/model/skill_model.dart';
import '../logger.dart';
import 'components/pdf_components.dart';

// const String path = 'assets/person.png';

class GreyPlainTemplate {
  GreyPlainTemplate({
    required DatabaseContract experienceRepository,
    required DatabaseContract personalDataRepository,
    required DatabaseContract academicDataRepository,
    required DatabaseContract referenceRepository,
    required DatabaseContract languageRepository,
    required DatabaseContract skillRepository,
  }) {
    experienceRepo = experienceRepository;
    personalDataRepo = personalDataRepository;
    academicDataRepo = academicDataRepository;
    referenceRepo = referenceRepository;
    languageRepo = languageRepository;
    skillRepo = skillRepository;

    initializeRepositories();
  }

  late final DatabaseContract experienceRepo;
  List<ExperienceModel>? experienceList;

  late final DatabaseContract personalDataRepo;
  late PersonalDataModel personalDataModel;

  late final DatabaseContract academicDataRepo;
  List<EducationDataModel>? educationModel;

  late final DatabaseContract referenceRepo;
  List<ReferenceModel>? referenceDataList;

  late final DatabaseContract languageRepo;
  List<LanguageModel>? languageList;

  late final DatabaseContract skillRepo;
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
          marginLeft: 20,
          marginRight: 0,
          marginBottom: 0,
        ),
        theme: pw.ThemeData.withFont(
          base: await PdfGoogleFonts.varelaRoundRegular(),
          bold: await PdfGoogleFonts.varelaRoundRegular(),
          icons: await PdfGoogleFonts.materialIcons(),
        ),
        build: (pw.Context context) {
          return pw.Row(
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

  pw.Widget rightContainer() {
    return pw.Container(
      padding: pw.EdgeInsets.symmetric(
        horizontal: width * 0.02,
        vertical: width * 0.02,
      ),
      width: width * 0.4,
      color: PdfColors.grey300,
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          personalDataModel.imagePath.isEmpty
              ? SizedBox()
              : getPersonImage1(personalDataModel.imagePath),
          sizedBox015,
          pw.Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              educationModel == null
                  ? SizedBox()
                  : pw.Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        whiteHeadContainer(
                          column: head1Text("EDUCATION"),
                        ),
                        educationText(educationList: educationModel!),
                      ],
                    ),
              sizedBox015,
              languageList == null
                  ? SizedBox()
                  : pw.Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        whiteHeadContainer(column: head1Text("LANGUAGES")),
                        languagesText(languageList: languageList!),
                        sizedBox015,
                      ],
                    ),
              skillsList == null
                  ? pw.SizedBox()
                  : pw.Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        whiteHeadContainer(
                          column: head1Text("SKILLS"),
                        ),
                        skillText(skills: skillsList!),
                      ],
                    ),
              sizedBox015,
              personalDataModel == null
                  ? SizedBox()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        pw.Row(
                          children: [
                            whiteHeadContainer(
                              column: head1Text("CONTACT"),
                            ),
                          ],
                        ),
                        contactText(personalDataModel: personalDataModel),
                      ],
                    ),
            ],
          ),
        ],
      ),
    );
  }

  pw.Expanded leftContainer() {
    return pw.Expanded(
      child: pw.Container(
        padding: const pw.EdgeInsets.only(
          top: 20,
          right: 20,
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
            referenceDataList == null
                ? SizedBox()
                : pw.Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      head1Text("REFERENCE"),
                      customDivider(),
                      // referenceModel(referenceList: referenceDataList!),
                    ],
                  ),
            sizedBox015,
            // experienceList == null
            //     ? SizedBox()
            //     : pw.Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           head1Text("EXPERIENCE"),
            //           customDivider(),
            //           experienceWidget(experienceModel: experienceList!),
            //         ],
            //       ),
            // sizedBox015,
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
    personalDataRepo.fetchData(boxName: HiveBoxes.personalDataBox).then(
          (value) => value.fold(
            (failure) => LogHelper.shared.debugPrint("$failure"),
            (data) {
              personalDataModel = data;
              // getImageBytes(data.imagePath)
              //     .then((value) => uint8ListData = value);
            },
          ),
        );

    experienceRepo.fetchData(boxName: HiveBoxes.experienceDataBox).then(
          (value) => value.fold(
            (failure) async =>
                (failure) => LogHelper.shared.debugPrint("$failure"),
            (data) => experienceList = data,
          ),
        );

    academicDataRepo.fetchData(boxName: HiveBoxes.educationDataBox).then(
          (value) => value.fold(
            (failure) => LogHelper.shared.debugPrint("$failure"),
            (r) => educationModel = r,
          ),
        );

    referenceRepo.fetchData(boxName: HiveBoxes.referenceDataBox).then(
          (value) => value.fold(
            (failure) => LogHelper.shared.debugPrint("$failure"),
            (r) => referenceDataList = r,
          ),
        );

    languageRepo.fetchData(boxName: HiveBoxes.languageDataBox).then(
          (value) => value.fold(
            (failure) => LogHelper.shared.debugPrint("$failure"),
            (data) => languageList = data,
          ),
        );

    skillRepo.fetchData(boxName: HiveBoxes.skillDataBox).then(
          (value) => value.fold(
            (failure) => LogHelper.shared.debugPrint("$failure"),
            (r) => skillsList = r,
          ),
        );
  }
}

// "I have been learning and implementing Flutter for the last year. I recently use Feature Based Clean Architecture and Cubit state management to deal with my projects."