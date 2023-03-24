import 'dart:typed_data';

import 'package:pdf/widgets.dart' as pw;

import '../../../export/export.dart';
import '../components/pdf_components.dart';

class ClassicTemplate extends ResumeTemplateContract {
  static final instance = ClassicTemplate._();
  ClassicTemplate._();

  @override
  final String templateName = 'Classic Template';

  @override
  bool isSelected = true;

  @override
  String filePath = "";

  @override
  final int resumeTemplateID = 5;

  final List<pw.Widget> _widgets = [];

  pw.Row row = pw.Row(
    mainAxisAlignment: pw.MainAxisAlignment.start,
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [],
  );

  final PdfRepository _pdfRepo = PdfRepository.instance;

  @override
  Future<Uint8List> getcreatedPdfAsUint8List() async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4.copyWith(
          marginTop: 25,
          marginLeft: 25,
          marginRight: 25,
          marginBottom: 10,
          width: width,
          height: height,
        ),
        theme: pw.ThemeData.withFont(
          base: await PdfGoogleFonts.poppinsMedium(),
          bold: await PdfGoogleFonts.poppinsBold(),
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

    var summaryWidget = _pdfRepo.getUserData.personal!.summary!.isEmpty
        ? pw.SizedBox()
        : aboutMeText(
            aboutMeText: _pdfRepo.getUserData.personal!.summary!,
          );

    var educationContainer = _pdfRepo.getUserData.education!.isEmpty
        ? pw.SizedBox()
        : pw.Padding(
            padding: pw.EdgeInsets.only(top: 20.h),
            child: pw.Container(
              width: double.infinity,
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

    var languageContainer = _pdfRepo.getUserData.languages!.isEmpty
        ? pw.SizedBox()
        : pw.Padding(
            padding: pw.EdgeInsets.only(top: 20.h),
            child: pw.Container(
              width: double.infinity,
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
                  languagesText(
                      languageList: _pdfRepo.getUserData.languages ?? []),
                ],
              ),
            ),
          );

    var skillsContainer = _pdfRepo.getUserData.skills!.isEmpty
        ? pw.SizedBox()
        : pw.Padding(
            padding: pw.EdgeInsets.only(top: 0.h),
            child: pw.Container(
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      getIcon(0xe8d0),
                      head1Text("TECHNICAL SKILLS"),
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
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                contactText(personalModel: _pdfRepo.getUserData.personal!),
              ],
            ),
          );

    var nameWidget = _pdfRepo.getUserData.personal!.fullName!.isEmpty 
        ? pw.SizedBox()
        : nameText(
            _pdfRepo.getUserData.personal!.fullName ?? "",
          );

    var qualificationsWidget = _pdfRepo.getUserData.qualifications!.isEmpty
        ? pw.SizedBox()
        : _pdfRepo.getUserData.qualifications!.isNotEmpty
            ? pw.Padding(
                padding: const pw.EdgeInsets.all(10),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    head1Text("QUALIFICATIONS"),
                    qualificationsText(
                      qualifications: _pdfRepo.getUserData.qualifications!,
                    )
                  ],
                ),
              )
            : pw.SizedBox();

    pw.Widget nameNumberMailWidget = pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      children: [
        pw.Row(
          children: [
            nameWidget,
            pw.SizedBox(width: 10),
            pw.Text(
              _pdfRepo.getUserData.personal!.phone!,
              maxLines: 1,
              style: const pw.TextStyle(
                color: PdfColors.black,
              ),
            ),
          ],
        ),
        pw.Text(
          _pdfRepo.getUserData.personal!.email!,
          maxLines: 1,
          style: const pw.TextStyle(
            color: PdfColors.black,
          ),
        ),
      ],
    );

    pw.Widget titleWidget = pw.Text(
      _pdfRepo.getUserData.personal!.title!,
      style: pw.TextStyle(
        fontWeight: pw.FontWeight.bold,
      ),
    );

    _widgets.add(nameNumberMailWidget);
    _widgets.add(titleWidget);
    _widgets.add(customDivider());
    _widgets.add(sizedBox015);
    _widgets.add(summaryWidget);
    _widgets.add(sizedBox015);
    _widgets.add(contactContainer);
    _widgets.add(educationContainer);
    _widgets.add(languageContainer);
    _widgets.add(sizedBox015);
    _widgets.add(skillsContainer);
    _widgets.add(sizedBox015);
    experiencesWidget();
  }

  void experiencesWidget() {
    _pdfRepo.getUserData.experiences!.isEmpty
        ? pw.SizedBox()
        : pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [],
          );

    if (_pdfRepo.getUserData.experiences != null) {
      if (_pdfRepo.getUserData.experiences!.isNotEmpty) {
        _widgets.add(head1Text("WORK EXPERIENCE"));

        for (var element in _pdfRepo.getUserData.experiences!) {
          var item = pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Row(
                children: [
                  pw.Text(
                    "${element.company}",
                    style: pw.TextStyle(
                      fontSize: 10,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.SizedBox(width: 30),
                  pw.Text(
                    "${element.startDate} - ${element.endDate}",
                    style: const pw.TextStyle(fontSize: 10),
                  ),
                ],
              ),
              pw.Row(
                children: [
                  pw.Container(
                    width: 5,
                    height: 5,
                    color: PdfColors.black,
                  ),
                  pw.SizedBox(width: 5),
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        "${element.jobDuties}",
                        style: const pw.TextStyle(
                          fontSize: 9,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          );
          _widgets.add(item);
          _widgets.add(
            pw.SizedBox(height: 4),
          );
        }
      }
    }
  }

  pw.Widget get titleWidget => _pdfRepo.getUserData.personal!.title!.isEmpty
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
