import 'package:flutter/cupertino.dart';

import '/core/export/export.dart';

class ExportPage extends StatelessWidget {
  const ExportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ExportCubit, ExportState>(
        listener: (context, state) {},
        bloc: Injection.exportCubit,
        builder: (context, state) {
          if (state is ExportLoading) {
            return _loadingWidget();
          } else if (state is ExportLoaded) {
            return _exportLoaded(context, state);
          } else if (state is ExportLoadingError) {
            return _errorWidget(state);
          } else {
            return const Center();
          }
        },
      ),
    );
  }

  Center _loadingWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CupertinoActivityIndicator(),
          Text("PDF file is loading, please wait..."),
        ],
      ),
    );
  }

  Center _errorWidget(ExportLoadingError state) {
    return Center(
      child: Text(state.message),
    );
  }

  Center _exportLoaded(BuildContext context, ExportLoaded state) {
    return const Center(
      child: Text("PDF created successfuly!"),
    );
  }
}
