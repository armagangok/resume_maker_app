// ignoreforfile: avoidprint

import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';
import 'package:resume_maker_app/core/util/pdf_maker/contract/template_contract.dart';
import 'package:resume_maker_app/core/util/pdf_maker/repository/repo.dart';

import '../components/pdf_components.dart';

class ModernTemplate extends ResumeTemplateContract {
  ModernTemplate._();

  static final instance = ModernTemplate._();

  @override
  get templateName => 'Modern Template';

  @override
  bool isSelected = true;

  @override
  String filePath = "";

  final PdfRepo _pdfRepo = PdfRepo.instance;

  final pdf = pw.Document();

  final List<pw.Widget> _widgets = [];

  @override
  final int resumeTemplateID = 2;

  @override
  Future<Uint8List> getcreatedPdf() async {
    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.letter.copyWith(
          marginTop: 0,
          marginLeft: 0,
          marginRight: 0,
          marginBottom: 0,
          width: width,
          height: height,
        ),
        theme: pw.ThemeData.withFont(
          base: await PdfGoogleFonts.varelaRoundRegular(),
          bold: await PdfGoogleFonts.varelaRoundRegular(),
          icons: await PdfGoogleFonts.materialIcons(),
        ),
        build: (pw.Context context) {
          return _widgets;
        },
      ),
    );
    return await pdf.save();
  }

  pw.Widget leftContainer() => pw.Container(
        width: width * 0.35,
        height: height,
        color: PdfColors.grey300,
        child: pw.Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            _pdfRepo.getUserData.personal == null
                ? SizedBox()
                : Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10.w),
                        color: PdfColors.grey700,
                        child: Column(
                          children: [
                            _pdfRepo.getUserData.personal!.fullName == null
                                ? SizedBox()
                                : FittedBox(
                                    child: Text(
                                      _pdfRepo.getUserData.personal!.fullName!,
                                      style: const pw.TextStyle(
                                        color: PdfColors.white,
                                        fontSize: 35,
                                      ),
                                      maxLines: 1,
                                    ),
                                  ),
                            _pdfRepo.getUserData.personal!.title == null
                                ? SizedBox()
                                : FittedBox(
                                    child: Text(
                                      _pdfRepo.getUserData.personal!.title!,
                                      style: const pw.TextStyle(
                                        color: PdfColors.white,
                                      ),
                                      maxLines: 1,
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ],
                  ),
            pw.SizedBox(height: 20.h),
            pw.Padding(
              padding: const pw.EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  pw.Row(
                    children: [
                      head1Text("CONTACT"),
                    ],
                  ),
                  contactText(
                    personalModel: _pdfRepo.getUserData.personal!,
                  ),
                  SizedBox(height: 20.h),
                  _pdfRepo.getUserData.qualifications != null
                      ? pw.Column(
                          children: [
                            pw.Row(
                              children: [
                                head1Text("QUALIFICATIONS"),
                                customDivider(),
                              ],
                            ),
                            qualificationsText(
                              qualifications:
                                  _pdfRepo.getUserData.qualifications!,
                            )
                          ],
                        )
                      : SizedBox(),
                  sizedBox015,
                  _pdfRepo.getUserData.skills == null
                      ? pw.SizedBox()
                      : pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            head1Text("SKILLS"),
                            skillText(skills: _pdfRepo.getUserData.skills!),
                          ],
                        ),
                ],
              ),
            ),
          ],
        ),
      );

  pw.Expanded rightContainer() {
    return pw.Expanded(
      child: pw.Container(
        padding: EdgeInsets.all(20.w),
        height: height,
        color: PdfColors.white,
        child: pw.Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
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
            pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                _pdfRepo.getUserData.education == null
                    ? pw.SizedBox()
                    : pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          head1Text("EDUCATION"),
                          customDivider(),
                          educationText(
                            educationList: _pdfRepo.getUserData.education!,
                          ),
                        ],
                      ),
                sizedBox015,
                _pdfRepo.getUserData.languages == null
                    ? SizedBox()
                    : pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          head1Text("LANGUAGES"),
                          customDivider(),
                          languagesText(
                            languageList: _pdfRepo.getUserData.languages!,
                          ),
                        ],
                      ),
                sizedBox015,
              ],
            ),
            _pdfRepo.getUserData.experiences == null
                ? SizedBox()
                : pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      head1Text("EXPERIENCE"),
                      customDivider(),
                      pw.SizedBox(height: 2.5),
                      experienceWidget(
                        experienceList: _pdfRepo.getUserData.experiences!,
                      ),
                    ],
                  ),
            sizedBox015,
          ],
        ),
      ),
    );
  }

  @override
  Future<String> getFilePathToSave() async {
    final output = await path_provider.getExternalStorageDirectory();

    filePath = "${output!.path}/${"${DateTime.now()}"}.pdf";

    return filePath;
  }

  @override
  void buildUpPDF() {
    pw.Row(children: [
      leftContainer(),
      rightContainer(),
    ]);
  }

  void buildRightContainer() {}
}

// "I have been learning and implementing Flutter for the last year. I recently use Feature Based Clean Architecture and Cubit state management to deal with my projects."

// final file = File(filePath);
// try {
//   // await file.writeAsBytes(byteList);
//   // await OpenFile.open(filePath);
// } catch (e) {
//   print("$e");
// }

// const String path = 'assets/person.png';

// pw.ThemeData myTheme = pw.ThemeData.withFont(
//   base: Font.ttf(
//     await rootBundle.load("assets/fonts/Lato/Lato-Regular.ttf"),
//   ),
// );
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

// _pdfRepo.getUserData.personal!.imagePath == null
//     ? SizedBox()
//     : getPersonImage1(_pdfRepo.getUserData.personal!.imagePath!),
