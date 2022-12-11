// ignoreforfile: avoidprint

import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

import './export/pdf_export.dart';
import '../../../data/contracts/database_contract.dart';

// const String path = 'assets/person.png';

class PeachPuffTemplate {
  PeachPuffTemplate({
    required DatabaseContract repo,
    
  }) {
    myrepo = repo;
    

    initializeRepositories();
  }

  late final DatabaseContract myrepo;
  List<ExperienceModel>? experienceList;

  late PersonalDataModel personalDataModel;

  
  List<EducationDataModel>? academicDataModel;

  
  List<ReferenceModel>? referenceDataList;

  
  List<LanguageModel>? languageList;

  
  List<SkillModel>? skillsList;

  final pdf = pw.Document();

  List<pw.Widget> widgets = [];

  Future<Uint8List> createPdf() async {
    // pw.ThemeData myTheme = pw.ThemeData.withFont(
    //   base: Font.ttf(
    //     await rootBundle.load("assets/fonts/Lato/Lato-Regular.ttf"),
    //   ),
    // );

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.letter.copyWith(
          marginTop: 0,
          marginLeft: 0,
          marginRight: 0,
          marginBottom: 0,
        ),
        theme: pw.ThemeData.withFont(
          base: await PdfGoogleFonts.varelaRoundRegular(),
          bold: await PdfGoogleFonts.varelaRoundRegular(),
          icons: await PdfGoogleFonts.materialIcons(),
        ),
        build: (pw.Context context) {
          return widgets;
          // Row(
          //       children: [
          //         leftContainer(),
          //         rightContainer(),
          //       ],
          //     ),
        },
      ),
    );
    return await pdf.save();
  }

  pw.Widget leftContainer() {
    return pw.Container(
      padding: pw.EdgeInsets.all(width * 0.02),
      width: width * 0.45,
      color: PdfColors.amber50,
      child: pw.Column(
        children: [
          personalDataModel.imagePath.isEmpty
              ? SizedBox()
              : getPersonImage1(personalDataModel.imagePath),
          pw.Expanded(
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                sizedBox015,
                languageList == null
                    ? SizedBox()
                    : pw.Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          academicDataModel == null
                              ? SizedBox()
                              : pw.Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    head1Text("EDUCATION"),
                                    educationText(
                                        educationList: academicDataModel!),
                                  ],
                                ),
                          sizedBox015,
                          pw.Row(
                            children: [
                              getIcon(0xe894),
                              head1Text("LANGUAGES"),
                            ],
                          ),
                          languagesText(languageList: languageList!),
                          sizedBox015,
                        ],
                      ),
                skillsList == null
                    ? pw.SizedBox()
                    : pw.Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          pw.Row(
                            children: [
                              getIcon(0xe8d0),
                              head1Text("SKILLS"),
                            ],
                          ),
                          skillText(skills: skillsList!),
                        ],
                      ),
                pw.Spacer(),
                personalDataModel == null
                    ? SizedBox()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          head1Text("CONTACT"),
                          contactText(personalDataModel: personalDataModel),
                        ],
                      ),
              ],
            ),
          )
        ],
      ),
    );
  }

  pw.Expanded rightContainer() {
    return pw.Expanded(
      child: pw.Container(
        padding: pw.EdgeInsets.all(width * 0.02),
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
    myrepo.fetchData(boxName: HiveBoxes.personalDataBox).then(
          (value) => value.fold(
            (failure) => LogHelper.shared.debugPrint("$failure"),
            (data) {
              personalDataModel = data;
              // getImageBytes(data.imagePath)
              //     .then((value) => uint8ListData = value);
            },
          ),
        );

    myrepo.fetchData(boxName: HiveBoxes.experienceDataBox).then(
          (value) => value.fold(
            (failure) async =>
                (failure) => LogHelper.shared.debugPrint("$failure"),
            (data) => experienceList = data,
          ),
        );

    myrepo.fetchData(boxName: HiveBoxes.academicDataBox).then(
          (value) => value.fold(
            (failure) => LogHelper.shared.debugPrint("$failure"),
            (r) => academicDataModel = r,
          ),
        );

    myrepo.fetchData(boxName: HiveBoxes.referenceDataBox).then(
          (value) => value.fold(
            (failure) => LogHelper.shared.debugPrint("$failure"),
            (r) => referenceDataList = r,
          ),
        );

    myrepo.fetchData(boxName: HiveBoxes.languageDataBox).then(
          (value) => value.fold(
            (failure) => LogHelper.shared.debugPrint("$failure"),
            (data) => languageList = data,
          ),
        );

    myrepo.fetchData(boxName: HiveBoxes.skillDataBox).then(
          (value) => value.fold(
            (failure) => LogHelper.shared.debugPrint("$failure"),
            (r) => skillsList = r,
          ),
        );
  }
}

// "I have been learning and implementing Flutter for the last year. I recently use Feature Based Clean Architecture and Cubit state management to deal with my projects."
