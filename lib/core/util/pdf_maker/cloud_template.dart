import 'dart:io';
import 'dart:typed_data';

import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../../data/contracts/database_contract.dart';
import '../../../feature/education/data/model/education_model.dart';
import '../../../feature/experience/data/model/experience_model.dart';
import '../../../feature/language/data/model/language_model.dart';
import '../../../feature/personal_details/data/model/personal_data_model.dart';
import '../../../feature/projects/data/model/project_model.dart';
import '../../../feature/references/data/model/reference_model.dart';
import '../../../feature/skills/data/model/skill_model.dart';
import '../hive/hive_keys.dart';
import '../logger.dart';
import 'components/pdf_components.dart';

// const String path = 'assets/person.png';

class CloudTemplate {
  CloudTemplate({
    required DatabaseContract repo,
  }) {
    myRepo = repo;

    initializeRepositories();
  }

  List<pw.Widget> widgets = [];

  late final DatabaseContract myRepo;
  List<ExperienceModel>? experienceList;
  PersonalDataModel? personalDataModel;
  List<EducationDataModel>? educationDataModel;
  List<ReferenceModel>? referenceDataList;
  List<LanguageModel>? languageList;
  List<SkillModel>? skillsList;
  List<ProjectModel>? projectList;

  final pdf = pw.Document();

