import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';
import 'package:resume_maker_app/core/util/pdf_maker/repository/repo.dart';

import 'components/pdf_components.dart';
import 'contract/template_contract.dart';

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
    // pw.ThemeData myTheme = pw.ThemeData.withFont(
    //   base: Font.ttf(
    //     await rootBundle.load("assets/fonts/Lato/Lato-Regular.ttf"),
    //   ),
    // );

    pdf.addPage(
      pw.Page(
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
          return Row(
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
                    ? SizedBox()
                    : pw.Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _myrepo.getUserData.education == null
                              ? SizedBox()
                              : pw.Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                    ? SizedBox()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                ? SizedBox()
                : nameText(_myrepo.getUserData.personal!.fullName!),
            sizedBox015,
            _myrepo.getUserData.personal == null
                ? pw.SizedBox()
                : pw.Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      head1Text("ABOUT ME"),
                      customDivider(),
                      aboutMeText(
                          aboutMeText: _myrepo.getUserData.personal!.summary!)
                    ],
                  ),
            // sizedBox015,
            // _myrepo.referenceDataList == null
            //     ? SizedBox()
            //     : pw.Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           head1Text("REFERENCE"),
            //           customDivider(),
            //           // referenceModel(referenceList: referenceDataList!),
            //         ],
            //       ),
            sizedBox015,
            // experienceList == null
            //     ? SizedBox()
            //     : pw.Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           head1Text("EXPERIENCE"),
            //           customDivider(),
            //           experienceWidget(experienceModel: experienceList!),
            //         ],
            //       ),
          ],
        ),
      ),
    );
  }

  @override
  Future<String> getFilePathToSave() async {
    final output = await getTemporaryDirectory();

    filePath = "${output.path}/${"${DateTime.now()}"}.pdf";

    return filePath;

    // final file = File(_filePath);
    // try {
    //   await file.writeAsBytes(byteList);
    //   // await OpenFile.open(filePath);
    // } catch (e) {
    //   print("$e");
    // }
  }

  @override
  void buildUpPDF() {
    // TODO: implement buildUpPDF
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
