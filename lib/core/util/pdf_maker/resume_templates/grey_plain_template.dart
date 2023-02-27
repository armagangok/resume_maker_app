// ignoreforfile: avoidprint

import 'dart:typed_data';

import 'package:pdf/widgets.dart' as pw;

import '../../../export/export.dart';
import '../components/pdf_components.dart';

// const String path = 'assets/person.png';

class GreyPlainTemplate extends ResumeTemplateContract {
  GreyPlainTemplate._();

  static final instance = GreyPlainTemplate._();

  @override
  final templateName = 'Grey Plain Template';

  @override
  bool isSelected = false;

  @override
  String filePath = "";

  final _pdfRepo = PdfRepo.instance;

  final pdf = pw.Document();

  @override
  final int resumeTemplateID = 1;

  @override
  Future<Uint8List> getcreatedPdf() async {
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
      width: width * 0.5,
      color: PdfColors.grey300,
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        mainAxisSize: pw.MainAxisSize.max,
        children: [
          // _pdfRepo.getUserData.personal == null
          //     ? SizedBox()
          //     : getPersonImage1(_pdfRepo.getUserData.personal!.imagePath),
          sizedBox015,
          pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            mainAxisSize: pw.MainAxisSize.max,
            children: [
              _pdfRepo.getUserData.education == null
                  ? pw.SizedBox()
                  : pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        whiteHeadContainer(
                          column: head1Text("EDUCATION"),
                        ),
                        educationText(
                          educationList: _pdfRepo.getUserData.education!,
                        ),
                      ],
                    ),
              sizedBox015,
              _pdfRepo.getUserData.languages == null
                  ? pw.SizedBox()
                  : pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        whiteHeadContainer(column: head1Text("LANGUAGES")),
                        languagesText(
                            languageList: _pdfRepo.getUserData.languages!),
                        sizedBox015,
                      ],
                    ),
              _pdfRepo.getUserData.skills == null
                  ? pw.SizedBox()
                  : pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        whiteHeadContainer(
                          column: head1Text("SKILLS"),
                        ),
                        skillText(skills: _pdfRepo.getUserData.skills!),
                      ],
                    ),
              sizedBox015,
              _pdfRepo.getUserData.personal == null
                  ? pw.SizedBox()
                  : pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Row(
                          children: [
                            whiteHeadContainer(
                              column: head1Text("CONTACT"),
                            ),
                          ],
                        ),
                        contactText(
                          personalModel: _pdfRepo.getUserData.personal!,
                        ),
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
            _pdfRepo.getUserData.personal == null
                ? pw.SizedBox()
                : nameText(_pdfRepo.getUserData.personal!.fullName!),
            sizedBox015,
            _pdfRepo.getUserData.personal == null
                ? pw.SizedBox()
                : pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      head1Text("ABOUT ME"),
                      customDivider(),
                      aboutMeText(
                          aboutMeText: _pdfRepo.getUserData.personal!.summary!)
                    ],
                  ),
            sizedBox015,
            // _pdfRepo.referenceDataList == null
            //     ? SizedBox()
            //     : pw.Column(
            //         crossAxisAlignment: pw.CrossAxisAlignment.start,
            //         children: [
            //           head1Text("REFERENCE"),
            //           customDivider(),
            //           // referenceModel(referenceList: referenceDataList!),
            //         ],
            //       ),
            _pdfRepo.getUserData.experiences == null
                ? pw.SizedBox()
                : pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      head1Text("EXPERIENCE"),
                      customDivider(),
                      experienceWidget(
                        experienceList: _pdfRepo.getUserData.experiences!,
                      ),
                    ],
                  ),
            // sizedBox015,
          ],
        ),
      ),
    );
  }

  @override
  Future<String> getFilePathToSave(String pdfID) async {
    return await super.getFilePathToSave(pdfID);
  }

  @override
  void buildUpPDF() {}
}

// "I have been learning and implementing Flutter for the last year. I recently use Feature Based Clean Architecture and Cubit state management to deal with my projects."