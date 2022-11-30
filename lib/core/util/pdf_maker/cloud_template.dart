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
  List<EducationDataModel>? academicDataModel;

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
        build: (pw.Context context) {
          return widgets;
        },
      ),
    );
    return await pdf.save();
  }

  void buildUpWidgets() {
    var profilePicture = getPersonImage1(personalDataModel.imagePath);
    var aboutmeWidget = aboutMeText(aboutMeText: personalDataModel.aboutMeText);

    widgets.add(
      pw.Expanded(
        child: pw.Row(
          children: [
            profilePicture,
            pw.SizedBox(
              width: width * 0.05,
            ),
            pw.Expanded(
              child: pw.Column(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  head1Text("ABOUT ME"),
                  customDivider(),
                  aboutmeWidget,
                ],
              ),
            ),
          ],
        ),
      ),
    );
    widgets.add(sizedBox015);

    widgets.add(experienceText(experienceList: experienceList ?? []));
    widgets.add(sizedBox015);
    widgets.add(educationText(academicDataList: academicDataModel ?? []));
    widgets.add(sizedBox015);
    widgets.add(languagesText(languageList: languageList ?? []));
  }

  // Future<void> save() async {
  //   Printing.layoutPdf(
  //     onLayout: (PdfPageFormat format) async => await pdf.save(),
  //   );
  // }

  void initializeRepositories() {
    personalDataRepo.fetchPersonalData().then(
          (value) => value.fold(
            (failure) => LogHelper.shared.debugPrint("$failure"),
            (data) => personalDataModel = data,
          ),
        );

    experienceRepo.fetchExperienceData().then(
          (value) => value.fold(
            (failure) async =>
                (failure) => LogHelper.shared.debugPrint("$failure"),
            (data) => experienceList = data,
          ),
        );

    academicDataRepo.fetchEducationData().then(
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
}

// "I have been learning and implementing Flutter for the last year. I recently use Feature Based Clean Architecture and Cubit state management to deal with my projects."

// pw.Widget leftContainer() {
//   return pw.Container(
//     padding: const pw.EdgeInsets.symmetric(vertical: 20),
//     width: width * 0.45,
//     child: pw.Column(
//       children: [
//         personalDataModel.imagePath.isEmpty
//             ? SizedBox()
//             : getPersonImage1(personalDataModel.imagePath),
//         pw.Expanded(
//           child: pw.Padding(
//             padding: EdgeInsets.symmetric(
//               vertical: height * 0.035,
//               horizontal: width * 0.025,
//             ),
//             child: pw.Column(
//               crossAxisAlignment: pw.CrossAxisAlignment.start,
//               children: [
//                 sizedBox015,
//                 languageList == null
//                     ? SizedBox()
//                     : pw.Container(
//                         padding: EdgeInsets.all(width * 0.02),
//                         color: PdfColors.blue50,
//                         child: pw.Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
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
//                 academicDataModel == null
//                     ? SizedBox()
//                     : Container(
//                         padding: EdgeInsets.all(width * 0.02),
//                         color: PdfColors.blue50,
//                         child: pw.Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             head1Text("EDUCATION"),
//                             customDivider(),
//                             educationText(
//                                 academicDataList: academicDataModel!),
//                           ],
//                         ),
//                       ),
//                 sizedBox015,
//                 skillsList == null
//                     ? pw.SizedBox()
//                     : pw.Container(
//                         padding: EdgeInsets.all(width * 0.02),
//                         color: PdfColors.blue50,
//                         child: pw.Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
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
//                     ? SizedBox()
//                     : Container(
//                         padding: EdgeInsets.all(width * 0.02),
//                         color: PdfColors.blue50,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
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
//               ? SizedBox()
//               : nameText(personalDataModel.name),
//           sizedBox015,
//           personalDataModel == null
//               ? pw.SizedBox()
//               : pw.Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     head1Text("ABOUT ME"),
//                     customDivider(),
//                     aboutMeText(aboutMeText: personalDataModel.aboutMeText)
//                   ],
//                 ),
//           sizedBox015,
//           referenceDataList == null
//               ? SizedBox()
//               : pw.Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     head1Text("REFERENCE"),
//                     customDivider(),
//                     referenceText(referenceList: referenceDataList!),
//                   ],
//                 ),
//           sizedBox015,
//           experienceList == null
//               ? SizedBox()
//               : pw.Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     head1Text("EXPERIENCE"),
//                     customDivider(),
//                     experienceText(experienceList: experienceList!),
//                   ],
//                 ),
//         ],
//       ),
//     ),
//   );
// }




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