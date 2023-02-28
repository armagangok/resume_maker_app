import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:resume_maker_app/core/export/export.dart';

import '../components/pdf_components.dart';
import '../contract/template_contract.dart';
import '../repository/repo.dart';

// const String path = 'assets/person.png';

class PeachPuffTemplate extends ResumeTemplateContract {
  PeachPuffTemplate._();

  static final instance = PeachPuffTemplate._();

  final _myrepo = PdfRepo.instance;

  @override
  final String templateName = "Peach Puff Template";

  @override
  bool isSelected = false;

  @override
  String filePath = "";

  @override
  final int resumeTemplateID = 3;

  final List<pw.Widget> _widgets = [];

  @override
  Future<Uint8List> getcreatedPdfAsUint8List() async {
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
          return _widgets;
        },
      ),
    );
    return await pdf.save();
  }

  pw.Widget leftContainer() => pw.Container(
        padding: pw.EdgeInsets.all(width * 0.02),
        width: width * 0.45,
        height: height,
        color: PdfColors.amber50,
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            sizedBox015,
            _myrepo.getUserData.languages == null
                ? pw.SizedBox()
                : pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      _myrepo.getUserData.education == null
                          ? pw.SizedBox()
                          : pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                head1Text("EDUCATION"),
                                educationText(
                                  educationList: _myrepo.getUserData.education!,
                                ),
                              ],
                            ),
                      sizedBox015,
                      pw.Row(
                        children: [
                          getIcon(0xe894),
                          head1Text("LANGUAGES"),
                        ],
                      ),
                      languagesText(
                          languageList: _myrepo.getUserData.languages!),
                      sizedBox015,
                    ],
                  ),
            _myrepo.getUserData.skills == null
                ? pw.SizedBox()
                : pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Row(
                        children: [
                          getIcon(0xe8d0),
                          head1Text("SKILLS"),
                        ],
                      ),
                      skillText(skills: _myrepo.getUserData.skills!),
                    ],
                  ),
            
            _myrepo.getUserData.personal == null
                ? pw.SizedBox()
                : pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      head1Text("CONTACT"),
                      contactText(personalModel: _myrepo.getUserData.personal!),
                    ],
                  ),
          ],
        ),
      );

  pw.Widget rightContainer() {
    return pw.Container(
      padding: pw.EdgeInsets.all(width * 0.02),
      color: PdfColors.white,
      child: pw.Column(
        mainAxisAlignment: pw.MainAxisAlignment.start,
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          _myrepo.getUserData.personal == null
              ? pw.SizedBox()
              : nameText(_myrepo.getUserData.personal!.fullName!),
          sizedBox015,
          _myrepo.getUserData.personal == null
              ? pw.SizedBox()
              : pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    head1Text("ABOUT ME"),
                    customDivider(),
                    aboutMeText(
                      aboutMeText: _myrepo.getUserData.personal!.summary!,
                    )
                  ],
                ),
        ],
      ),
    );
  }

  @override
  Future<String> getFilePathToSave(String pdfID) async {
    return await super.getFilePathToSave(pdfID);
  }

  @override
  void buildUpPDF() {
    _widgets.clear();
    _widgets.add(
      pw.Row(
        children: [
          leftContainer(),
          rightContainer(),
        ],
      ),
    );
  }

  // Future<void> savePdfFile(
  //   String fileName,
  //   Uint8List byteList,
  // ) async {
  //   final output = await getTemporaryDirectory();
  //   var filePath = "${output.path}/$fileName.pdf";

  //   final file = File(filePath);
  //   try {
  //     await file.writeAsBytes(byteList);
  //     await OpenFile.open(filePath);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}
