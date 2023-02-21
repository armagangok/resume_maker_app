import 'package:flutter/cupertino.dart';
import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';
import '../../../../core/export/export.dart';
import '../cubit/preview_cubit.dart';

class PreviewPage extends StatefulWidget {
  const PreviewPage({super.key});

  @override
  State<PreviewPage> createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  @override
  void initState() {
    Injection.previewCubit.loadPreview();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<PreviewCubit, PreviewState>(
        bloc: Injection.previewCubit,
        listener: (context, state) {
          if (state is PreviewLoadingError || state is  PreviewLoaded) {
            
            context.showSnackBar(
               SnackBar(
                content: Text(state.pdfFilePath),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is PreviewLoading ) {
            return _loadPreview();
          } else if (state is PreviewLoaded) {
            return PdfView(
              path: state.pdfFilePath,
            );
          } else if (state is PreviewLoadingError) {
            return _loadPreviewError();
          } else {
            return const Text("");
          }
        },
      ),
    );
  }

  Center _loadPreviewError() {
    return Center(
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
  }

  Center _loadPreview() {
    return Center(
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
}
