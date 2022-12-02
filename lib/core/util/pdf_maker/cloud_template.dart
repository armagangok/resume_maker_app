// ignoreforfile: avoidprint

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
  late PersonalDataModel personalDataModel;

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
          marginTop: 10,
          marginLeft: 10,
          marginRight: 10,
          marginBottom: 10,
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
    var profilePicture = getPersonImage1(personalDataModel.imagePath);
    var aboutmeWidget = aboutMeText(aboutMeText: personalDataModel.aboutMeText);
    var educationContainer = educationDataModel == null
        ? pw.SizedBox()
        : pw.Container(
            padding: pw.EdgeInsets.all(width * 0.02),
            color: PdfColors.blue50,
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                head1Text("EDUCATION"),
                educationText(educationList: educationDataModel!),
              ],
            ),
          );

    var languageContainer = languageList == null
        ? pw.SizedBox()
        : pw.Container(
            padding: pw.EdgeInsets.all(width * 0.02),
            color: PdfColors.blue50,
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Row(
                  children: [
                    getIcon(0xe894),
                    head1Text("LANGUAGES"),
                  ],
                ),
                languagesText(languageList: languageList!),
              ],
            ),
          );

    var skillsContainer = skillsList == null
        ? pw.SizedBox()
        : pw.Container(
            padding: pw.EdgeInsets.all(width * 0.02),
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
          );

    var contactContainer = personalDataModel == null
        ? pw.SizedBox()
        : pw.Container(
            padding: pw.EdgeInsets.all(width * 0.02),
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
                contactText(personalDataModel: personalDataModel),
              ],
            ),
          );

    widgets.add(
      pw.Row(
        children: [
          pw.Center(child: profilePicture),
          pw.SizedBox(width: width * 0.02),
          pw.Expanded(
            child: pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.start,
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                nameText(personalDataModel.name),
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

    widgets.add(sizedBox015);

    widgets.add(
      pw.Wrap(
        children: [
          educationContainer,
          languageContainer,
          skillsContainer,
          contactContainer,
        ],
      ),
    );

    widgets.add(sizedBox015);

    widgets.add(head1Text("REFERENCE"));
    widgets.add(customDivider());

    for (var element in referenceDataList!) {
      widgets.add(referenceModel(referenceModel: element));
      widgets.add(sizedBox015);
    }

    widgets.add(head1Text("EXPERIENCE"));
    widgets.add(customDivider());

    for (var experience in experienceList!) {
      widgets.add(experienceWidget(experienceModel: experience));
      widgets.add(sizedBox015);
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

  Future<void> savePdfFile(
    String fileName,
    Uint8List byteList,
  ) async {
    final output = await getTemporaryDirectory();
    var filePath = "${output.path}/$fileName.pdf";
    print(filePath);

    final file = File(filePath);
    try {
      await file.writeAsBytes(byteList);
      await OpenFile.open(filePath);
    } catch (e) {
      print("$e");
    }
  }

  // pw.Widget leftContainer() {
  //   return pw.Container(
  //     padding: const pw.EdgeInsets.symmetric(vertical: 20),
  //     width: width * 0.45,
  //     child: pw.Column(
  //       children: [
  //         personalDataModel.imagePath.isEmpty
  //             ? pw.SizedBox()
  //             : getPersonImage1(personalDataModel.imagePath),
  //         pw.Expanded(
  //           child: pw.Padding(
  //             padding: pw.EdgeInsets.symmetric(
  //               vertical: height * 0.035,
  //               horizontal: width * 0.025,
  //             ),
  //             child: pw.Column(
  //               crossAxisAlignment: pw.CrossAxisAlignment.start,
  //               children: [
  //                 sizedBox015,
  //                 languageList == null
  //                     ? pw.SizedBox()
  //                     : pw.Container(
  //                         padding: pw.EdgeInsets.all(width * 0.02),
  //                         color: PdfColors.blue50,
  //                         child: pw.Column(
  //                           crossAxisAlignment: pw.CrossAxisAlignment.start,
  //                           children: [
  //                             pw.Row(
  //                               children: [
  //                                 getIcon(0xe894),
  //                                 head1Text("LANGUAGES"),
  //                               ],
  //                             ),
  //                             languagesText(languageList: languageList!),
  //                             sizedBox015,
  //                           ],
  //                         ),
  //                       ),
  //                 sizedBox015,
  //                 educationDataModel == null
  //                     ? pw.SizedBox()
  //                     : pw.Container(
  //                         padding: pw.EdgeInsets.all(width * 0.02),
  //                         color: PdfColors.blue50,
  //                         child: pw.Column(
  //                           crossAxisAlignment: pw.CrossAxisAlignment.start,
  //                           children: [
  //                             head1Text("EDUCATION"),
  //                             customDivider(),
  //                             educationText(educationList: educationDataModel!),
  //                           ],
  //                         ),
  //                       ),
  //                 sizedBox015,
  //                 skillsList == null
  //                     ? pw.SizedBox()
  //                     : pw.Container(
  //                         padding: pw.EdgeInsets.all(width * 0.02),
  //                         color: PdfColors.blue50,
  //                         child: pw.Column(
  //                           crossAxisAlignment: pw.CrossAxisAlignment.start,
  //                           children: [
  //                             pw.Row(
  //                               children: [
  //                                 getIcon(0xe8d0),
  //                                 head1Text("SKILLS"),
  //                               ],
  //                             ),
  //                             skillText(skills: skillsList!),
  //                           ],
  //                         ),
  //                       ),
  //                 sizedBox015,
  //                 pw.Spacer(),
  //                 personalDataModel == null
  //                     ? pw.SizedBox()
  //                     : pw.Container(
  //                         padding: pw.EdgeInsets.all(width * 0.02),
  //                         color: PdfColors.blue50,
  //                         child: pw.Column(
  //                           crossAxisAlignment: pw.CrossAxisAlignment.start,
  //                           children: [
  //                             head1Text("CONTACT"),
  //                             contactText(personalDataModel: personalDataModel),
  //                           ],
  //                         ),
  //                       ),
  //               ],
  //             ),
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  // pw.Expanded rightContainer() {
  //   return pw.Expanded(
  //     child: pw.Container(
  //       padding: const pw.EdgeInsets.only(
  //         top: 20,
  //         right: 20,
  //         left: 20,
  //       ),
  //       color: PdfColors.white,
  //       child: pw.Column(
  //         crossAxisAlignment: pw.CrossAxisAlignment.start,
  //         children: [
  //           personalDataModel == null
  //               ? pw.SizedBox()
  //               : nameText(personalDataModel.name),
  //           sizedBox015,
  //           personalDataModel == null
  //               ? pw.SizedBox()
  //               : pw.Column(
  //                   crossAxisAlignment: pw.CrossAxisAlignment.start,
  //                   children: [
  //                     head1Text("ABOUT ME"),
  //                     customDivider(),
  //                     aboutMeText(aboutMeText: personalDataModel.aboutMeText)
  //                   ],
  //                 ),
  //           sizedBox015,
  //           referenceDataList == null
  //               ? pw.SizedBox()
  //               : pw.Column(
  //                   crossAxisAlignment: pw.CrossAxisAlignment.start,
  //                   children: [
  //                     head1Text("REFERENCE"),
  //                     customDivider(),
  //                     // referenceModel(referenceList: referenceDataList!),
  //                   ],
  //                 ),
  //           sizedBox015,
  //         ],
  //       ),
  //     ),
  //   );
  // }
}

// "I have been learning and implementing Flutter for the last year. I recently use Feature Based Clean Architecture and Cubit state management to deal with my projects."

// pw.Row(
//   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   children: [
//     // leftContainer(),
//     // rightContainer(),
//   ],
// );

// pw.ThemeData myTheme = pw.ThemeData.withFont(
//   base: Font.ttf(
//     await rootBundle.load("assets/fonts/Lato/Lato-Regular.ttf"),
//   ),
// );
