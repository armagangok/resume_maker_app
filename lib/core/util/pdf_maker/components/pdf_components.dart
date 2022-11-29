import 'dart:io';

import 'package:flutter/services.dart';

import 'package:pdf/widgets.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../../../feature/education/education_export.dart';
import '../../../../feature/experience/data/model/experience_model.dart';
import '../../../../feature/language/data/model/language_model.dart';
import '../../../../feature/personal_details/data/model/personal_data_model.dart';
import '../../../../feature/references/data/model/reference_model.dart';
import '../../../../feature/skills/data/model/skill_model.dart';

final width = PdfPageFormat.a4.availableWidth;
final height = PdfPageFormat.a4.availableHeight;
Uint8List? uint8ListData;

pw.Widget symmetricPadding(Widget widget) {
  return Padding(
    padding: pw.EdgeInsets.symmetric(
      horizontal: width * 0.03,
      vertical: width * 0.03,
    ),
    child: widget,
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
      thickness: 0.5,
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
    ),
    maxLines: 1,
  );
}

pw.Widget academicText({required List<EducationDataModel> academicDataList}) {
  return pw.ListView.separated(
      itemBuilder: (context, index) {
        var academicDataModel = academicDataList[index];
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            academicDataModel.university == null
                ? pw.SizedBox()
                : pw.Text(academicDataModel.university!),
            academicDataModel.major == null
                ? pw.SizedBox()
                : pw.Text(academicDataModel.major!),
            academicDataModel.grade == null
                ? pw.SizedBox()
                : pw.Text(academicDataModel.grade!),
            pw.Row(
              children: [
                pw.Text(
                  "${academicDataModel.schoolStartDate} - ${academicDataModel.schoolEndDate!.isEmpty ? "Present" : academicDataModel.schoolEndDate}",
                ),
              ],
            )
          ],
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: height * 0.01);
      },
      itemCount: academicDataList.length);
}

pw.Widget contactText({required PersonalDataModel personalDataModel}) {
  return pw.FittedBox(
    child: pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Row(
          children: [
            getIcon(0xe0be),
            pw.Text(
              "E-mail: ${personalDataModel.email}",
              maxLines: 1,
            ),
          ],
        ),
        pw.Row(
          children: [
            getIcon(0xe0ba),
            pw.Text(
              "Contact number: ${personalDataModel.phoneNumber}",
              maxLines: 1,
            ),
          ],
        ),
        pw.Row(
          children: [
            getIcon(0xea1d),
            pw.Text(
              "Linkedin: ${personalDataModel.linkedin}",
              maxLines: 1,
            ),
          ],
        ),
      ],
    ),
  );
}

pw.Widget getPersonImage(Uint8List? uint8ListData) {
  return uint8ListData == null
      ? SizedBox()
      : pw.Container(
          width: double.infinity,
          height: width / 2.7,
          color: PdfColors.grey,
          child: pw.Image(
            pw.MemoryImage(uint8ListData),
            fit: pw.BoxFit.fitHeight,
          ),
        );
}

pw.Widget getPersonImage1(String imagePath) {
  var image = File(imagePath);
  final byte = pw.MemoryImage(image.readAsBytesSync());

  return pw.Container(
    width: double.infinity,
    height: width / 2.7,
    child: pw.Image(
      byte,
      fit: pw.BoxFit.fitHeight,
    ),
  );
}

pw.Widget skillText({required List<SkillModel> skills}) {
  return ListView.builder(
    itemBuilder: (context, index) {
      var skill = skills[index];
      return sideTextBody("Skills: ${skill.skill}");
    },
    itemCount: skills.length,
  );
}

pw.Widget languagesText({required List<LanguageModel> languageList}) {
  return pw.ListView.builder(
    itemBuilder: (context, index) {
      var languageModel = languageList[index];
      return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          sideTextBody("Languages: ${languageModel.language}"),
        ],
      );
    },
    itemCount: languageList.length,
  );
}

pw.Widget experienceText({required List<ExperienceModel> experienceList}) {
  return pw.ListView.separated(
    itemBuilder: (context, index) {
      var experience = experienceList[index];
      return pw.SizedBox(
        width: width,
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text("Job role: ${experience.jobRole}"),
            pw.Text("Company name: ${experience.companyName}"),
            pw.Text("Skills: ${experience.skills}"),
            pw.Text(
              "Start date: ${experience.jobStartDate}   End date: ${experience.jobEndDate}",
            ),
          ],
        ),
      );
    },
    separatorBuilder: (context, index) => pw.SizedBox(height: height * 0.01),
    itemCount: experienceList.length,
  );
}

pw.Widget referenceText({required List<ReferenceModel> referenceList}) {
  return ListView.separated(
    itemBuilder: (context, index) {
      var referenceModel = referenceList[index];
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
    },
    separatorBuilder: (context, index) => SizedBox(height: height * 0.01),
    itemCount: referenceList.length,
  );
}

Future<Uint8List> getImageBytes(String? imagePath) async {
  final ByteData bytes = await rootBundle.load(imagePath ?? "");
  final Uint8List byte = bytes.buffer.asUint8List();
  return byte;
}

dynamic checkIfNull(dynamic data) {
  return data ?? pw.SizedBox();
}

pw.Widget whiteHeadContainer({required pw.Widget widget}) {
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
      child: widget,
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
