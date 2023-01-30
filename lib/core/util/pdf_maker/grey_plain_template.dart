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

class GreyPlainTemplate {
  GreyPlainTemplate({
    required PdfRepo myRepository,
  }) {
   _pdfRepo = myRepository;
  }

  late final PdfRepo _pdfRepo;

  final pdf = pw.Document();

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
          marginLeft: 20,
          marginRight: 0,
          marginBottom: 0,
        ),
        theme: pw.ThemeData.withFont(
          base: await PdfGoogleFonts.varelaRoundRegular(),
          bold: await PdfGoogleFonts.varelaRoundRegular(),
          icons: await PdfGoogleFonts.materialIcons(),
        ),
        build: (pw.Context context) {
          return pw.Row(
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

  pw.Widget rightContainer() {
    return pw.Container(
      padding: pw.EdgeInsets.symmetric(
        horizontal: width * 0.02,
        vertical: width * 0.02,
      ),
      width: width * 0.5,
      color: PdfColors.grey300,
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          _pdfRepo.personalDataModel == null
              ? SizedBox()
              : getPersonImage1(_pdfRepo.personalDataModel!.imagePath),
          sizedBox015,
          pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              _pdfRepo.educationDataModel == null
                  ? pw.SizedBox()
                  : pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        whiteHeadContainer(
                          column: head1Text("EDUCATION"),
                        ),
                        educationText(educationList: _pdfRepo.educationDataModel!),
                      ],
                    ),
              sizedBox015,
              _pdfRepo.languageList == null
                  ? SizedBox()
                  : pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        whiteHeadContainer(column: head1Text("LANGUAGES")),
                        languagesText(languageList: _pdfRepo.languageList!),
                        sizedBox015,
                      ],
                    ),
             _pdfRepo. skillsList == null
                  ? pw.SizedBox()
                  : pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        whiteHeadContainer(
                          column: head1Text("SKILLS"),
                        ),
                        skillText(skills: _pdfRepo.skillsList!),
                      ],
                    ),
              sizedBox015,
              _pdfRepo.personalDataModel == null
                  ? SizedBox()
                  : Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Row(
                          children: [
                            whiteHeadContainer(
                              column: head1Text("CONTACT"),
                            ),
                          ],
                        ),
                        contactText(personalDataModel: _pdfRepo.personalDataModel!),
                      ],
                    ),
            ],
          ),
        ],
      ),
    );
  }

  pw.Expanded leftContainer() {
    return pw.Expanded(
      child: pw.Container(
        padding: const pw.EdgeInsets.only(
          top: 20,
          right: 20,
        ),
        color: PdfColors.white,
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            _pdfRepo.personalDataModel == null
                ? SizedBox()
                : nameText(_pdfRepo.personalDataModel!.name),
            sizedBox015,
            _pdfRepo.personalDataModel == null
                ? pw.SizedBox()
                : pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      head1Text("ABOUT ME"),
                      customDivider(),
                      aboutMeText(aboutMeText: _pdfRepo.personalDataModel!.aboutMeText)
                    ],
                  ),
            sizedBox015,
            _pdfRepo.referenceDataList == null
                ? SizedBox()
                : pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
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
            //         crossAxisAlignment: pw.CrossAxisAlignment.start,
            //         children: [
            //           head1Text("EXPERIENCE"),
            //           customDivider(),
            //           experienceWidget(experienceModel: experienceList!),
            //         ],
            //       ),
            // sizedBox015,
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
}

// "I have been learning and implementing Flutter for the last year. I recently use Feature Based Clean Architecture and Cubit state management to deal with my projects."