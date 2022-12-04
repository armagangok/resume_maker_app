import 'package:pdf/widgets.dart';
import 'package:pdf/widgets.dart' as pw;

import '../export/pdf_export.dart';

final width = PdfPageFormat.a4.availableWidth;
final height = PdfPageFormat.a4.availableHeight;
Uint8List? uint8ListData;

pw.Widget symmetricPadding(Widget column) {
  return Padding(
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
    style: TextStyle(
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
      style: Theme.of(context).defaultTextStyle.copyWith(
            fontSize: 10,
          ),
    ),
  );
}

pw.Divider customDivider() => pw.Divider(
      height: 0,
      thickness: 0.85,
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
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontBold: Font.helveticaBold(),
    ),
    maxLines: 1,
  );
}

pw.Widget educationText({required List<EducationDataModel> educationList}) {
  return pw.ListView.separated(
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        var educationModel = educationList[index];
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            educationModel.university == null
                ? pw.SizedBox()
                : pw.Text(educationModel.university!),
            educationModel.major == null
                ? pw.SizedBox()
                : pw.Text(educationModel.major!),
            educationModel.grade == null
                ? pw.SizedBox()
                : pw.Text(educationModel.grade!),
            pw.Row(
              children: [
                pw.Text(
                  "${educationModel.schoolStartDate} - ${educationModel.schoolEndDate!.isEmpty ? "Present" : educationModel.schoolEndDate}",
                ),
              ],
            )
          ],
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: height * 0.01);
      },
      itemCount: educationList.length);
}

pw.Widget contactText({required PersonalDataModel personalDataModel}) {
  return pw.FittedBox(
    child: pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          "E-mail: ${personalDataModel.email}",
          maxLines: 1,
        ),
        pw.Text(
          "Contact number: ${personalDataModel.phoneNumber}",
          maxLines: 1,
        ),
        pw.Text(
          "Linkedin: ${personalDataModel.linkedin}",
          maxLines: 1,
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
    decoration: BoxDecoration(
      color: PdfColors.orange,
      shape: BoxShape.circle,
      image: pw.DecorationImage(
        image: byte,
        fit: BoxFit.cover,
      ),
    ),
  );
}

pw.Widget skillText({required List<SkillModel> skills}) {
  return ListView.builder(
    padding: const pw.EdgeInsets.all(0),
    itemBuilder: (context, index) {
      var skill = skills[index];
      return sideTextBody("Skills: ${skill.skill}");
    },
    itemCount: skills.length,
  );
}

pw.Widget languagesText({required List<LanguageModel> languageList}) {
  var column = pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [],
  );
  for (var languageModel in languageList) {
    column.children.add(
      sideTextBody("Languages: ${languageModel.language}"),
    );
  }

  return column;
}

pw.Widget experienceWidget({required ExperienceModel experienceModel}) {
  return pw.SizedBox(
    width: width,
    child: pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text("Job role: ${experienceModel.jobRole}"),
        pw.Text("Company name: ${experienceModel.companyName}"),
        pw.Text("Skills: ${experienceModel.skills}"),
        pw.Text(
          "Start date: ${experienceModel.jobStartDate}   End date: ${experienceModel.jobEndDate}",
        ),
      ],
    ),
  );
}

pw.Widget referenceModel({required ReferenceModel referenceModel}) {
  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.Text("Name: ${referenceModel.name}"),
      pw.Text("Job role: ${referenceModel.profession}"),
      pw.Text("Recent company: ${referenceModel.recentCompany}"),
      pw.Text("Email: ${referenceModel.email}"),
      pw.Text("Phone number: ${referenceModel.phoneNumber}"),
    ],
  );
}

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
    padding: EdgeInsets.symmetric(
      vertical: width * 0.01,
    ),
    child: pw.Container(
      width: width * 0.35,
      decoration: const pw.BoxDecoration(
        color: PdfColors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(3),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.005,
        vertical: width * 0.0025,
      ),
      child: column,
    ),
  );
}

pw.Widget getIcon(int codePoint) => pw.Padding(
      padding: EdgeInsets.only(
        right: width * 0.01,
      ),
      child: pw.Icon(
        pw.IconData(codePoint),
        color: PdfColors.black,
        size: 15,
      ),
    );


// pw.Widget getPersonImage(Uint8List? uint8ListData) {
//   return uint8ListData == null
//       ? SizedBox()
//       : pw.Container(
//           width: double.infinity,
//           height: width / 2.7,
//           color: PdfColors.grey,
//           child: pw.Image(
//             pw.MemoryImage(uint8ListData),
//             fit: pw.BoxFit.fitHeight,
//           ),
//         );
// }