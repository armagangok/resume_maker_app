import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:resume_maker_app/core/export/export.dart';

import '../components/pdf_components.dart';

class ModernTemplate extends ResumeTemplateContract {
  ModernTemplate._();

  static final instance = ModernTemplate._();

  final List<pw.Widget> _widgets = [];

  @override
  get templateName => 'Modern Template';

  @override
  bool isSelected = true;

  @override
  String filePath = "";

  final _pdfRepo = PdfRepository.instance;

  @override
  final int resumeTemplateID = 2;

  @override
  Future<Uint8List> getcreatedPdfAsUint8List() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        
        pageFormat: PdfPageFormat.a4.copyWith(
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
        build: (pw.Context context) => _widgets,
      ),
    );
    return await pdf.save();
  }

  @override
  void buildUpPDF() {
    _widgets.clear();
    _widgets.add(nameWidget());
    _widgets.add(summaryWidget());
    _widgets.add(languageWidget());
    _widgets.add(experiencesWidget());
    _widgets.add(educationWidget());
    _widgets.add(qualificationWidget());
    _widgets.add(contactWidget());
    _widgets.add(skillWidget());
  }

  @override
  Future<String> getFilePathToSave({required String fileName}) async {
    return await super.getFilePathToSave(fileName: fileName);
  }

  pw.Widget languageWidget() => _pdfRepo.getUserData.languages == null ||
          _pdfRepo.getUserData.languages!.isEmpty
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
        );

  pw.Widget experiencesWidget() => _pdfRepo.getUserData.experiences == null ||
          _pdfRepo.getUserData.experiences!.isEmpty
      ? pw.SizedBox()
      : pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            head1Text("EXPERIENCE"),
            customDivider(),
            pw.SizedBox(height: 2.5),
            experienceText(
              experienceList: _pdfRepo.getUserData.experiences!,
            ),
          ],
        );
  pw.Widget educationWidget() => _pdfRepo.getUserData.education == null ||
          _pdfRepo.getUserData.education!.isEmpty
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
        );

  pw.Widget nameWidget() {
    print(_pdfRepo.getUserData.personal!.fullName);
    return _pdfRepo.getUserData.personal!.fullName!.isEmpty
        ? pw.SizedBox()
        : pw.Text(
            _pdfRepo.getUserData.personal!.fullName!,
            style: const pw.TextStyle(
              color: PdfColors.white,
              fontSize: 35,
            ),
            maxLines: 1,
          );
  }

  pw.Widget contactWidget() => _pdfRepo.getUserData.personal != null
      ? pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
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
      : pw.SizedBox();

  pw.Widget qualificationWidget() => _pdfRepo.getUserData.qualifications != null
      ? pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Row(
              children: [
                head1Text("QUALIFICATIONS"),
                customDivider(),
              ],
            ),
            qualificationsText(
              qualifications: _pdfRepo.getUserData.qualifications!,
            )
          ],
        )
      : pw.SizedBox();

  pw.Widget skillWidget() => _pdfRepo.getUserData.skills == null ||
          _pdfRepo.getUserData.skills!.isEmpty
      ? pw.SizedBox()
      : pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            head1Text("SKILLS"),
            skillText(skills: _pdfRepo.getUserData.skills!),
          ],
        );

  pw.Widget summaryWidget() => _pdfRepo.getUserData.personal == null
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

  pw.Widget titleWidget() => _pdfRepo.getUserData.personal!.title == null
      ? pw.SizedBox()
      : pw.FittedBox(
          child: pw.Text(
            _pdfRepo.getUserData.personal!.title!,
            style: const pw.TextStyle(color: PdfColors.white),
            maxLines: 1,
          ),
        );
}
