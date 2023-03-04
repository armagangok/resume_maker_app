import 'dart:typed_data';

import 'package:pdf/widgets.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:resume_maker_app/core/export/export.dart';

final width = PdfPageFormat.letter.availableWidth;
final height = PdfPageFormat.letter.availableHeight;

Uint8List? uint8ListData;

pw.Widget symmetricPadding(pw.Widget column) {
  return pw.Padding(
    padding: pw.EdgeInsets.symmetric(
      horizontal: 20.w,
      vertical: 20.w,
    ),
    child: column,
  );
}

pw.Widget get sizedBox015 => pw.SizedBox(
      height: 10.h,
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
      thickness: 1.h,
      color: PdfColors.grey600,
    );

pw.Text aboutMeText({required String aboutMeText}) {
  return pw.Text(
    aboutMeText,
  );
}

pw.Widget nameText(String name) => pw.Text(
      name.toUpperCase(),
      style: pw.TextStyle(
        fontSize: 45,
        fontWeight: FontWeight.bold,
        fontBold: Font.helveticaBold(),
      ),
    );

pw.Widget educationText({required List<Education> educationList}) {
  return pw.ListView.separated(
    padding: pw.EdgeInsets.zero,
    itemBuilder: (context, index) {
      var educationModel = educationList[index];
      return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          educationModel.university == null
              ? pw.SizedBox()
              : pw.Text(educationModel.university!),
          educationModel.school == null
              ? pw.SizedBox()
              : pw.Text(educationModel.school!),
          educationModel.startDate == null
              ? pw.SizedBox()
              : pw.Text(
                  "Grade: ${educationModel.startDate!} - ${educationModel.endDate!}"),
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
      return pw.SizedBox(height: 10.h);
    },
    itemCount: educationList.length,
  );
}

pw.Widget contactText({required Personal personalModel}) {
  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.ListView.builder(
        itemBuilder: (context, index) {
          return pw.Text(personalModel.emails![index]);
        },
        itemCount: personalModel.emails!.length,
      ),
      pw.ListView.builder(
        itemBuilder: (context, index) {
          return pw.Text(
            personalModel.phones![index],
            maxLines: 1,
          );
        },
        itemCount: personalModel.phones!.length,
      ),
      pw.ListView.builder(
        itemBuilder: (context, index) {
          return pw.Text(
            personalModel.links![index],
            maxLines: 1,
          );
        },
        itemCount: personalModel.links!.length,
      ),
      pw.Text(
        "${personalModel.country}, ${personalModel.city} ${personalModel.street}, ${personalModel.zipCode}",
      ),
    ],
  );
}

// pw.Widget getPersonImage1(String imagePath) {
//   var image = File(imagePath);
//   final memoryImage = pw.MemoryImage(image.readAsBytesSync());

//   return pw.Container(
//     width: width * 0.4,
//     height: width * 0.4,
//     decoration: pw.BoxDecoration(
//       color: PdfColors.orange,
//       // shape: BoxShape.circle,
//       borderRadius: borderRadius6(),
//       image: pw.DecorationImage(
//         image: memoryImage,
//         fit: pw.BoxFit.cover,
//       ),
//     ),
//   );
// }

pw.Widget skillText({required List<Skills> skills}) {
  var column = pw.Wrap(
    children: [],
  );
  for (var index = 0; index < skills.length; index++) {
    column.children.add(sideTextBody(skills[index].skillName!));
    if (index != skills.length - 1) {
      column.children.add(pw.Text(", "));
    }
  }

  return column;
}

pw.Widget qualificationsText({required List<Qualifications> qualifications}) {
  var column = pw.Wrap(
    children: [],
  );
  for (var index = 0; index < qualifications.length; index++) {
    column.children.add(sideTextBody(qualifications[index].title!));
    column.children.add(sideTextBody(qualifications[index].details!));
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
        "-${languageModel.languageName}\nSpeaking: ${languageModel.speaking}\nReading: ${languageModel.reading}\nWriting: ${languageModel.writing}\n",
      ),
    );
  }

  return column;
}

pw.Widget experienceText({required List<Experience> experienceList}) {
  var column = pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [],
  );

  for (var element in experienceList) {
    var item = pw.Container(
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
            "${element.company}, ${2022} - ${element.endDate}",
            style: pw.TextStyle(
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.Text("${element.jobTitle}"),
          pw.Text("${element.jobDuties}"),
        ],
      ),
    );
    column.children.add(item);

    if (element != experienceList.last) {
      column.children.add(pw.SizedBox(height: 2.5.h));
    }
  }

  return column;
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
      width: width * 0.38,

      // decoration: const pw.BoxDecoration(
      //   color: PdfColors.white,
      //   borderRadius: pw.BorderRadius.all(
      //     Radius.circular(3),
      //   ),
      // ),
      // padding: pw.EdgeInsets.symmetric(
      //   horizontal: width * 0.005,
      //   vertical: width * 0.0025,
      // ),
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
