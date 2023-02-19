import 'dart:io';
import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:resume_maker_app/core/export/export.dart';
import 'package:resume_maker_app/data/models/skills/skills.dart';

import '../../../../data/models/experience/experience.dart';

final width = PdfPageFormat.a4.availableWidth;
final height = PdfPageFormat.a4.availableHeight;
Uint8List? uint8ListData;

pw.Widget symmetricPadding(pw.Widget column) {
  return pw.Padding(
    padding: pw.EdgeInsets.symmetric(
      horizontal: width * 0.03,
      vertical: width * 0.03,
    ),
    child: column,
  );
}

pw.Widget get sizedBox015 => pw.SizedBox(
      height: height * 0.02,
    );

pw.Widget head1Text(String text) {
  return pw.Text(
    text,
    style: pw.TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      fontBold: Font.helveticaBold(),
    ),
  );
}

pw.Widget sideTextBody(String text) {
  return pw.Builder(
    builder: (context) => pw.Text(
      text,
      style: pw.Theme.of(context).defaultTextStyle.copyWith(
            fontSize: 10,
          ),
    ),
  );
}

pw.Divider customDivider() => pw.Divider(
      height: 0,
      thickness: 1,
      color: PdfColors.grey600,
    );

pw.Text aboutMeText({required String aboutMeText}) {
  return pw.Text(
    aboutMeText,
  );
}

pw.Text nameText(String name) {
  return pw.Text(
    name.toUpperCase(),
    style: pw.TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      fontBold: Font.helveticaBold(),
    ),
    maxLines: 1,
  );
}

pw.Widget educationText({required List<Education> educationList}) {
  return pw.ListView.separated(
      padding: pw.EdgeInsets.zero,
      itemBuilder: (context, index) {
        var educationModel = educationList[index];
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            // educationModel.university == null
            //     ? pw.SizedBox()
            //     : pw.Text("School: ${educationModel.university!}"),
            // educationModel.school == null
            //     ? pw.SizedBox()
            //     : pw.Text("Major: ${educationModel.major!}"),
            // educationModel.grade == null
            //     ? pw.SizedBox()
            //     : pw.Text("Grade: ${educationModel.grade!}"),
            // pw.Row(
            //   children: [
            //     pw.Text(
            //       "Start Date: ${educationModel.schoolStartDate} - End Date: ${educationModel.schoolEndDate!.isEmpty ? "Present" : educationModel.schoolEndDate}",
            //     ),
            //   ],
            // )
          ],
        );
      },
      separatorBuilder: (context, index) {
        return pw.SizedBox(height: height * 0.01);
      },
      itemCount: educationList.length);
}

pw.Widget contactText({required Personal personalModel}) {
  return pw.FittedBox(
    child: pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.ListView.builder(
          itemBuilder: (context, index) {
            return pw.Text("Email: ${personalModel.emails![index]}");
          },
          itemCount: personalModel.emails!.length,
        ),
        pw.ListView.builder(
          itemBuilder: (context, index) {
            return pw.Text(
              "Contact number: ${personalModel.phones![index]}",
              maxLines: 1,
            );
          },
          itemCount: personalModel.phones!.length,
        ),
        pw.ListView.builder(
          itemBuilder: (context, index) {
            return pw.Text(
              "Link: ${personalModel.links![index]}",
              maxLines: 1,
            );
          },
          itemCount: personalModel.links!.length,
        ),
        pw.Text(
          "Location: ${personalModel.country}, ${personalModel.city} \n${personalModel.street}, ${personalModel.zipCode}",
        ),
      ],
    ),
  );
}

pw.Widget getPersonImage1(String imagePath) {
  var image = File(imagePath);
  final byte = pw.MemoryImage(image.readAsBytesSync());

  return pw.Container(
    width: width * 0.4,
    height: width * 0.4,
    decoration: pw.BoxDecoration(
      color: PdfColors.orange,
      // shape: BoxShape.circle,
      borderRadius: borderRadius6(),
      image: pw.DecorationImage(
        image: byte,
        fit: pw.BoxFit.cover,
      ),
    ),
  );
}

pw.Widget skillText({required List<Skills> skills}) {
  var column = pw.Wrap(
    children: [],
  );
  for (var index = 0; index < skills.length; index++) {
    column.children.add(sideTextBody(skills[index].skillName!));
    if (index != skills.length - 1) column.children.add(pw.Text(", "));
  }

  return column;
}

