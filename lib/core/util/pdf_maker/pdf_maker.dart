// ignore_for_file: avoid_print

import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'package:resume_maker_app/feature/academic/academic_export.dart';
import 'package:resume_maker_app/feature/references/data/contract/reference_repository.dart';

import '../../../feature/experience/data/contract/experience_repository.dart';
import '../../../feature/experience/data/model/experience_model.dart';
import '../../../feature/personal_details/data/contract/personal_data_repository.dart';
import '../../../feature/personal_details/export/personal_export.dart';
import '../../../feature/references/data/model/reference_model.dart';

const String path = 'assets/armagan.jpeg';

class PdfHelper {
  PdfHelper({
    required ExperienceRepository experienceRepository,
    required PersonalDataRepository personalDataRepository,
    required AcademicDataRepository academicDataRepository,
    required ReferenceRepository referenceRepository,
  }) {
    experienceRepo = experienceRepository;
    personalDataRepo = personalDataRepository;
    academicDataRepo = academicDataRepository;
    referenceRepo = referenceRepository;

    getImageBytes().then((value) => uint8ListData = value);
    experienceRepo.fetchExperienceData().then(
          (value) => value.fold(
            (l) async {
              (l) => LogHelper.shared.debugPrint("$l");
              return experienceList = [];
            },
            (data) {
              print(data);
              return experienceList = data;
            },
          ),
        );

    personalDataRepo.fetchPersonalData().then(
          (value) => value.fold(
            (l) => LogHelper.shared.debugPrint("$l"),
            (r) => personalDataModel = r!,
          ),
        );
    academicDataRepo.fetchAcademicData().then(
          (value) => value.fold(
            (l) => LogHelper.shared.debugPrint("$l"),
            (r) => academicDataModel = r!,
          ),
        );

    referenceRepo.fetchReferenceData().then(
          (value) => value.fold(
            (l) => LogHelper.shared.debugPrint("$l"),
            (r) => referenceDataList = r,
          ),
        );
  }

  late final ExperienceRepository experienceRepo;
  late List<ExperienceModel> experienceList;

  late final PersonalDataRepository personalDataRepo;
  late final PersonalDataModel personalDataModel;

  late final AcademicDataRepository academicDataRepo;
  late final List<AcademicDataModel> academicDataModel;

  late final ReferenceRepository referenceRepo;
  late final List<ReferenceModel> referenceDataList;

  late Uint8List uint8ListData;

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
      width: width / 2.75,
      color: PdfColors.grey300,
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          _personImage(),
          _languagesText(),
          _skillText(),
          _hobbiesText(),
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
            nameText(personalDataModel.name!),
            aboutMeText(),
            sizedBox015,
            _contactText(personalDataModel: personalDataModel),
            sizedBox015,
            _academicText(academicDataList: academicDataModel),
            sizedBox015,
            head1Text("EXPERIENCE"),
            customDivider(),
            _experienceText(experienceList: experienceList),
            sizedBox015,
            _referenceText(referenceList: referenceDataList),
          ],
        ),
      ),
    );
  }

  pw.Divider customDivider() => pw.Divider(
        height: 0,
        thickness: 0.5,
        color: PdfColors.grey600,
      );

  pw.Text aboutMeText() {
    return pw.Text(
      "I have been learning and implementing Flutter for the last year. I recently use Feature Based Clean Architecture and Cubit state management to deal with my projects.",
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

  pw.Widget _academicText({required List<AcademicDataModel> academicDataList}) {
    return pw.ListView.separated(
        itemBuilder: (context, index) {
          var academicDataModel = academicDataList[index];
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              head1Text("ACADEMIC"),
              customDivider(),
              pw.Text(academicDataModel.university!),
              pw.Text(academicDataModel.major!),
              pw.Text(academicDataModel.grade!),
              pw.Row(
                children: [
                  pw.Text(
                    "${academicDataModel.schoolStartDate} - ${academicDataModel.schoolEndDate}",
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

  pw.Widget _contactText({required PersonalDataModel personalDataModel}) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Row(
          children: [
            head1Text("CONTACT"),
          ],
        ),
        customDivider(),
        pw.Row(
          children: [
            pw.Text(
              "E-mail: ${personalDataModel.email}",
            ),
          ],
        ),
        pw.Row(
          children: [
            pw.Text(
              "Contact number: ${personalDataModel.phoneNumber}",
            ),
          ],
        ),
        pw.Text(
          "Linkedin: ${personalDataModel.linkedin}",
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
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        head1Text("SKILLS"),
        sideTextBody(
          "C++, Flutter, Object-Oriented Programming, Core Data, Git/GitHub",
        ),
      ],
    );
  }

  pw.Widget _languagesText() {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        head1Text("LANGUAGES"),
        sideTextBody("English - C1"),
        sideTextBody("Turkish - Native"),
        sideTextBody("Deutch - B1+"),
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
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        head1Text("HOBBIES"),
        sideTextBody("Walking"),
        sideTextBody("Meeting with new people"),
        sideTextBody("Music"),
      ],
    );
  }

  pw.Widget _experienceText({required List<ExperienceModel> experienceList}) {
    return pw.ListView.separated(
      itemBuilder: (context, index) {
        var experience = experienceList[index];
        return pw.SizedBox(
          width: width,
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(experience.jobRole ?? ""),
              pw.Text(experience.companyName ?? ""),
              pw.Text(experience.skills ?? ""),
              pw.Text(
                "Start date: ${experience.jobStartDate} - End date: ${experience.jobEndDate},",
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => pw.SizedBox(height: height * 0.01),
      itemCount: experienceList.length,
    );
  }

  pw.Widget _referenceText({required List<ReferenceModel> referenceList}) {
    return ListView.separated(
      itemBuilder: (context, index) {
        var referenceModel = referenceList[index];
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            head1Text("REFERENCE"),
            customDivider(),
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

  Future<Uint8List> getImageBytes() async {
    final ByteData bytes = await rootBundle.load(path);
    final Uint8List byte = bytes.buffer.asUint8List();
    return byte;
  }
}
