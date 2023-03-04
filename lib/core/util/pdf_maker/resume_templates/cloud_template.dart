import 'dart:typed_data';

import 'package:pdf/widgets.dart' as pw;

import '../../../export/export.dart';
import '../components/pdf_components.dart';

class CloudTemplate extends ResumeTemplateContract {
  static final instance = CloudTemplate._();
  CloudTemplate._();

  @override
  final String templateName = 'Cloud Template';

  @override
  bool isSelected = false;

  @override
  String filePath = "";

  @override
  final int resumeTemplateID = 0;

  final List<pw.Widget> _widgets = [];

  pw.Row row = pw.Row(
    mainAxisAlignment: pw.MainAxisAlignment.start,
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [],
  );

  final PdfRepo _pdfRepo = PdfRepo.instance;

  @override
  Future<Uint8List> getcreatedPdfAsUint8List() async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.letter.copyWith(
          marginTop: 20,
          marginLeft: 20,
          marginRight: 20,
          marginBottom: 20,
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
    row.children.clear();

    var aboutmeWidget = _pdfRepo.getUserData.personal!.summary == null
        ? pw.SizedBox()
        : aboutMeText(aboutMeText: _pdfRepo.getUserData.personal!.summary!);

    var educationContainer = _pdfRepo.getUserData.education == null
        ? pw.SizedBox()
        : pw.Padding(
            padding: pw.EdgeInsets.only(top: 20.h),
            child: pw.Container(
              decoration: _blueBoxDecoration(),
              width: double.infinity,
              padding: pw.EdgeInsets.all(20.w),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Row(
                    children: [
                      getIcon(0xe80c),
                      head1Text("EDUCATION"),
                    ],
                  ),
                  educationText(educationList: _pdfRepo.getUserData.education!),
                ],
              ),
            ),
          );

    var languageContainer = _pdfRepo.getUserData.languages == null
        ? pw.SizedBox()
        : pw.Padding(
            padding: pw.EdgeInsets.only(top: 20.h),
            child: pw.Container(
              decoration: _blueBoxDecoration(),
              width: double.infinity,
              padding: pw.EdgeInsets.all(20.w),
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
                  languagesText(languageList: _pdfRepo.getUserData.languages!),
                ],
              ),
            ),
          );

    var skillsContainer = _pdfRepo.getUserData.skills == null
        ? pw.SizedBox()
        : pw.Padding(
            padding: pw.EdgeInsets.only(top: 20.h),
            child: pw.Container(
              decoration: _blueBoxDecoration(),
              width: double.infinity,
              padding: pw.EdgeInsets.all(20.w),
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
                  skillText(skills: _pdfRepo.getUserData.skills!),
                ],
              ),
            ),
          );

    var contactContainer = _pdfRepo.getUserData.personal == null
        ? pw.SizedBox()
        : pw.Container(
            padding: pw.EdgeInsets.all(20.w),
            decoration: _blueBoxDecoration(),
            width: double.infinity,
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Row(
                  children: [
                    getIcon(0xe0ba),
                    head1Text("CONTACT"),
                  ],
                ),
                contactText(personalModel: _pdfRepo.getUserData.personal!),
              ],
            ),
          );

    var nameWidget = _pdfRepo.getUserData.personal == null
        ? pw.SizedBox()
        : nameText(_pdfRepo.getUserData.personal!.fullName!);

    var qualificationsWidget = _pdfRepo.getUserData.qualifications == null
        ? pw.SizedBox()
        : _pdfRepo.getUserData.qualifications!.isNotEmpty
            ? pw.Column(
                children: [
                  pw.Text("QUALIFICATIONS"),
                  qualificationsText(
                    qualifications: _pdfRepo.getUserData.qualifications!,
                  )
                ],
              )
            : pw.SizedBox();

    var myWidget = pw.Container(
      color: PdfColors.blue100,
      width: width * 0.35 - 10,
      height: 608.0,
      child: pw.Column(
        mainAxisAlignment: pw.MainAxisAlignment.start,
        children: [
          contactContainer,
          sizedBox015,
          qualificationsWidget,
        ],
      ),
    );
    var rightWidgets = pw.Container(
      width: width * 0.65 - 10,
      child: pw.Column(
        mainAxisAlignment: pw.MainAxisAlignment.start,
        children: [
          nameWidget,
          titleWidget,
          customDivider(),
          head1Text("ABOUT ME"),
          aboutmeWidget,
        ],
      ),
    );
    row.children.add(myWidget);

    row.children.add(rightWidgets);

    _widgets.add(row);
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

  pw.Widget get titleWidget => _pdfRepo.getUserData.personal!.title == null
      ? pw.SizedBox()
      : pw.Text(
          _pdfRepo.getUserData.personal!.title!,
          style: const pw.TextStyle(
            color: PdfColors.black,
          ),
        );

  @override
  Future<String> getFilePathToSave({required String fileName}) async {
    return await super.getFilePathToSave(fileName: fileName);
  }
}