  Future<Uint8List> createPdf() async {
    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.letter.copyWith(
          marginTop: 20,
          marginLeft: 20,
          marginRight: 20,
          marginBottom: 20,
        ),
        theme: pw.ThemeData.withFont(
          base: await PdfGoogleFonts.varelaRoundRegular(),
          bold: await PdfGoogleFonts.varelaRoundRegular(),
          icons: await PdfGoogleFonts.materialIcons(),
        ),
        build: (pw.Context context) => widgets,
      ),
    );
    return await pdf.save();
  }

  void buildUpPDF() {
    var profilePicture = personalDataModel == null
        ? pw.SizedBox()
        : getPersonImage1(personalDataModel!.imagePath);

    var aboutmeWidget = personalDataModel == null
        ? pw.SizedBox()
        : aboutMeText(aboutMeText: personalDataModel!.aboutMeText);
    var educationContainer = educationDataModel == null
        ? pw.SizedBox()
        : pw.Padding(
            padding: pw.EdgeInsets.only(top: width * 0.025),
            child: pw.Container(
              decoration: _blueBoxDecoration(),
              width: double.infinity,
              padding: pw.EdgeInsets.all(width * 0.015),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Row(
                    children: [
                      getIcon(0xe80c),
                      head1Text("EDUCATION"),
                    ],
                  ),
                  educationText(educationList: educationDataModel!),
                ],
              ),
            ),
          );

    var languageContainer = languageList == null
        ? pw.SizedBox()
        : pw.Padding(
            padding: pw.EdgeInsets.only(top: width * 0.025),
            child: pw.Container(
              decoration: _blueBoxDecoration(),
              width: double.infinity,
              padding: pw.EdgeInsets.all(width * 0.015),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      getIcon(0xe894),
                      head1Text("LANGUAGES"),
                    ],
                  ),
                  languagesText(languageList: languageList!),
                ],
              ),
            ),
          );

    var skillsContainer = skillsList == null
        ? pw.SizedBox()
        : pw.Padding(
            padding: pw.EdgeInsets.only(top: width * 0.025),
            child: pw.Container(
              decoration: _blueBoxDecoration(),
              width: double.infinity,
              padding: pw.EdgeInsets.all(width * 0.015),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      getIcon(0xe8d0),
                      head1Text("SKILLS"),
                    ],
                  ),
                  skillText(skills: skillsList!),
                ],
              ),
            ),
          );

    var contactContainer = personalDataModel == null
        ? pw.SizedBox()
        : pw.Padding(
            padding: pw.EdgeInsets.only(top: width * 0.025),
            child: pw.Container(
              decoration: _blueBoxDecoration(),
              width: double.infinity,
              padding: pw.EdgeInsets.all(width * 0.015),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Row(
                    children: [
                      getIcon(0xe0ba),
                      head1Text("CONTACT"),
                    ],
                  ),
                  contactText(personalDataModel: personalDataModel!),
                ],
              ),
            ),
          );

    widgets.add(
      personalDataModel == null
          ? pw.SizedBox()
          : pw.Row(
              children: [
                pw.Center(child: profilePicture),
                pw.SizedBox(width: width * 0.05),
                pw.Expanded(
                  child: pw.SizedBox(
                    child: pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.FittedBox(
                          child: nameText(personalDataModel!.name),
                        ),
                        sizedBox015,
                        contactContainer,
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );

    widgets.add(sizedBox015);
    widgets.add(
      pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          head1Text("ABOUT ME"),
          customDivider(),
          aboutmeWidget,
        ],
      ),
    );

    widgets.add(educationContainer);
    widgets.add(languageContainer);
    widgets.add(skillsContainer);
    widgets.add(sizedBox015);

    if (referenceDataList != null) {
      widgets.add(head1Text("REFERENCE"));
      widgets.add(customDivider());
      for (var element in referenceDataList!) {
        widgets.add(referenceModel(referenceModel: element));
        widgets.add(sizedBox015);
      }
    }

    if (experienceList != null) {
      widgets.add(head1Text("EXPERIENCE"));
      widgets.add(customDivider());
      widgets.add(pw.SizedBox(height: height * 0.001));
      for (var experience in experienceList!) {
        widgets.add(experienceWidget(experienceModel: experience));
        widgets.add(pw.SizedBox(height: height * 0.01));
      }
    }

    widgets.add(sizedBox015);
  }

  pw.BoxDecoration _blueBoxDecoration() {
    return pw.BoxDecoration(
      color: PdfColors.blue50,
      border: pw.Border.all(color: PdfColors.blue100),
      borderRadius: const pw.BorderRadius.all(
        pw.Radius.circular(6),
      ),
    );
  }

  void initializeRepositories() {
    myRepo
        .fetchData<PersonalDataModel>(
          boxName: HiveBoxes.personalDataBox,
        )
        .then(
          (value) => value.fold(
            (failure) => LogHelper.shared.debugPrint("$failure"),
            (data) => personalDataModel = data[0],
          ),
        );

    myRepo
        .fetchData<ExperienceModel>(boxName: HiveBoxes.experienceDataBox)
        .then(
          (value) => value.fold(
            (failure) async =>
                (failure) => LogHelper.shared.debugPrint("$failure"),
            (data) => experienceList = data,
          ),
        );

    myRepo
        .fetchData<EducationDataModel>(
          boxName: HiveBoxes.educationDataBox,
        )
        .then(
          (value) => value.fold(
            (failure) => LogHelper.shared.debugPrint("$failure"),
            (r) => educationDataModel = r,
          ),
        );

    myRepo.fetchData<ReferenceModel>(boxName: HiveBoxes.referenceDataBox).then(
          (value) => value.fold(
            (failure) => LogHelper.shared.debugPrint("$failure"),
            (r) => referenceDataList = r,
          ),
        );

    myRepo.fetchData<LanguageModel>(boxName: HiveBoxes.languageDataBox).then(
          (value) => value.fold(
            (failure) => LogHelper.shared.debugPrint("$failure"),
            (data) => languageList = data,
          ),
        );

    myRepo.fetchData<SkillModel>(boxName: HiveBoxes.skillDataBox).then(
          (value) => value.fold(
            (failure) => LogHelper.shared.debugPrint("$failure"),
            (r) => skillsList = r,
          ),
        );

    myRepo.fetchData<ProjectModel>(boxName: HiveBoxes.projectDataBox).then(
          (value) => value.fold(
            (failure) => LogHelper.shared.debugPrint("$failure"),
            (r) => projectList = r,
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
      LogHelper.shared.debugPrint("$e");
    }
  }
}
