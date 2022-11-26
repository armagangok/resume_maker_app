import 'dart:io';

// import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

import '../../export/core_export.dart';

const String path = 'assets/armagan.jpeg';

class PdfHelper {
  PdfHelper() {
    getImageBytes().then((value) => uint8ListData = value);
    _pdfComponents = PdfComponents.instance;
  }
  late Uint8List uint8ListData;
  late final PdfComponents _pdfComponents;

  final pdf = pw.Document();

  Future<Uint8List> createPdf() async {
    // ThemeData myTheme = ThemeData.withFont(
    //     // base: Font.ttf(
    //     //   await rootBundle.load("assets/fonts/Lato/Lato-Regular.ttf"),
    //     // ),
    //     );

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.letter.copyWith(
          marginTop: 20,
          marginLeft: 20,
          marginRight: 0,
          marginBottom: 20,
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
      width: width / 3,
      color: PdfColors.grey300,
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          _personImage(),
          _pdfComponents.sizedBox015,
          _contactText(),
          _pdfComponents.sizedBox015,
          _languagesText(),
          _pdfComponents.sizedBox015,
          _hobbiesText(),
        ],
      ),
    );
  }

  pw.Expanded leftContainer() {
    return pw.Expanded(
      child: pw.Container(
        color: PdfColors.white,
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            nameText(),
            aboutMeText(),
            _pdfComponents.sizedBox015,
            _academicText(),
            _pdfComponents.sizedBox015,
            _experienceText(
              jobRole: "Flutter Developer(Intern)",
              companyName: "Ron Digital",
              skills: "Flutter, Firebase",
              startDate: "2022",
              endDate: "2022",
              index: 1,
            ),
            _pdfComponents.sizedBox015,
            _experienceText(
              jobRole: "Flutter Developer(Junior)",
              companyName: "Brain Kingdom",
              skills:
                  "Flutter, Firebase, Git Feature-Base Clean Architecture, Core Data",
              startDate: "2022",
              endDate: "2022",
              index: 2,
            ),
            _pdfComponents.sizedBox015,
            _referenceText(),
            _pdfComponents.sizedBox015,
            _skillText(),
          ],
        ),
      ),
    );
  }

  pw.Text aboutMeText() {
    return Text(
        "I have been learning and implementing Flutter for the last year. I recently use Feature Based Clean Architecture and Cubit state management to deal with my projects.");
  }

  pw.Text nameText() {
    return pw.Text(
      "ARMAGAN GOK",
      style: pw.TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      maxLines: 1,
    );
  }

  pw.Column _academicText() {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        _pdfComponents.head1Text("ACADEMIC"),
        pw.Text("Bursa Technical University"),
        Text("Mechatronic Engineering"),
        Text("3. grade"),
        Row(
          children: [
            Text("2019 - 2024"),
          ],
        )
      ],
    );
  }

  pw.Widget _contactText() {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Row(
          children: [
            _pdfComponents.head1Text("CONTACT"),
          ],
        ),
        pw.Row(
          children: [
            pw.Text(
              "armagangok@email.com",
            ),
          ],
        ),
        pw.Row(
          children: [
            pw.Text(
              "24 November 1999",
            ),
          ],
        ),
        pw.Text(
          "Driver License: B",
        ),
        pw.Text(
          "Driver License: B",
        ),
        pw.Text(
          "Marital Status: Single",
        ),
      ],
    );
  }

  pw.Widget _personImage() {
    return pw.Container(
      width: width / 3,
      height: width / 3,
      color: PdfColors.grey,
      child: pw.Image(
        pw.MemoryImage(
          uint8ListData,
        ),
        fit: pw.BoxFit.fitHeight,
      ),
    );
  }

  pw.Widget _skillText() {
    return Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        _pdfComponents.head1Text("SKILLS"),
        Text(
          "C++, Flutter, Object-Oriented Programming, Core Data, Git/GitHub",
        ),
      ],
    );
  }

  pw.Widget _languagesText() {
    return Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        _pdfComponents.head1Text("LANGUAGES"),
        Text("English - C1"),
        Text("Turkish - Native"),
        Text("Deutch - B1+"),
      ],
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

  pw.Widget _hobbiesText() {
    return Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        _pdfComponents.head1Text("HOBBIES"),
        Text("Walking"),
        Text("Meeting with new people"),
        Text("Music"),
      ],
    );
  }

  pw.Widget _experienceText({
    required String jobRole,
    required String companyName,
    required String skills,
    required String startDate,
    required String endDate,
    required int index,
  }) {
    return Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        _pdfComponents.head1Text("EXPERIENCE ($index)"),
        Text(jobRole),
        Text(companyName),
        Text(""),
        Text("Start date: 2022 - End date: 2022"),
      ],
    );
  }

  pw.Widget _referenceText() {
    return Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        _pdfComponents.head1Text("REFERENCE"),
        Text("Job role: Senior Flutter Developer"),
        Text("Recent company: Accenture"),
        Text("Email: Erdem@erdem.com"),
        Text("Phone number: +9083843847"),
      ],
    );
  }

  Future<Uint8List> getImageBytes() async {
    final ByteData bytes = await rootBundle.load(path);
    final Uint8List byte = bytes.buffer.asUint8List();
    return byte;
  }
}
