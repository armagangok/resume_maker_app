import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:resume_maker_app/core/util/pdf_maker/repository/repo.dart';

import '../logger.dart';
import 'components/pdf_components.dart';
import 'contract/template_contract.dart';

// const String path = 'assets/person.png';

class CloudTemplate extends ResumeTemplateContract {
  static final instance = CloudTemplate._();
  CloudTemplate._();

  @override
  final String templateName = 'Cloud Template';

  @override
  bool isSelected = true;

  @override
  String filePath = "";

  List<pw.Widget> widgets = [];
  final pdf = pw.Document();
  final PdfRepo _pdfRepo = PdfRepo.instance;

  @override
  Future<Uint8List> createPdf() async {
    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.letter.copyWith(
          marginTop: 20,
          marginLeft: 20,
          marginRight: 20,
          marginBottom: 20,
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

  @override
  void buildUpPDF() {
    // var profilePicture = _pdfRepo.getUserData.personal!.imagePath == null
    //     ? pw.SizedBox()
    //     : getPersonImage1(_pdfRepo.getUserData.personal!.imagePath!);

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
                      getIcon(0xe0ba),
                      head1Text("CONTACT"),
                    ],
                  ),
                  contactText(personalModel: _pdfRepo.getUserData.personal!),
                ],
              ),
            ),
          );

    widgets.add(
      _pdfRepo.getUserData.personal == null
          ? pw.SizedBox()
          : pw.Row(
              children: [
                // pw.Center(child: profilePicture),
                pw.SizedBox(width: 30.w),
                pw.Expanded(
                  child: pw.SizedBox(
                    child: pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.FittedBox(
                          child: nameText(
                              _pdfRepo.getUserData.personal!.fullName!),
                        ),
                        sizedBox015,
                        contactContainer,
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );

    widgets.add(sizedBox015);
    widgets.add(
      pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          head1Text("ABOUT ME"),
          customDivider(),
          aboutmeWidget,
        ],
      ),
    );

    widgets.add(educationContainer);
    widgets.add(languageContainer);
    widgets.add(skillsContainer);
    widgets.add(sizedBox015);

    // if (_pdfRepo.referenceDataList != null) {
    //   widgets.add(head1Text("REFERENCE"));
    //   widgets.add(customDivider());
    //   for (var element in _pdfRepo.referenceDataList!) {
    //     widgets.add(referenceModel(referenceModel: element));
    //     widgets.add(sizedBox015);
    //   }
    // }

    // if (_pdfRepo.experienceList != null) {
    //   widgets.add(head1Text("EXPERIENCE"));
    //   widgets.add(customDivider());
    //   widgets.add(pw.SizedBox(height: height * 0.001));
    //   for (var experience in _pdfRepo.experienceList!) {
    //     widgets.add(experienceWidget(experienceModel: experience));
    //     widgets.add(pw.SizedBox(height: height * 0.01));
    //   }
    // }

    widgets.add(sizedBox015);
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

  @override
  Future<void> savePdfFile(
    String fileName,
    Uint8List byteList,
  ) async {
    buildUpPDF();
    final output = await getTemporaryDirectory();
    var filePath = "${output.path}/$fileName.pdf";

    final file = File(filePath);
    try {
      await file.writeAsBytes(byteList);
      await OpenFile.open(filePath);
    } catch (e) {
      LogHelper.shared.debugPrint("$e");
    }
  }
}
