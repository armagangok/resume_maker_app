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

  final PdfRepository _pdfRepo = PdfRepository.instance;

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
    row.children.clear();

    var aboutmeWidget = _pdfRepo.getUserData.personal!.summary!.isEmpty
        ? pw.SizedBox()
        : aboutMeText(aboutMeText: _pdfRepo.getUserData.personal!.summary!);

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
                  languagesText(languageList: _pdfRepo.getUserData.languages!),
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
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Row(
                  children: [
                    head1Text("CONTACT"),
                  ],
                ),
                sizedBox015,
                contactText(personalModel: _pdfRepo.getUserData.personal!),
              ],
            ),
          );

    var nameWidget = _pdfRepo.getUserData.personal == null
        ? pw.SizedBox()
        : nameText(_pdfRepo.getUserData.personal!.fullName!);

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

    pw.Container leftWidget = pw.Container(
      padding: const pw.EdgeInsets.all(10),
      decoration: _blueBoxDecoration(),
      width: width * 0.4,
      height: 568,
      child: pw.Column(
        mainAxisAlignment: pw.MainAxisAlignment.start,
        children: [
          contactContainer,
          sizedBox015,
          sizedBox015,
          languageContainer,
          sizedBox015,
          sizedBox015,
        ],
      ),
    );

    var rightColumn = pw.Column(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      children: [],
    );

    rightColumn.children.add(
      aboutmeWidget,
    );

    rightColumn.children.add(
      sizedBox015,
    );

    rightColumn.children.add(
      sizedBox015,
    );

    rightColumn.children.add(
      experiencesWidget(),
    );

    rightColumn.children.add(educationContainer);

    rightColumn.children.add(sizedBox015);
    rightColumn.children.add(sizedBox015);
    rightColumn.children.add(skillsContainer);

    _widgets.add(
      pw.Padding(
        padding: const pw.EdgeInsets.all(10),
        child: pw.Container(
          width: double.infinity,
          decoration: pw.BoxDecoration(
            border: pw.Border.all(
              color: PdfColors.black,
            ),
          ),
          child: pw.Column(
            children: [
              nameWidget,
              titleWidget,
            ],
          ),
        ),
      ),
    );

    var a = _rightContainer(rightColumn);

    row.children.add(leftWidget);
    row.children.add(a);
    _widgets.add(row);
    _widgets.add(qualificationsWidget);
  }

  pw.Container _rightContainer(pw.Widget widget) {
    return pw.Container(
      padding: const pw.EdgeInsets.symmetric(horizontal: 10),
      width: width * 0.6,
      child: widget,
    );
  }

  pw.BoxDecoration _blueBoxDecoration() {
    // var a = Injection.colorPickerCubit.selectedColor;

    return pw.BoxDecoration(
      color: PdfColors.grey100,
      border: pw.Border.all(color: PdfColors.grey200),
      borderRadius: const pw.BorderRadius.all(
        pw.Radius.circular(2),
      ),
    );
  }

  pw.Widget experiencesWidget() => _pdfRepo.getUserData.experiences!.isEmpty
      ? pw.SizedBox()
      : pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            head1Text("WORK EXPERIENCE"),
            pw.SizedBox(height: 2.5),
            experienceText(
              experienceList: _pdfRepo.getUserData.experiences!,
            ),
          ],
        );

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
