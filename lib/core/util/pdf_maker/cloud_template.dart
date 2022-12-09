import 'package:pdf/widgets.dart' as pw;

import 'export/pdf_export.dart';

// const String path = 'assets/person.png';

class CloudTemplate {
  CloudTemplate({
    required ExperienceRepository experienceRepository,
    required PersonalDataRepository personalDataRepository,
    required EducationDataRepository academicDataRepository,
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

  List<pw.Widget> widgets = [];

  late final ExperienceRepository experienceRepo;
  List<ExperienceModel>? experienceList;

  late final PersonalDataRepository personalDataRepo;
  late PersonalDataModel? personalDataModel;

  late final EducationDataRepository academicDataRepo;
  List<EducationDataModel>? educationDataModel;

  late final ReferenceRepository referenceRepo;
  List<ReferenceModel>? referenceDataList;

  late final LanguageRepository languageRepo;
  List<LanguageModel>? languageList;

  late final SkillRepository skillRepo;
  List<SkillModel>? skillsList;

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
            padding: pw.EdgeInsets.all(width * 0.025),
            child: pw.Container(
              width: width * 0.5,
              padding: pw.EdgeInsets.all(width * 0.015),
              color: PdfColors.blue50,
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  head1Text("EDUCATION"),
                  educationText(educationList: educationDataModel!),
                ],
              ),
            ),
          );

    var languageContainer = languageList == null
        ? pw.SizedBox()
        : pw.Padding(
            padding: pw.EdgeInsets.all(width * 0.025),
            child: pw.Container(
              width: width * 0.5,
              padding: pw.EdgeInsets.all(width * 0.015),
              color: PdfColors.blue50,
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
            padding: pw.EdgeInsets.all(width * 0.025),
            child: pw.Container(
              width: width * 0.5,
              padding: pw.EdgeInsets.all(width * 0.015),
              color: PdfColors.blue50,
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
            padding: pw.EdgeInsets.all(width * 0.025),
            child: pw.Container(
              width: width * 0.5,
              padding: pw.EdgeInsets.all(width * 0.015),
              color: PdfColors.blue50,
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
                pw.SizedBox(width: width * 0.1),
                pw.Expanded(
                  child: pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      nameText(personalDataModel!.name),
                      sizedBox015,
                      head1Text("ABOUT ME"),
                      customDivider(),
                      aboutmeWidget,
                    ],
                  ),
                ),
              ],
            ),
    );

    widgets.add(
      pw.Wrap(
        alignment: pw.WrapAlignment.spaceBetween,
        children: [
          educationContainer,
          languageContainer,
          skillsContainer,
          contactContainer,
        ],
      ),
    );

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

      for (var experience in experienceList!) {
        widgets.add(experienceWidget(experienceModel: experience));
        widgets.add(sizedBox015);
      }
    }

    widgets.add(sizedBox015);
  }

  void initializeRepositories() {
    personalDataRepo.fetchPersonalData().then(
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

    referenceRepo.fetchReferenceData().then(
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

    skillRepo.fetchSkillData().then(
          (value) => value.fold(
            (failure) => LogHelper.shared.debugPrint("$failure"),
            (r) => skillsList = r,
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
