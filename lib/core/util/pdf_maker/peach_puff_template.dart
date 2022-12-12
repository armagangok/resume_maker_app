// ignoreforfile: avoidprint

import 'dart:io';
import 'dart:typed_data';

import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';
import 'package:resume_maker_app/core/util/pdf_maker/repository/repo.dart';

import 'components/pdf_components.dart';

// const String path = 'assets/person.png';

class PeachPuffTemplate {
  PeachPuffTemplate({
    required PdfRepo repo,
  }) {
    myrepo = repo;
  }

  late PdfRepo myrepo;

  final pdf = pw.Document();
  List<pw.Widget> widgets = [];

  Future<Uint8List> createPdf() async {
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
          myrepo.personalDataModel == null
              ? SizedBox()
              : getPersonImage1(myrepo.personalDataModel!.imagePath),
          pw.Expanded(
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                sizedBox015,
                myrepo.languageList == null
                    ? SizedBox()
                    : pw.Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          myrepo.educationDataModel == null
                              ? SizedBox()
                              : pw.Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    head1Text("EDUCATION"),
                                    educationText(
                                        educationList:
                                            myrepo.educationDataModel!),
                                  ],
                                ),
                          sizedBox015,
                          pw.Row(
                            children: [
                              getIcon(0xe894),
                              head1Text("LANGUAGES"),
                            ],
                          ),
                          languagesText(languageList: myrepo.languageList!),
                          sizedBox015,
                        ],
                      ),
                myrepo.skillsList == null
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
                          skillText(skills: myrepo.skillsList!),
                        ],
                      ),
                pw.Spacer(),
                myrepo.personalDataModel == null
                    ? SizedBox()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          head1Text("CONTACT"),
                          contactText(
                              personalDataModel: myrepo.personalDataModel!),
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
            myrepo.personalDataModel == null
                ? SizedBox()
                : nameText(myrepo.personalDataModel!.name),
            sizedBox015,
            myrepo.personalDataModel == null
                ? pw.SizedBox()
                : pw.Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      head1Text("ABOUT ME"),
                      customDivider(),
                      aboutMeText(
                          aboutMeText: myrepo.personalDataModel!.aboutMeText)
                    ],
                  ),
            sizedBox015,
            myrepo.referenceDataList == null
                ? SizedBox()
                : pw.Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      head1Text("REFERENCE"),
                      customDivider(),
                      // referenceModel(referenceList: referenceDataList!),
                    ],
                  ),
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

  Future<void> savePdfFile(
    String fileName,
    Uint8List byteList,
  ) async {
    final output = await getTemporaryDirectory();
    var filePath = "${output.path}/$fileName.pdf";

    final file = File(filePath);
    try {
      await file.writeAsBytes(byteList);
      await OpenFile.open(filePath);
    } catch (e) {
      print("$e");
    }
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