pw.Widget languagesText({required List<Language> languageList}) {
  var column = pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [],
  );
  for (var languageModel in languageList) {
    column.children.add(
      sideTextBody(
          "Languages: -${languageModel.languageName}\n${languageModel.speaking}, ${languageModel.reading}, ${languageModel.writing}"),
    );
  }

  return column;
}

pw.Widget experienceWidget({required Experience experienceModel}) {
  return pw.Container(
    decoration: pw.BoxDecoration(
      color: PdfColors.grey100,
      border: pw.Border.all(color: PdfColors.grey200),
      borderRadius: borderRadius6(),
    ),
    padding: pw.EdgeInsets.all(width * 0.015),
    width: double.infinity,
    child: pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          "Company name: ${experienceModel.company}",
          style: pw.TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        pw.Text("Job role: ${experienceModel.jobTitle}"),
        pw.Text("Skills: ${experienceModel.jobDuties}"),
        pw.Text(
          "Start date: ${experienceModel.startDate}   End date: ${experienceModel.endDate}",
        ),
      ],
    ),
  );
}

pw.BorderRadius borderRadius6() {
  return const pw.BorderRadius.all(
    Radius.circular(6),
  );
}

// pw.Widget referenceModel({required ReferenceModel referenceModel}) {
//   return pw.Column(
//     crossAxisAlignment: pw.CrossAxisAlignment.start,
//     children: [
//       RichText(
//         text: TextSpan(
//           children: [
//             TextSpan(
//               text: "Name: ",
//               style: pw.TextStyle(
//                 fontBold: Font.courierBold(),
//                 color: PdfColors.black,
//               ),
//             ),
//             TextSpan(
//               text: "${referenceModel.name}",
//             ),
//           ],
//         ),
//       ),
//       RichText(
//         text: TextSpan(
//           children: [
//             TextSpan(
//               text: "Job role: ",
//               style: pw.TextStyle(
//                 fontBold: Font.courierBold(),
//                 color: PdfColors.black,
//               ),
//             ),
//             TextSpan(
//               text: "${referenceModel.profession}",
//             ),
//           ],
//         ),
//       ),
//       RichText(
//         text: TextSpan(
//           children: [
//             TextSpan(
//               text: "Recent company: ",
//               style: pw.TextStyle(
//                 fontBold: Font.courierBold(),
//                 color: PdfColors.black,
//               ),
//             ),
//             TextSpan(
//               text: "${referenceModel.recentCompany}",
//             ),
//           ],
//         ),
//       ),
//       RichText(
//         text: TextSpan(
//           children: [
//             TextSpan(
//               text: "Email: ",
//               style: pw.TextStyle(
//                 fontBold: Font.courierBold(),
//                 color: PdfColors.black,
//               ),
//             ),
//             TextSpan(
//               text: "${referenceModel.email}",
//             ),
//           ],
//         ),
//       ),
//       pw.RichText(
//         text: TextSpan(
//           children: [
//             TextSpan(
//               text: "Phone number: ",
//               style: pw.TextStyle(
//                 fontBold: Font.timesBold(),
//                 color: PdfColors.black,
//               ),
//             ),
//             TextSpan(
//               text: "${referenceModel.phoneNumber}",
//             ),
//           ],
//         ),
//       ),
//     ],
//   );
// }

// Future<Uint8List> getImageBytes(String? imagePath) async {
//   final ByteData bytes = await rootBundle.load(imagePath!);
//   final Uint8List byte = bytes.buffer.asUint8List();
//   return byte;
// }

dynamic checkIfNull(dynamic data) {
  return data ?? pw.SizedBox();
}

pw.Widget whiteHeadContainer({required pw.Widget column}) {
  return pw.Padding(
    padding: pw.EdgeInsets.symmetric(
      vertical: width * 0.01,
    ),
    child: pw.Container(
      width: width * 0.35,
      decoration: const pw.BoxDecoration(
        color: PdfColors.white,
        borderRadius: pw.BorderRadius.all(
          Radius.circular(3),
        ),
      ),
      padding: pw.EdgeInsets.symmetric(
        horizontal: width * 0.005,
        vertical: width * 0.0025,
      ),
      child: column,
    ),
  );
}

pw.Widget getIcon(int codePoint) => pw.Padding(
      padding: pw.EdgeInsets.only(
        right: width * 0.01,
      ),
      child: pw.Icon(
        pw.IconData(codePoint),
        color: PdfColors.black,
        size: 15,
      ),
    );
