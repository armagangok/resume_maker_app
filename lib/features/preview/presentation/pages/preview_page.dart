import 'package:flutter/cupertino.dart';
import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';
import '../../../../core/export/export.dart';

class PreviewPage extends StatelessWidget {
  const PreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<PreviewCubit, PreviewState>(
        bloc: Injection.previewCubit,
        listener: (context, state) {
          if (state is PreviewLoaded) {
            context.showSnackBar(
              SnackBar(
                backgroundColor: primaryColor.withOpacity(0.5),
                content: Text(
                  PreviewLoaded.stateMessage,
                  style: context.bodyLarge,
                ),
              ),
            );
          } else if (state is PreviewLoading) {
            context.showSnackBar(
              SnackBar(
                backgroundColor: primaryColor.withOpacity(0.5),
                content: Text(
                  PreviewLoaded.stateMessage,
                  style: context.bodyLarge,
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is PreviewLoading) {
            return _loadPreview;
          } else if (state is PreviewLoaded) {
            return PdfView(
              path: state.pdfFilePath,
            );
          } else if (state is PreviewLoadingError) {
            return _loadPreviewError;
          } else {
            return const Text("");
          }
        },
      ),
    );
  }

  Widget get _loadPreviewError => Center(
        child: Column(
          children: const [
            Icon(
              CupertinoIcons.exclamationmark_triangle,
              color: Colors.red,
            ),
            Text("Error occurred while pdf preview loading.")
          ],
        ),
      );

  Widget get _loadPreview => Center(
        child: Column(
          children: const [
            Text("Pdf Preview Is Being Loaded.."),
            CircularProgressIndicator(
              color: white,
            ),
          ],
        ),
      );
}
