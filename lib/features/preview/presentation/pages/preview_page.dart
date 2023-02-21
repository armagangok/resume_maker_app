import 'package:flutter/material.dart';
import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';
import 'package:resume_maker_app/core/injection/injection_service.dart';

class PreviewPage extends StatefulWidget {
  const PreviewPage({super.key});

  @override
  State<PreviewPage> createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  @override
  void initState() {
    Injection.previewCubit.selectedTemplate.buildUpPDF();
    Injection.previewCubit.selectedTemplate.createPdf().then((value) async {
      await Injection.previewCubit.selectedTemplate
          .savePdfFile("${DateTime.now()}", value);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PdfView(
        path: Injection.previewCubit.selectedTemplate.filePath,
      ),
    );
  }
}
