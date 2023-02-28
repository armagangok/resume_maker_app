import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:resume_maker_app/core/export/export.dart';

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

  final _pdfRepo = PdfRepo.instance;

  @override
  final int resumeTemplateID = 2;

  @override
  Future<Uint8List> getcreatedPdf() async {
    final pdf = pw.Document();
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
          return [
            pw.Row(
              children: [
                leftContainer(),
                pw.Column(children: [
                  _pdfRepo.getUserData.personal != null
                      ? contactText(
                          personalModel: _pdfRepo.getUserData.personal!,
                        )
                      : pw.SizedBox(),
                  buildSummaryText(),
                ])
              ],
            ),
          ];
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
          crossAxisAlignment: pw.CrossAxisAlignment.center,
          mainAxisSize: pw.MainAxisSize.max,
          children: [
            _pdfRepo.getUserData.personal == null
                ? pw.SizedBox()
                : pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Container(
                        padding: const pw.EdgeInsets.all(10),
                        color: PdfColors.grey700,
                        child: pw.Column(
                          children: [
                            _pdfRepo.getUserData.personal!.fullName == null
                                ? pw.SizedBox()
                                : pw.FittedBox(
                                    child: pw.Text(
                                      _pdfRepo.getUserData.personal!.fullName!,
                                      style: const pw.TextStyle(
                                        color: PdfColors.white,
                                        fontSize: 35,
                                      ),
                                      maxLines: 1,
                                    ),
                                  ),
                            _pdfRepo.getUserData.personal!.title == null
                                ? pw.SizedBox()
                                : pw.FittedBox(
                                    child: pw.Text(
                                      _pdfRepo.getUserData.personal!.title!,
                                      style: const pw.TextStyle(
                                          color: PdfColors.white),
                                      maxLines: 1,
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ],
                  ),
            pw.SizedBox(height: 20),
            pw.Padding(
              padding: const pw.EdgeInsets.symmetric(horizontal: 5),
              child: pw.Column(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  _pdfRepo.getUserData.personal != null
                      ? pw.Column(
                          children: [
                            pw.Row(
                              children: [
                                head1Text("CONTACT"),
                              ],
                            ),
                            contactText(
                              personalModel: _pdfRepo.getUserData.personal!,
                            )
                          ],
                        )
                      : pw.SizedBox(),
                  pw.SizedBox(height: 20),
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
                      : pw.SizedBox(),
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

  pw.Widget rightContainer() {
    return pw.Expanded(
      child: pw.Container(
        padding: const pw.EdgeInsets.all(20),
        height: height,
        color: PdfColors.white,
        child: pw.Column(
          mainAxisAlignment: pw.MainAxisAlignment.start,
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
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
                          head1Text("EDUCATION"),
                          customDivider(),
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
                ? pw.SizedBox()
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
  Future<String> getFilePathToSave(String pdfID) async {
    return await super.getFilePathToSave(pdfID);
  }

  @override
  void buildUpPDF() {}

  pw.Widget buildSummaryText() {
    return _pdfRepo.getUserData.personal == null
        ? pw.SizedBox()
        : pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              sizedBox015,
              head1Text("ABOUT ME"),
              customDivider(),
              aboutMeText(aboutMeText: _pdfRepo.getUserData.personal!.summary!)
            ],
          );
  }
}
