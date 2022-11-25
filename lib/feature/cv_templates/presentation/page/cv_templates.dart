import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/export/core_export.dart';
import '../cv_templates/cv_templates_cubit.dart';

class TemplatePage extends StatefulWidget {
  const TemplatePage({super.key});

  @override
  State<TemplatePage> createState() => _TemplatePageState();
}

class _TemplatePageState extends State<TemplatePage> {
  late final TemplatesCubit _templateCubit;
  late final PdfMaker pdfMaker;
  @override
  void initState() {
    pdfMaker = getIt<PdfMaker>.call();

    _templateCubit = getIt<TemplatesCubit>.call();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Templates"),
        leading: IconButton(
          onPressed: () async {
            try {
              final pdf = await pdfMaker.createOrderPdf();
              await pdfMaker.savePdfFile("test_file", pdf, context);
            } catch (e) {
              getSnackBar(context, " $e");
            }
          },
          icon: const Icon(
            CupertinoIcons.share,
            color: Colors.white,
          ),
        ),
      ),
      body: BlocConsumer<TemplatesCubit, CvTemplatesState>(
        bloc: _templateCubit,
        listener: (context, state) {},
        builder: (context, state) {
          return ListView(
            children: const [],
          );
        },
      ),
    );
  }
}
