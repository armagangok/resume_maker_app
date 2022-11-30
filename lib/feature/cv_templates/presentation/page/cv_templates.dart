import 'package:flutter/material.dart';

import '../../../../core/export/core_export.dart';
import '../../../../core/util/pdf_maker/cloud_template.dart';
import '../../../../core/util/pdf_maker/peach_puff_template.dart';
import '../cubit/cv_templates_cubit.dart';

class TemplatePage extends StatefulWidget {
  const TemplatePage({super.key});

  @override
  State<TemplatePage> createState() => _TemplatePageState();
}

class _TemplatePageState extends State<TemplatePage> {
  late final PeachPuffTemplate _peachPuffTemplate;
  late final GreyPlainTemplate _greyPlainTemplate;
  late final TemplatesCubit _templatesCubit;
  late final CloudTemplate _cloudTemplate;

  @override
  void initState() {
    _greyPlainTemplate = getIt<GreyPlainTemplate>.call();
    _peachPuffTemplate = getIt<PeachPuffTemplate>.call();
    _templatesCubit = getIt<TemplatesCubit>.call();
    _cloudTemplate = getIt<CloudTemplate>.call();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onTapUpdate: () {},
      ),
      body: BlocConsumer<TemplatesCubit, CvTemplatesState>(
        bloc: _templatesCubit,
        listener: (context, state) {},
        builder: (context, state) {
          return ListView(
            children: [
              TextButton(
                child: const Text("Peach Puff Template"),
                onPressed: () async {
                  var peachPuffPdf = await _peachPuffTemplate.createPdf();
                  await _peachPuffTemplate.savePdfFile(
                    "peach_puff_test",
                    peachPuffPdf,
                  );
                },
              ),
              TextButton(
                onPressed: () async {
                  final pdf = await _greyPlainTemplate.createPdf();
                  await _greyPlainTemplate.savePdfFile("test_file", pdf);
                },
                child: const Text("Grey Plain Template"),
              ),
              TextButton(
                onPressed: () async {
                  _cloudTemplate.buildUpWidgets();
                  final pdf = await _cloudTemplate.createPdf();

                  await _cloudTemplate.savePdfFile("fileName", pdf);
                },
                child: const Text("Cloud Template"),
              ),
            ],
          );
        },
      ),
    );
  }
}
