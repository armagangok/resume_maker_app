import 'dart:typed_data';

import 'package:pdf/widgets.dart' as pw;

import '../../../export/export.dart';
import '../components/pdf_components.dart';

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

  final pdf = pw.Document();
  List<pw.Widget> widgets = [];

  @override
  Future<Uint8List> getcreatedPdf() async {
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
          // _myrepo.getUserData.personal == null
          //     ? SizedBox()
          //     : getPersonImage1(_myrepo.getUserData.personal!.imagePath),
          pw.Expanded(
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
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.start,
                                  children: [
                                    head1Text("EDUCATION"),
                                    educationText(
                                        educationList:
                                            _myrepo.getUserData.education!),
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
                pw.Spacer(),
                _myrepo.getUserData.personal == null
                    ? pw.SizedBox()
                    : pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          head1Text("CONTACT"),
                          contactText(
                              personalModel: _myrepo.getUserData.personal!),
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
                          aboutMeText: _myrepo.getUserData.personal!.summary!)
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  @override
  Future<String> getFilePathToSave() async {
    final output = await getExternalStorageDirectory();

    filePath = "${output!.path}/${"${DateTime.now()}"}.pdf";

    return filePath;
  }

  @override
  void buildUpPDF() {
    widgets.add(
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
