import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

import '../../export/core_export.dart';
import '../../widget/snackbar.dart';

class PdfMaker {
  final _width = PdfPageFormat.a4.availableWidth;
  final _height = PdfPageFormat.a4.availableHeight;

  Future<Uint8List> createOrderPdf() async {
    // ThemeData myTheme = ThemeData.withFont(
    //     // base: Font.ttf(
    //     //   await rootBundle.load("assets/fonts/Lato/Lato-Regular.ttf"),
    //     // ),
    //     );

    final pdf = Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Row(
            children: [
              pw.Expanded(
                child: pw.Container(
                  color: PdfColors.white,
                  child: pw.Column(
                    children: [],
                  ),
                ),
              ),
              pw.Spacer(),
              pw.Container(
                width: _width / 3.5,
                color: PdfColors.grey300,
                child: pw.Column(
                  children: [],
                ),
              ),
            ],
          );
        },
      ),
    );
    return await pdf.save();
  }

  Future<void> savePdfFile(
    String fileName,
    Uint8List byteList,
    BuildContext context,
  ) async {
    final output = await getTemporaryDirectory();
    var filePath = "${output.path}/$fileName.pdf";

    final file = File(filePath);
    try {
      await file.writeAsBytes(byteList);
      await OpenFile.open(filePath);
    } catch (e) {
      getSnackBar(context, "$e");
    }
  }
}
