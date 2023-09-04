import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '/core/export/export.dart';

class PreviewPage extends StatelessWidget {
  const PreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<PreviewCubit, PreviewState>(
        bloc: Injection.previewCubit,
        listener: (context, state) => _listener(state, context),
        builder: (context, state) {
          if (state is PreviewLoading) {
            return _loadPreview;
          } else if (state is PreviewLoaded) {
            return _buildPdfView(state);
          } else if (state is PreviewLoadingError) {
            return _loadPreviewError;
          } else {
            return Text("${state.runtimeType}");
          }
        },
      ),
    );
  }

  void _listener(PreviewState state, BuildContext context) {
    if (state is PreviewLoaded) {
      context.showSnackBar(
        SnackBar(
          backgroundColor: primaryColor.withOpacity(0.5),
          content: Text(
            state.stateMessage,
            style: context.bodyLarge,
          ),
        ),
      );
    } else if (state is PreviewLoadingError) {
      context.showSnackBar(
        SnackBar(
          backgroundColor: primaryColor.withOpacity(0.5),
          content: Text(
            state.stateMessage,
            style: context.bodyLarge,
          ),
        ),
      );
    }
  }

  Widget _buildPdfView(PreviewLoaded state) {
    return SizedBox(
      height: 932.h,
      width: 430.w,
      child: SfPdfViewer.file(File(state.pdfFilePath)),
    );
  }

  Widget get _loadPreviewError => Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Center(
              child: Icon(
                CupertinoIcons.exclamationmark_triangle,
                color: Colors.red,
                size: 70.h,
              ),
            ),
            const Text(
              "Error occurred while pdf preview loading.",
              textAlign: TextAlign.center,
            )
          ],
        ),
      );

  Widget get _loadPreview => Center(
        child: ListView(
          shrinkWrap: true,
          children: const [
            Text(
              "Pdf Preview Is Being Loaded..",
              textAlign: TextAlign.center,
            ),
            Center(
              child: CupertinoActivityIndicator(
                color: white,
              ),
            ),
          ],
        ),
      );
}
