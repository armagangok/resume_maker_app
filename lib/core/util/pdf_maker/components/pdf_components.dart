import 'dart:typed_data';

import 'package:pdf/widgets.dart';
import 'package:pdf/widgets.dart' as pw;


import '../../../export/export.dart';

double width = PdfPageFormat.a4.width;
double height = PdfPageFormat.a4.height;

Uint8List? uint8ListData;

pw.Widget get sizedBox015 => pw.SizedBox(
      height: 10.h,
    );

pw.Widget head1Text(String text) => pw.Text(
      text,
      textAlign: TextAlign.left,
      style: pw.TextStyle(
        fontSize: 12.5,
        // fontWeight: FontWeight.,
        fontWeight: pw.FontWeight.bold,
        color: PdfColor.fromInt(Injection.colorPickerCubit.selectedColor.value),
      ),
    );

pw.Widget sideTextBody(String text) => pw.Builder(
      builder: (context) => pw.Text(
        text,
        style: pw.Theme.of(context).defaultTextStyle.copyWith(
              fontSize: 10,
            ),
      ),
    );

pw.Divider customDivider() => pw.Divider(
      height: 0,
      thickness: 1.3.h,
      color: PdfColors.grey800,
    );

pw.Text aboutMeText({required String aboutMeText}) => pw.Text(
      aboutMeText,
      textAlign: TextAlign.left,
      style: const pw.TextStyle(
        color: PdfColors.grey800,
        fontSize: 10,
      ),
    );

pw.Widget nameText(String name) => pw.FittedBox(
      child: pw.Text(
        name.toUpperCase(),
        style: pw.TextStyle(
          fontSize: 20,
          color:
              PdfColor.fromInt(Injection.colorPickerCubit.selectedColor.value),
        ),
        maxLines: 1,
      ),
    );

pw.Widget educationText({required List<Education> educationList}) =>
    pw.ListView.separated(
      padding: pw.EdgeInsets.zero,
      itemBuilder: (context, index) {
        var educationModel = educationList[index];
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            educationModel.university == null
                ? pw.SizedBox()
                : pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.FittedBox(
                        child: pw.Text(
                          "${educationModel.university!}, ${educationModel.major!}",
                          maxLines: 1,
                          style: const pw.TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ),
                      pw.SizedBox(width: 50),
                      pw.Text(
                        "${educationModel.startDate!} - ${educationModel.endDate!}",
                        style: const pw.TextStyle(
                          fontSize: 9,
                        ),
                      ),
                    ],
                  ),
          ],
        );
      },
      separatorBuilder: (context, index) => pw.SizedBox(height: 1),
      itemCount: educationList.length,
    );

pw.Widget contactText({required Personal personalModel}) => pw.Column(
      children: [
        personalModel.link!.isNotEmpty
            ? pw.Row(
                children: [
                  getIcon(0xe157),
                  pw.Text(
                    "Link                 :",
                    style: pw.TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  _linkItem(personalModel),
                ],
              )
            : pw.SizedBox(),
        personalModel.country!.isNotEmpty
            ? pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Row(
                    children: [
                      getIcon(0xf05f),
                      pw.FittedBox(
                        child: pw.Text(
                          "Location      :",
                          style: pw.TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                        ),
                      ),
                      pw.FittedBox(
                        child: pw.Text(
                          "${personalModel.country}, ${personalModel.city} ${personalModel.street}, ${personalModel.zipCode}",
                          style: const pw.TextStyle(fontSize: 10),
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            : pw.SizedBox(),
      ],
    );

pw.Widget _linkItem(Personal personalModel) => pw.SizedBox(
      width: width * 0.36,
      child: pw.Text(
        personalModel.link!,
        maxLines: 1,
        style: const pw.TextStyle(
          fontSize: 10,
        ),
      ),
    );

pw.Widget emailItem(Personal personalModel, int index) => pw.Text(
      personalModel.email!,
      maxLines: 1,
      style: const pw.TextStyle(
        fontSize: 10,
      ),
    );

pw.Widget skillText({required List<Skills> skills}) {
  var column = pw.Row(
    children: [],
  );
  for (var index = 0; index < skills.length; index++) {
    column.children.add(
      sideTextBody(skills[index].skillName!),
    );

    if (index != skills.length - 1) {
      column.children.add(pw.Text(", "));
    } else {}
  }
  return column;
}

pw.Widget voluntaryText({required List<Voluntary> voluntary}) {
  var column = pw.Wrap(
    children: [],
  );
  for (var index = 0; index < voluntary.length; index++) {
    column.children.add(
      sideTextBody(
        voluntary[index].voluntaryTitle!,
      ),
    );
    column.children.add(
      sideTextBody(
        voluntary[index].voluntaryDescription!,
      ),
    );
    if (voluntary.length - 1 != index) {
      column.children.add(pw.SizedBox(height: 15));
    }
  }
  return column;
}

pw.Widget languagesText({required List<Language> languageList}) {
  var column = pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [],
  );
  for (Language languageModel in languageList) {
    column.children.add(
      pw.Builder(
        builder: (context) {
          return pw.Text(
            "-${languageModel.languageName}, ${languageModel.languageLevel}",
            style: pw.Theme.of(context).defaultTextStyle.copyWith(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
          );
        },
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
    var item = pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Text(
              "${element.company}",
              style: pw.TextStyle(
                fontSize: 10,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.Text(
              "${element.startDate} - ${element.endDate}",
              style: const pw.TextStyle(fontSize: 10),
            ),
          ],
        ),
        pw.Row(
          children: [
            pw.Container(
              width: 5,
              height: 5,
              color: PdfColors.black,
            ),
            pw.SizedBox(width: 5),
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  "${element.jobDuties}",
                  style: const pw.TextStyle(
                    fontSize: 9,
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
    column.children.add(item);
    column.children.add(
      pw.SizedBox(
        height: 4,
      ),
    );
  }

  return column;
}

pw.BorderRadius borderRadius6() => const pw.BorderRadius.all(
      Radius.circular(6),
    );

dynamic checkIfNull(dynamic data) => data ?? pw.SizedBox();

pw.Widget whiteHeadContainer({required pw.Widget column}) => pw.Padding(
      padding: pw.EdgeInsets.symmetric(
        vertical: width * 0.01,
      ),
      child: pw.Container(
        width: width * 0.38,
        child: column,
      ),
    );

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

