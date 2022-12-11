import 'package:pdf/widgets.dart' as pw;

import '../../../feature/projects/data/model/project_model.dart';
import '../../contracts/database_contract.dart';
import 'export/pdf_export.dart';

// const String path = 'assets/person.png';

class CloudTemplate {
  CloudTemplate({
    required DatabaseContract experienceRepository,
    required DatabaseContract personalDataRepository,
    required DatabaseContract academicDataRepository,
    required DatabaseContract referenceRepository,
    required DatabaseContract languageRepository,
    required DatabaseContract skillRepository,
    required DatabaseContract projectRepository,
  }) {
    experienceRepo = experienceRepository;
    personalDataRepo = personalDataRepository;
    academicDataRepo = academicDataRepository;
    referenceRepo = referenceRepository;
    languageRepo = languageRepository;
    skillRepo = skillRepository;
    projectRepo = projectRepository;

    initializeRepositories();
  }

  List<pw.Widget> widgets = [];

  late final DatabaseContract experienceRepo;
  List<ExperienceModel>? experienceList;

  late final DatabaseContract personalDataRepo;
  late PersonalDataModel? personalDataModel;

  late final DatabaseContract academicDataRepo;
  List<EducationDataModel>? educationDataModel;

  late final DatabaseContract referenceRepo;
  List<ReferenceModel>? referenceDataList;

  late final DatabaseContract languageRepo;
  List<LanguageModel>? languageList;

  late final DatabaseContract skillRepo;
  List<SkillModel>? skillsList;

  late final DatabaseContract projectRepo;
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
    personalDataRepo.fetchData().then(
          (value) => value.fold(
            (failure) => LogHelper.shared.debugPrint("$failure"),
            (data) => personalDataModel = data,
          ),
        );

    experienceRepo.fetchData().then(
          (value) => value.fold(
            (failure) async =>
                (failure) => LogHelper.shared.debugPrint("$failure"),
            (data) => experienceList = data,
          ),
        );

    academicDataRepo.fetchData().then(
          (value) => value.fold(
            (failure) => LogHelper.shared.debugPrint("$failure"),
            (r) => educationDataModel = r,
          ),
        );

    referenceRepo.fetchData().then(
          (value) => value.fold(
            (failure) => LogHelper.shared.debugPrint("$failure"),
            (r) => referenceDataList = r,
          ),
        );

    languageRepo.fetchData().then(
          (value) => value.fold(
            (failure) => LogHelper.shared.debugPrint("$failure"),
            (data) => languageList = data,
          ),
        );

    skillRepo.fetchData().then(
          (value) => value.fold(
            (failure) => LogHelper.shared.debugPrint("$failure"),
            (r) => skillsList = r,
          ),
        );

    projectRepo.fetchData().then(
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
