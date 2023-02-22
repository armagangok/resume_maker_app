// ignoreforfile: avoidprint

import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';
import 'package:resume_maker_app/core/util/pdf_maker/contract/template_contract.dart';
import 'package:resume_maker_app/core/util/pdf_maker/repository/repo.dart';

import '../components/pdf_components.dart';

// const String path = 'assets/person.png';

class ModernTemplate extends ResumeTemplateContract {
  ModernTemplate._();

  static final instance = ModernTemplate._();

  @override
  get templateName => 'Modern Template';

  @override
  bool isSelected = true;

  @override
  String filePath = "";

  final PdfRepo _pdfRepo = PdfRepo.instance;

  final pdf = pw.Document();

  final List<pw.Widget> _widgets = [];

  @override
  Future<Uint8List> getcreatedPdf() async {
    // pw.ThemeData myTheme = pw.ThemeData.withFont(
    //   base: Font.ttf(
    //     await rootBundle.load("assets/fonts/Lato/Lato-Regular.ttf"),
    //   ),
    // );

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
        width: width * 0.35,
        height: height,
        color: PdfColors.grey300,
        child: pw.Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            _pdfRepo.getUserData.personal == null
                ? SizedBox()
                : Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10.w),
                        color:  PdfColors.grey700,
                        child: Column(
                          children: [
                            _pdfRepo.getUserData.personal!.fullName == null
                                ? SizedBox()
                                : FittedBox(
                                    child: Text(
                                      _pdfRepo.getUserData.personal!.fullName!,
                                      style: const pw.TextStyle(
                                        color: PdfColors.white,
                                        fontSize: 35,
                                      ),
                                      maxLines: 1,
                                    ),
                                  ),
                            _pdfRepo.getUserData.personal!.title == null
                                ? SizedBox()
                                : FittedBox(
                                    child: Text(
                                      _pdfRepo.getUserData.personal!.title!,
                                      style: const pw.TextStyle(
                                        color: PdfColors.white,
                                      ),
                                      maxLines: 1,
                                    ),
                                  ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      pw.Row(
                        children: [
                          head1Text("CONTACT"),
                        ],
                      ),
                      contactText(
                        personalModel: _pdfRepo.getUserData.personal!,
                      ),
                    ],
                  ),
            sizedBox015,

            _pdfRepo.getUserData.skills == null
                ? pw.SizedBox()
                : pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      head1Text("SKILLS"),
                      skillText(skills: _pdfRepo.getUserData.skills!),
                    ],
                  ),
            // _pdfRepo.getUserData.personal!.imagePath == null
            //     ? SizedBox()
            //     : getPersonImage1(_pdfRepo.getUserData.personal!.imagePath!),
            sizedBox015,
            pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                _pdfRepo.getUserData.education == null
                    ? pw.SizedBox()
                    : pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          head1Text("EDUCATION"),
                          educationText(
                            educationList: _pdfRepo.getUserData.education!,
                          ),
                        ],
                      ),
                sizedBox015,
                _pdfRepo.getUserData.languages == null
                    ? SizedBox()
                    : pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          head1Text("LANGUAGES"),
                          languagesText(
                            languageList: _pdfRepo.getUserData.languages!,
                          ),
                          sizedBox015,
                        ],
                      ),
                sizedBox015,
              ],
            ),
          ],
        ),
      );

  pw.Expanded rightContainer() => pw.Expanded(
        child: pw.Container(
          height: height,
          color: PdfColors.white,
          child: pw.Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              sizedBox015,
              _pdfRepo.getUserData.personal == null
                  ? pw.SizedBox()
                  : pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        head1Text("ABOUT ME"),
                        customDivider(),
                        aboutMeText(
                            aboutMeText:
                                _pdfRepo.getUserData.personal!.summary!)
                      ],
                    ),
              sizedBox015,
              // _pdfRepo.referenceDataList == null
              //     ? SizedBox()
              //     : pw.Column(
              //         crossAxisAlignment: pw.CrossAxisAlignment.start,
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

  @override
  Future<String> getFilePathToSave() async {
    final output = await getTemporaryDirectory();

    filePath = "${output.path}/${"${DateTime.now()}"}.pdf";

    return filePath;

    // final file = File(filePath);
    // try {
    //   // await file.writeAsBytes(byteList);
    //   // await OpenFile.open(filePath);
    // } catch (e) {
    //   print("$e");
    // }
  }

  @override
  void buildUpPDF() {
    _widgets.add(
      pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          leftContainer(),
          rightContainer(),
        ],
      ),
    );
  }
}

// "I have been learning and implementing Flutter for the last year. I recently use Feature Based Clean Architecture and Cubit state management to deal with my projects."