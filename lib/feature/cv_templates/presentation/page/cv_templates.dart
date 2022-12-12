import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widget/custom_appbar.dart';
import '../../../../core/widget/snackbar.dart';
import '../cubit/cv_templates_cubit.dart';
import '../../../../injection_container.dart';

class TemplatePage extends StatefulWidget {
  const TemplatePage({super.key});

  @override
  State<TemplatePage> createState() => _TemplatePageState();
}

class _TemplatePageState extends State<TemplatePage> {
  late final TemplatesCubit _templatesCubit;

  @override
  void initState() {
    _templatesCubit = getIt<TemplatesCubit>.call();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(onTapUpdate: () {}),
      body: BlocConsumer<TemplatesCubit, TemplateState>(
        bloc: _templatesCubit,
        listener: (context, state) {
          if (state is PdfErrorState) {
            getSnackBar(context, state.errorMessage);
          }
        },
        builder: (context, state) {
          print(state);
          if (state is PdfIsBeingCreatedState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView(
              children: [
                TextButton(
                  onPressed: () async {
                    await _templatesCubit.createCloudPdf();
                  },
                  child: const Text("Cloud Template"),
                ),
                TextButton(
                  child: const Text("Peach Puff Template"),
                  onPressed: () async {
                    await _templatesCubit.createPeachPuffPdf();
                  },
                ),
                TextButton(
                  onPressed: () async {
                    await _templatesCubit.createGreyPdf();
                  },
                  child: const Text("Grey Plain Template"),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
